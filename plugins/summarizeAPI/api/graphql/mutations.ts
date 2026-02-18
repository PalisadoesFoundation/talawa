import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { z } from 'zod';
import { eq } from 'drizzle-orm';
import {
  SummarizeAPIResultRef,
  SummarizeAPIConfigRef,
  SummarizeAPITestResultRef,
} from './types';
import {
  SummarizeAPIInput,
  summarizeAPIInputSchema,
  SummarizeAPIConfigInput,
  summarizeAPIConfigInputSchema,
} from './inputs';
import { configTable } from '../database/tables';

const summarizeArgsSchema = z.object({
  input: summarizeAPIInputSchema,
});

const configArgsSchema = z.object({
  input: summarizeAPIConfigInputSchema,
});

// Helper function to get config
async function getConfig(db: GraphQLContext['drizzleClient']) {
  const configs = await db
    .select()
    .from(configTable)
    .where(eq(configTable.id, 'default'))
    .limit(1);

  if (configs.length === 0) {
    throw new Error('Configuration not found. Please configure the API first.');
  }

  const config = configs[0];
  if (!config) {
    throw new Error('Configuration not found. Please configure the API first.');
  }

  if (!config.isEnabled) {
    throw new Error(
      'SummarizeAPI is not enabled. Please enable it in settings.',
    );
  }

  if (!config.apiEndpoint || !config.apiKey) {
    throw new Error('API endpoint or API key not configured.');
  }

  return config;
}

// Helper function to call Hugging Face API
async function callSummarizeAPI(
  text: string,
  config: {
    apiEndpoint: string;
    apiKey: string;
    maxLength: number;
    timeoutSeconds: number;
  },
): Promise<string> {
  const controller = new AbortController();
  const timeoutId = setTimeout(
    () => controller.abort(),
    config.timeoutSeconds * 1000,
  );

  try {
    const headers: Record<string, string> = {
      Authorization: `Bearer ${config.apiKey}`,
    };

    // Hugging Face API format
    headers['Content-Type'] = 'application/json';
    const body = JSON.stringify({
      inputs: text,
      parameters: {
        max_length: config.maxLength,
        min_length: 30,
      },
    });

    const response = await fetch(config.apiEndpoint, {
      method: 'POST',
      headers,
      body,
      signal: controller.signal,
    });

    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(
        `API request failed: HTTP ${response.status} - ${errorText}`,
      );
    }

    // Hugging Face API response format
    let summary: string;
    const data = await response.json();

    // Hugging Face returns array: [{"summary_text": "..."}] or {"error": "..."}
    if (data.error) {
      throw new Error(`Hugging Face API error: ${data.error}`);
    }

    if (Array.isArray(data) && data.length > 0) {
      summary = data[0]?.summary_text || '';
    } else {
      summary = data.summary_text || '';
    }

    if (!summary.trim()) {
      throw new Error('API returned empty summary');
    }

    return summary.trim();
  } catch (error) {
    if (error instanceof Error) {
      if (error.name === 'AbortError') {
        throw new Error(
          `API request timed out after ${config.timeoutSeconds} seconds`,
        );
      }
      throw error;
    }
    throw new Error('Unknown error calling API');
  } finally {
    clearTimeout(timeoutId);
  }
}

// Summarize text resolver
export async function summarizeTextResolver(
  _parent: unknown,
  args: z.infer<typeof summarizeArgsSchema>,
  ctx: GraphQLContext,
) {
  const { success, data, error } = summarizeArgsSchema.safeParse(args);
  if (!success) {
    throw new Error(
      `invalid_arguments: ${error.issues.map((i) => i.message).join(', ')}`,
    );
  }

  const config = await getConfig(ctx.drizzleClient);

  const summary = await callSummarizeAPI(data.input.text, {
    apiEndpoint: config.apiEndpoint!,
    apiKey: config.apiKey!,
    maxLength: config.maxLength,
    timeoutSeconds: config.timeoutSeconds,
  });

  return {
    summary,
    originalLength: data.input.text.length,
    summaryLength: summary.length,
    postId: data.input.postId ?? null,
  };
}

// Update config resolver
export async function updateConfigResolver(
  _parent: unknown,
  args: z.infer<typeof configArgsSchema>,
  ctx: GraphQLContext,
) {
  const { success, data, error } = configArgsSchema.safeParse(args);
  if (!success) {
    throw new Error(
      `invalid_arguments: ${error.issues.map((i) => i.message).join(', ')}`,
    );
  }

  try {
    // Check if config exists
    const existing = await ctx.drizzleClient
      .select()
      .from(configTable)
      .where(eq(configTable.id, 'default'))
      .limit(1);

    let config;
    if (existing.length > 0) {
      // Update existing config
      const [updated] = await ctx.drizzleClient
        .update(configTable)
        .set({
          apiEndpoint: data.input.apiEndpoint,
          apiKey: data.input.apiKey,
          isEnabled: data.input.isEnabled,
          maxLength: data.input.maxLength,
          timeoutSeconds: data.input.timeoutSeconds,
        })
        .where(eq(configTable.id, 'default'))
        .returning();
      config = updated;
    } else {
      // Create new config
      const [created] = await ctx.drizzleClient
        .insert(configTable)
        .values({
          id: 'default',
          apiEndpoint: data.input.apiEndpoint,
          apiKey: data.input.apiKey,
          isEnabled: data.input.isEnabled,
          maxLength: data.input.maxLength,
          timeoutSeconds: data.input.timeoutSeconds,
        })
        .returning();
      config = created;
    }

    return {
      apiEndpoint: config?.apiEndpoint || null,
      apiKey: config?.apiKey || null,
      isEnabled: config?.isEnabled || false,
      maxLength: config?.maxLength || 150,
      timeoutSeconds: config?.timeoutSeconds || 30,
    };
  } catch (error) {
    ctx.log?.error('Error updating SummarizeAPI config:', error);
    throw new Error('Failed to update configuration');
  }
}

// Test setup resolver
export async function testSetupResolver(
  _parent: unknown,
  _args: unknown,
  ctx: GraphQLContext,
) {
  try {
    const config = await getConfig(ctx.drizzleClient);

    // Test with a simple text
    const testText =
      'This is a test message to verify the API connection is working correctly. The summarization API should process this text and return a shorter version.';

    const summary = await callSummarizeAPI(testText, {
      apiEndpoint: config.apiEndpoint!,
      apiKey: config.apiKey!,
      maxLength: config.maxLength,
      timeoutSeconds: config.timeoutSeconds,
    });

    return {
      success: true,
      message: `API test successful! Summary: "${summary.substring(0, 50)}${summary.length > 50 ? '...' : ''}"`,
    };
  } catch (error) {
    return {
      success: false,
      message:
        error instanceof Error
          ? error.message
          : 'Unknown error testing API connection',
    };
  }
}

// Register all SummarizeAPI mutations with the builder
export function registerSummarizeAPIMutations(b: typeof builder) {
  b.mutationField('summarizeText', (t) =>
    t.field({
      type: SummarizeAPIResultRef,
      args: {
        input: t.arg({ type: SummarizeAPIInput, required: true }),
      },
      description: 'Summarize text using external API',
      resolve: summarizeTextResolver,
    }),
  );

  b.mutationField('updateConfig', (t) =>
    t.field({
      type: SummarizeAPIConfigRef,
      args: {
        input: t.arg({ type: SummarizeAPIConfigInput, required: true }),
      },
      description: 'Update SummarizeAPI configuration',
      resolve: updateConfigResolver,
    }),
  );

  b.mutationField('testSetup', (t) =>
    t.field({
      type: SummarizeAPITestResultRef,
      description: 'Test SummarizeAPI connection and configuration',
      resolve: testSetupResolver,
    }),
  );
}
