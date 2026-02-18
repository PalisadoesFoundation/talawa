import { builder } from '~/src/graphql/builder';

// Health check resolver
export async function summarizeT5HealthResolver() {
  return 'ok';
}

// Register all SummarizeT5 queries with the builder
export function registerSummarizeQueries(
  builderInstance: typeof builder,
): void {
  builderInstance.queryField('summarizeT5Health', (t) =>
    t.field({
      type: 'String',
      description: 'Health status for SummarizeT5 plugin',
      resolve: summarizeT5HealthResolver,
    }),
  );
}
