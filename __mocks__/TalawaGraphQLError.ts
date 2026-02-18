export class TalawaGraphQLError extends Error {
  constructor(message: string, _code?: string) {
    super(message);
    this.name = 'TalawaGraphQLError';
  }
}
