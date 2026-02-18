import { builder } from '~/src/graphql/builder';
import type { GraphQLContext } from '~/src/graphql/context';
import { z } from 'zod';
import { SummarizeResultRef } from './types';
import { SummarizeInput, summarizeInputSchema } from './inputs';

const summarizeArgsSchema = z.object({
  input: summarizeInputSchema,
});

export async function summarizeTextResolver(
  _parent: unknown,
  args: z.infer<typeof summarizeArgsSchema>,
  _ctx: GraphQLContext,
) {
  const { success, data, error } = summarizeArgsSchema.safeParse(args);
  if (!success) {
    throw new Error(
      `invalid_arguments: ${error.issues.map((i) => i.message).join(', ')}`,
    );
  }

  // Inside a container, localhost points to the container itself, not the host.
  // Prefer host.docker.internal which resolves to the host on Docker Desktop/Linux.
  const endpoint =
    process.env.T5_SERVICE_URL || 'http://host.docker.internal:8000/summarize';
  const payload = {
    text: data.input.text,
    max_summary_length: 150,
  } as const;

  const resp = await fetch(endpoint, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload),
  });

  if (!resp.ok) {
    throw new Error(`summarize service error: HTTP ${resp.status}`);
  }
  const json = (await resp.json()) as { summary?: string };
  const summary = (json.summary || '').toString();

  return {
    summary,
    originalLength: data.input.text.length,
    summaryLength: summary.length,
    postId: data.input.postId ?? null,
  };
}

export function registerSummarizeMutations(b: typeof builder) {
  b.mutationField('summarizeText', (t) =>
    t.field({
      type: SummarizeResultRef,
      args: {
        input: t.arg({ type: SummarizeInput, required: true }),
      },
      description: 'Summarize text to ~10 words (demo)',
      resolve: summarizeTextResolver,
    }),
  );
}
