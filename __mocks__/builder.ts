// Mock for Pothos builder
export const builder = {
  objectRef: (_name: string) => ({
    implement: () => {},
  }),
  queryField: (_name: string, _config: unknown) => {},
  mutationField: (_name: string, _config: unknown) => {},
  inputRef: (_name: string) => ({
    implement: () => {},
  }),
  scalarType: (_name: string, _config: unknown) => {},
  arg: {
    string: () => {},
    int: () => {},
    float: () => {},
    boolean: () => {},
    id: () => {},
  },
  inputType: () => {},
};
