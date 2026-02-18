import { z } from 'zod';
import { builder } from '~/src/graphql/builder';

export const summarizeInputSchema = z.object({
  text: z.string().min(1, 'text is required'),
  postId: z.string().optional().nullable(),
});

export const SummarizeInput = builder
  .inputRef<z.infer<typeof summarizeInputSchema>>('SummarizeInput')
  .implement({
    description: 'Input for summarizing text',
    fields: (t) => ({
      text: t.string({ required: true }),
      postId: t.string({ required: false, nullable: true }),
    }),
  });
