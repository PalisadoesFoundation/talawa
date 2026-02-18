/**
 * Plugin Types
 *
 * Shared type definitions for plugin lifecycle and context interfaces.
 * All plugins should import these interfaces to ensure consistent lifecycle behavior.
 *
 * @module types
 */

/**
 * JSON-serializable value type for safe logging
 * Prevents logging of functions, class instances, and non-serializable values
 */
export type JsonValue =
  | string
  | number
  | boolean
  | null
  | JsonValue[]
  | { [key: string]: JsonValue };

/**
 * Allowed types for logger arguments
 * Constrained to JSON-serializable values to avoid logging secrets or circular references
 */
export type LogArg = JsonValue;

/**
 * Default plugin configuration type
 */
export type PluginConfig = Record<string, JsonValue>;

/**
 * Plugin context provided to all lifecycle hooks
 * Contains database, logger, and other shared resources
 *
 * ## Property Availability
 *
 * | Property | Availability | Notes |
 * |----------|--------------|-------|
 * | `db` | Optional - provided when db access is needed | Guard for undefined; throw PluginError if required but missing |
 * | `logger` | **Required** - guaranteed in all hooks | Always present; use `context.logger.info()` |
 * | `config` | Guaranteed after onInstall | May be undefined in onInstall; always present in other hooks |
 *
 * ## Recommended Fallbacks
 * - If `db` is undefined when required, throw a descriptive error
 * - If `config` is missing, use sensible defaults or throw during onActivate
 *
 * @template TDb - Type for the database connection (e.g., DrizzleORM instance)
 * @template TConfig - Type for plugin configuration (defaults to PluginConfig)
 *
 * @example
 * ```typescript
 * onActivate: async (context: IPluginContext<MyDb, MyConfig>) => {
 *   if (!context.db) {
 *     throw new Error('Database connection required for Razorpay plugin');
 *   }
 *   context.logger.info('Razorpay plugin activated');
 * }
 * ```
 */
export interface IPluginContext<TDb = unknown, TConfig = PluginConfig> {
  /**
   * Database connection for plugin data access
   * @remarks May be undefined if the host system doesn't provide db access for this hook
   */
  db?: TDb;

  /**
   * Logger instance for plugin logging (use instead of console.*)
   * @remarks Guaranteed to be present by the plugin host in all lifecycle hooks.
   * This property is required and always available.
   */
  logger: {
    info: (...args: LogArg[]) => void;
    warn: (...args: LogArg[]) => void;
    error: (...args: LogArg[]) => void;
    debug: (...args: LogArg[]) => void;
  };

  /**
   * Plugin configuration from manifest
   * @remarks Guaranteed after onInstall; may be undefined during initial onInstall call
   */
  config?: TConfig;

  /**
   * Current plugin activation state (for idempotency checks)
   * @remarks Plugins should check this before performing activation-only tasks
   */
  isActive?: boolean;

  /**
   * GraphQL instance for plugin schema registration and execution
   * @remarks Optional - provided when GraphQL access is needed
   */
  graphql?: IPluginGraphQL;

  /**
   * PubSub instance for plugin real-time events
   * @remarks Optional - provided when PubSub access is needed
   */
  pubsub?: IPluginPubSub;
}

/**
 * Interface for GraphQL operations available to plugins
 */
export interface IPluginGraphQL {
  execute<T = unknown>(
    query: string,
    variables?: Record<string, JsonValue>,
  ): Promise<T>;
}

/**
 * Interface for PubSub operations available to plugins
 */
export interface IPluginPubSub {
  publish<T = unknown>(triggerName: string, payload: T): Promise<void> | void;
  asyncIterator<T = unknown>(triggers: string | string[]): AsyncIterator<T>;
}

/**
 * Plugin lifecycle interface
 *
 * Defines the contract for plugin lifecycle hooks that must be implemented
 * by all plugins to ensure proper initialization, activation, and cleanup.
 * All hooks receive a context object for accessing shared resources.
 *
 * ## Error Handling
 *
 * Lifecycle hooks are allowed to throw or return rejected Promises to signal failure.
 * Use descriptive Error messages (or a custom PluginError class) so the host can
 * distinguish plugin errors from system errors.
 *
 * **Caller behavior on failure:**
 * - The host stops the current lifecycle step
 * - The error bubbles up to the host application
 * - The host may attempt rollback (call onDeactivate/onUninstall) or retry
 * - Plugins should implement compensating/rollback logic where meaningful
 *
 * ## Required vs Optional Hooks
 *
 * | Hook | Recommendation | Notes |
 * |------|----------------|-------|
 * | `onActivate` | **Recommended** | Primary hook for setup; always implement |
 * | `onDeactivate` | **Recommended** | Cleanup resources; pair with onActivate |
 * | `onInstall` | Optional | First-time setup; not called on every activation |
 * | `onUninstall` | Optional | Data cleanup; ensure complete removal |
 * | `onUpdate` | Optional | Version migrations; only when schema changes |
 * | `onLoad`/`onUnload` | Rarely needed | Low-level memory management |
 *
 * **Note:** `onActivate` may be invoked without a prior `onInstall` call if the
 * plugin was pre-installed or the system is restoring state. Guard accordingly.
 *
 * ## Idempotency Requirements
 *
 * All hooks MUST be safe to run multiple times (idempotent):
 *
 * - **onInstall**: Check if already installed before creating resources
 * - **onActivate**: Check `context.isActive` to prevent double-activation
 * - **onDeactivate**: Safe to call even if already deactivated
 * - **onUninstall**: Safe to call even if resources don't exist
 *
 * @example
 * ```typescript
 * const MyPlugin: IPluginLifecycle = {
 *   onActivate: async (context) => {
 *     if (context.isActive) {
 *       context.logger.warn('Plugin already active, skipping activation');
 *       return;
 *     }
 *     // Perform activation...
 *   },
 *   onDeactivate: async (context) => {
 *     // Cleanup resources...
 *   },
 * };
 * ```
 *
 * @template TDb - Type for the database connection
 * @template TConfig - Type for plugin configuration
 */
export interface IPluginLifecycle<TDb = unknown, TConfig = PluginConfig> {
  /**
   * Called when plugin is loaded into memory
   *
   * Use for initial setup and resource allocation that must happen before
   * any other hooks. Rarely needed; prefer onActivate for most setup.
   *
   * @param context - Plugin context (db may not be available yet)
   * @throws Error if loading fails; host will not proceed with activation
   */
  onLoad?: (context: IPluginContext<TDb, TConfig>) => Promise<void>;

  /**
   * Called when plugin is activated
   *
   * **Primary setup hook** - Use for validation, SDK initialization, and resource setup.
   * This is the most commonly implemented hook.
   *
   * @remarks
   * - Check `context.isActive` for idempotency
   * - May be called without prior onInstall (e.g., system restore)
   * - If activation fails, throw an Error; host may call onDeactivate for cleanup
   *
   * @param context - Plugin context with db, logger, and config
   * @throws Error if activation fails; message should be user-friendly
   */
  onActivate?: (context: IPluginContext<TDb, TConfig>) => Promise<void>;

  /**
   * Called when plugin is deactivated
   *
   * Use for cleanup, canceling in-flight operations, and releasing resources.
   * Should be safe to call multiple times (idempotent).
   *
   * @remarks
   * - Called when user disables plugin or before uninstall
   * - May be called as rollback if onActivate fails
   * - Should not throw; log errors and continue cleanup
   *
   * @param context - Plugin context with db, logger, and config
   */
  onDeactivate?: (context: IPluginContext<TDb, TConfig>) => Promise<void>;

  /**
   * Called when plugin is unloaded from memory
   *
   * Use for final cleanup and resource release. Rarely needed.
   *
   * @param context - Plugin context (some resources may already be unavailable)
   */
  onUnload?: (context: IPluginContext<TDb, TConfig>) => Promise<void>;

  /**
   * Called when plugin is first installed
   *
   * Use for creating default configuration, database records, and registering
   * webhooks. Only called once per installation (not on every activation).
   *
   * @remarks
   * - `context.config` may be undefined (set defaults here)
   * - Must be idempotent: check if already installed before creating resources
   * - If installation fails, throw Error; host will not proceed
   *
   * @param context - Plugin context with db and logger
   * @throws Error if installation fails; message should describe what went wrong
   */
  onInstall?: (context: IPluginContext<TDb, TConfig>) => Promise<void>;

  /**
   * Called when plugin is uninstalled
   *
   * Use for removing configuration, cleaning up data, and unregistering webhooks.
   * Should completely remove plugin presence from the system.
   *
   * @remarks
   * - Must be idempotent: safe to call even if resources don't exist
   * - Should not throw; log errors and continue cleanup
   *
   * @param context - Plugin context with db, logger, and config
   */
  onUninstall?: (context: IPluginContext<TDb, TConfig>) => Promise<void>;

  /**
   * Called when plugin is updated from one version to another
   *
   * Use for database migrations, configuration transformations, and data
   * format updates between versions.
   *
   * @remarks
   * - Compare fromVersion and toVersion to determine needed migrations
   * - Must be idempotent: safe to run the same migration multiple times
   * - If migration fails, throw Error; host may attempt rollback
   *
   * @param fromVersion - Previous plugin version (semver string)
   * @param toVersion - New plugin version (semver string)
   * @param context - Plugin context with db, logger, and config
   * @throws Error if migration fails; host may rollback to previous version
   *
   * @example
   * ```typescript
   * onUpdate: async (fromVersion, toVersion, context) => {
   *   if (semver.lt(fromVersion, '2.0.0') && semver.gte(toVersion, '2.0.0')) {
   *     // Migrate database schema from v1 to v2
   *     await migrateToV2(context.db);
   *   }
   * }
   * ```
   */
  onUpdate?: (
    fromVersion: string,
    toVersion: string,
    context: IPluginContext<TDb, TConfig>,
  ) => Promise<void>;
}

/**
 * Custom error class for plugin-related errors
 *
 * Use this to throw/catch plugin-specific errors that can be distinguished
 * from generic system errors. Includes plugin name and hook context for debugging.
 *
 * @example
 * ```typescript
 * throw new PluginError('Database connection required', 'Razorpay', 'onActivate');
 * ```
 */
export class PluginError extends Error {
  /** Name of the plugin that threw the error */
  readonly pluginName?: string;

  /** Lifecycle hook where the error occurred */
  readonly hook?: keyof IPluginLifecycle;

  constructor(
    message: string,
    pluginName?: string,
    hook?: keyof IPluginLifecycle,
  ) {
    super(message);
    this.name = 'PluginError';
    this.pluginName = pluginName;
    this.hook = hook;

    // Maintains proper stack trace for where error was thrown (V8 engines)
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, PluginError);
    }
  }
}
