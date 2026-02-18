import { pgTable, text, timestamp, uuid, integer } from 'drizzle-orm/pg-core';

/**
 * Plugin Map Polls Table Definition.
 *
 * Represents the `plugin_map_polls` table in the database.
 * This table stores "polls" or requests made from the frontend to specific extension points,
 * serving as a logging mechanism to visualize plugin activity.
 *
 * Columns:
 * - `id`: UUID primary key.
 * - `pollNumber`: Incrementing integer sequence for easy human reference.
 * - `userId`: ID of the user triggering the request.
 * - `userRole`: Role of the user (e.g., 'User', 'Admin').
 * - `organizationId`: Optional organization ID context.
 * - `extensionPoint`: The specific extension point triggered (e.g., 'RA1', 'RU2').
 * - `createdAt`: Timestamp of creation.
 */
export const pollsTable = pgTable('plugin_map_polls', {
  id: uuid('id').primaryKey().defaultRandom(),
  pollNumber: integer('poll_number').notNull(), // Auto-incrementing poll number
  userId: text('user_id').notNull(), // The user that is polling from the frontend
  userRole: text('user_role').notNull(), // Role of user that is polling
  organizationId: text('organization_id'), // Only if is a org specific route, null for global route
  extensionPoint: text('extension_point').notNull(), // Frontend sends the extension point ID (RA1, RA2, etc.)
  createdAt: timestamp('created_at').defaultNow(),
});
