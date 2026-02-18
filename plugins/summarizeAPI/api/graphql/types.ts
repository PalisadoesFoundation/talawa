import { builder } from '~/src/graphql/builder';

export const SummarizeAPIResultRef = builder.objectRef<{
  summary: string;
  originalLength: number;
  summaryLength: number;
  postId?: string | null;
}>('SummarizeAPIResult');

SummarizeAPIResultRef.implement({
  fields: (t) => ({
    summary: t.exposeString('summary'),
    originalLength: t.exposeInt('originalLength'),
    summaryLength: t.exposeInt('summaryLength'),
    postId: t.exposeString('postId', { nullable: true }),
  }),
});

export const SummarizeAPIConfigRef = builder.objectRef<{
  apiEndpoint: string | null;
  apiKey: string | null;
  isEnabled: boolean;
  maxLength: number;
  timeoutSeconds: number;
}>('SummarizeAPIConfig');

SummarizeAPIConfigRef.implement({
  fields: (t) => ({
    apiEndpoint: t.exposeString('apiEndpoint', { nullable: true }),
    apiKey: t.exposeString('apiKey', { nullable: true }),
    isEnabled: t.exposeBoolean('isEnabled'),
    maxLength: t.exposeInt('maxLength'),
    timeoutSeconds: t.exposeInt('timeoutSeconds'),
  }),
});

export const SummarizeAPITestResultRef = builder.objectRef<{
  success: boolean;
  message: string;
}>('SummarizeAPITestResult');

SummarizeAPITestResultRef.implement({
  fields: (t) => ({
    success: t.exposeBoolean('success'),
    message: t.exposeString('message'),
  }),
});
