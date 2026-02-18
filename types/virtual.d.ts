// Virtual module declarations for missing source files
// These modules are mocked in test/setup/globalMocks.ts

declare module '~/src/utilities/TalawaGraphQLError' {
  export class TalawaGraphQLError extends Error {
    extensions: {
      code: string;
      [key: string]: any;
    };
    constructor(opts: {
      message: string;
      extensions: { code: string; [key: string]: any };
    });
  }
}

declare module '~/src/graphql/context' {
  export interface GraphQLContext {
    user?: any;
    organization?: any;
    drizzleClient?: any;
    log?: any;
    isAdmin?: boolean;
    [key: string]: any;
  }
}

declare module '~/src/graphql/builder' {
  export const builder: any;
}

declare module 'utils/useLocalstorage' {
  const useLocalStorage: () => {
    getItem: (key: string) => string | null;
    setItem: (key: string, value: string) => void;
    removeItem: (key: string) => void;
  };
  export default useLocalStorage;
}
