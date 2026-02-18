import { pgTable, text, boolean, integer } from 'drizzle-orm/pg-core';

/**
 * SummarizeAPI Configuration Table
 * Stores Hugging Face API endpoint and authentication settings
 */
export const configTable = pgTable('summarize_api_config', {
  id: text('id').primaryKey().default('default'),
  apiEndpoint: text('api_endpoint'),
  apiKey: text('api_key'),
  isEnabled: boolean('is_enabled').default(false).notNull(),
  maxLength: integer('max_length').default(150).notNull(),
  timeoutSeconds: integer('timeout_seconds').default(30).notNull(),
});

export type SummarizeAPIConfig = typeof configTable.$inferSelect;
export type SummarizeAPIConfigInsert = typeof configTable.$inferInsert;
