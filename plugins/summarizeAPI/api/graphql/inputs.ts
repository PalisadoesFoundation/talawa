import { z } from 'zod';
import { builder } from '~/src/graphql/builder';

export const summarizeAPIInputSchema = z.object({
  text: z.string().min(1, 'text is required'),
  postId: z.string().optional().nullable(),
});

export const SummarizeAPIInput = builder
  .inputRef<z.infer<typeof summarizeAPIInputSchema>>('SummarizeAPIInput')
  .implement({
    description: 'Input for summarizing text using external API',
    fields: (t) => ({
      text: t.string({ required: true }),
      postId: t.string({ required: false, nullable: true }),
    }),
  });

export const summarizeAPIConfigInputSchema = z.object({
  apiEndpoint: z.url().optional().nullable(),
  apiKey: z.string().optional().nullable(),
  isEnabled: z.boolean(),
  maxLength: z.number().int().min(50).max(500),
  timeoutSeconds: z.number().int().min(5).max(120),
});

export const SummarizeAPIConfigInput = builder
  .inputRef<
    z.infer<typeof summarizeAPIConfigInputSchema>
  >('SummarizeAPIConfigInput')
  .implement({
    description: 'Input for updating SummarizeAPI (Hugging Face) configuration',
    fields: (t) => ({
      apiEndpoint: t.string({ required: false, nullable: true }),
      apiKey: t.string({ required: false, nullable: true }),
      isEnabled: t.boolean({ required: true }),
      maxLength: t.int({ required: true }),
      timeoutSeconds: t.int({ required: true }),
    }),
  });
