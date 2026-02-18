import { z } from 'zod';
import { builder } from '~/src/graphql/builder';

// PluginMapPoll Input
export const pluginMapPollInputSchema = z.object({
  userId: z.string(),
  userRole: z.string(),
  organizationId: z.string().nullable().optional(),
  extensionPoint: z.string(),
});

export const PluginMapPollInput = builder
  .inputRef<z.infer<typeof pluginMapPollInputSchema>>('PluginMapPollInput')
  .implement({
    description: 'Input for logging a plugin map poll',
    fields: (t) => ({
      userId: t.string({ required: true }),
      userRole: t.string({ required: true }),
      organizationId: t.string({ required: false }),
      extensionPoint: t.string({ required: true }),
    }),
  });

// GetPluginMapPolls Input
export const getPluginMapPollsInputSchema = z.object({
  userId: z.string().nullable().optional(),
  userRole: z.string().nullable().optional(),
  organizationId: z.string().nullable().optional(),
  extensionPoint: z.string().nullable().optional(),
});

export const GetPluginMapPollsInput = builder
  .inputRef<
    z.infer<typeof getPluginMapPollsInputSchema>
  >('GetPluginMapPollsInput')
  .implement({
    description: 'Input for getting plugin map polls',
    fields: (t) => ({
      userId: t.string({ required: false }),
      userRole: t.string({ required: false }),
      organizationId: t.string({ required: false }),
      extensionPoint: t.string({ required: false }),
    }),
  });
