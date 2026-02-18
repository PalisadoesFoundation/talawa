export interface IPluginMapRequest {
  id: string;
  pollNumber: number;
  userId: string;
  userRole: string;
  organizationId: string | null;
  extensionPoint: string;
  createdAt: string;
}

export interface IPluginMapRequestInput {
  userId: string;
  userRole: string;
  organizationId: string | null;
  extensionPoint: string;
}

export interface IGetPluginMapRequestsInput {
  extensionPoint?: string;
  userRole?: string;
  organizationId?: string | null;
  userId?: string;
  limit?: number;
  offset?: number;
}

export interface IGetPluginMapRequestsResponse {
  plugin_map_getPluginMapRequests: {
    requests: IPluginMapRequest[];
    totalCount: number;
    hasMore: boolean;
  };
}

export interface ILogPluginMapRequestResponse {
  plugin_map_logPluginMapRequest: IPluginMapRequest | null;
}

export interface ILogPluginMapRequestVariables {
  input: IPluginMapRequestInput;
}

export interface IGetPluginMapRequestsVariables {
  input: IGetPluginMapRequestsInput;
}
