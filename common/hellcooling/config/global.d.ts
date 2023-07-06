export {};

declare global {
  const hh: {
    constants: Record<string, string> & { categories: Record<string, string> };
    // TODO: Maybe turn this into something that, based on the moduleName, can
    // fetch an ext's actual config type and return that instead.
    getModuleOptions: (moduleName: string) => Record<string, any>;
  };
}
