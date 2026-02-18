import { builder } from '~/src/graphql/builder';

export const SummarizeResultRef = builder.objectRef<{
  summary: string;
  originalLength: number;
  summaryLength: number;
  postId?: string | null;
}>('SummarizeResult');

SummarizeResultRef.implement({
  fields: (t) => ({
    summary: t.exposeString('summary'),
    originalLength: t.exposeInt('originalLength'),
    summaryLength: t.exposeInt('summaryLength'),
    postId: t.exposeString('postId', { nullable: true }),
  }),
});
