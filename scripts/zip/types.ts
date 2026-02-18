// Shared types for zip scripts

/**
 * Archive warning interface matching archiver library's warning handler
 */
export interface ArchiveWarning {
  code?: string;
  message: string;
  data?: unknown;
}
