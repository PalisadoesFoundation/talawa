import type { IPluginContext, IPluginLifecycle } from '../../types';

export * from './graphql/types';
export * from './graphql/inputs';
export * from './graphql/mutations';
export * from './graphql/queries';

export async function onLoad(_context: IPluginContext): Promise<void> {}
export async function onActivate(_context: IPluginContext): Promise<void> {}
export async function onDeactivate(_context: IPluginContext): Promise<void> {}
export async function onUnload(_context: IPluginContext): Promise<void> {}

const SummarizeT5Plugin: IPluginLifecycle = {
  onLoad,
  onActivate,
  onDeactivate,
  onUnload,
};

export default SummarizeT5Plugin;
