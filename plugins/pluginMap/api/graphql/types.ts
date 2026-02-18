import { builder } from '~/src/graphql/builder';

// ExtensionPoint type
export const ExtensionPointRef = builder.objectRef<{
  id: string;
  name: string;
  description: string;
  context: string;
  userRole: string;
  features: string[];
}>('ExtensionPoint');

ExtensionPointRef.implement({
  fields: (t) => ({
    id: t.exposeString('id'),
    name: t.exposeString('name'),
    description: t.exposeString('description'),
    context: t.exposeString('context'),
    userRole: t.exposeString('userRole'),
    features: t.exposeStringList('features'),
  }),
});

// ExtensionPointsOverview type
export const ExtensionPointsOverviewRef = builder.objectRef<{
  extensionPoints: Array<{
    id: string;
    name: string;
    description: string;
    context: string;
    userRole: string;
    features: string[];
  }>;
  totalCount: number;
  description: string;
}>('ExtensionPointsOverview');

ExtensionPointsOverviewRef.implement({
  fields: (t) => ({
    extensionPoints: t.field({
      type: t.listRef(ExtensionPointRef),
      resolve: (parent) => parent.extensionPoints,
    }),
    totalCount: t.exposeInt('totalCount'),
    description: t.exposeString('description'),
  }),
});

// PluginMapRequest type
export const PluginMapRequestRef = builder.objectRef<{
  id: string;
  pollNumber: number;
  userId: string;
  userRole: string;
  organizationId: string | null;
  extensionPoint: string;
  createdAt: Date | null;
}>('PluginMapRequest');

PluginMapRequestRef.implement({
  fields: (t) => ({
    id: t.exposeID('id'),
    pollNumber: t.exposeInt('pollNumber'),
    userId: t.exposeString('userId'),
    userRole: t.exposeString('userRole'),
    organizationId: t.exposeString('organizationId', { nullable: true }),
    extensionPoint: t.exposeString('extensionPoint'),
    createdAt: t.expose('createdAt', { type: 'DateTime' }),
  }),
});

// PluginMapRequestsResult type
export const PluginMapRequestsResultRef = builder.objectRef<{
  requests: Array<{
    id: string;
    pollNumber: number;
    userId: string;
    userRole: string;
    organizationId: string | null;
    extensionPoint: string;
    createdAt: Date | null;
  }>;
  totalCount: number;
  hasMore: boolean;
}>('PluginMapRequestsResult');

PluginMapRequestsResultRef.implement({
  fields: (t) => ({
    requests: t.field({
      type: t.listRef(PluginMapRequestRef),
      resolve: (parent) => parent.requests,
    }),
    totalCount: t.exposeInt('totalCount'),
    hasMore: t.exposeBoolean('hasMore'),
  }),
});

// PluginMapPoll type
export const PluginMapPollRef = builder.objectRef<{
  id: string;
  pollNumber: number;
  userId: string;
  userRole: string;
  organizationId: string | null;
  extensionPoint: string;
  createdAt: Date | null;
}>('PluginMapPoll');

PluginMapPollRef.implement({
  fields: (t) => ({
    id: t.exposeID('id'),
    pollNumber: t.exposeInt('pollNumber'),
    userId: t.exposeString('userId'),
    userRole: t.exposeString('userRole'),
    organizationId: t.exposeString('organizationId', { nullable: true }),
    extensionPoint: t.exposeString('extensionPoint'),
    createdAt: t.expose('createdAt', { type: 'DateTime' }),
  }),
});

// PluginMapPollsResult type
export const PluginMapPollsResultRef = builder.objectRef<{
  polls: Array<{
    id: string;
    pollNumber: number;
    userId: string;
    userRole: string;
    organizationId: string | null;
    extensionPoint: string;
    createdAt: Date | null;
  }>;
  totalCount: number;
  hasMore: boolean;
}>('PluginMapPollsResult');

PluginMapPollsResultRef.implement({
  fields: (t) => ({
    polls: t.field({
      type: t.listRef(PluginMapPollRef),
      resolve: (parent) => parent.polls,
    }),
    totalCount: t.exposeInt('totalCount'),
    hasMore: t.exposeBoolean('hasMore'),
  }),
});

// ClearPollsResult type
export const ClearPollsResultRef = builder.objectRef<{
  success: boolean;
  clearedCount: number;
  message: string;
}>('ClearPollsResult');

ClearPollsResultRef.implement({
  fields: (t) => ({
    success: t.exposeBoolean('success'),
    clearedCount: t.exposeInt('clearedCount'),
    message: t.exposeString('message'),
  }),
});
