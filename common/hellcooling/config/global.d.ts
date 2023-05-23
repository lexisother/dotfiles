export {};

declare global {
  const hh: {
    constants: Record<string, string> & { categories: Record<string, string> };
  };
}
