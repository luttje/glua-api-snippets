import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import { FunctionArgument, FunctionReturn } from '../../src/scrapers/wiki-page-markup-scraper';

/**
 * CompileString returns `nil` on a compile error when `handleError` is omitted, `nil` or `true` (the game
 * reports the error), but returns the error string when `handleError` is `false`. The wiki only lists
 * `function` as return type.
 *
 * LuaLS only picks the `false` overload if the main signature doesn't also accept `false`, so the main
 * signature is narrowed to `handleError?: true` and a `boolean` overload covers values unknown at
 * analysis time.
 *
 * Returns copies, since the scraped pages are also written to JSON as-is.
 */
export default function plugin(args: FunctionArgument[] | undefined, returns: FunctionReturn[] | undefined) {
  const handleErrorIndex = args?.findIndex(arg => arg.name === 'handleError' && arg.type === 'boolean') ?? -1;
  const returnIndex = returns?.findIndex(ret => ret.type === 'function') ?? -1;

  // The wiki page changed shape, rather write it as-is than write wrong overloads
  if (!args || !returns || handleErrorIndex !== args.length - 1 || returns.length !== 1 || returnIndex !== 0) {
    return { args, returns, overloads: '' };
  }

  const leadingParams = args.slice(0, handleErrorIndex)
    .map(arg => `${GluaApiWriter.safeName(arg.name!)}: ${GluaApiWriter.transformType(arg.type)}`)
    .join(', ');

  return {
    args: args.map((arg, index) => index === handleErrorIndex ? { ...arg, type: 'true' } : arg),
    returns: [{ ...returns[0], type: 'function?' }],
    overloads: `---@overload fun(${leadingParams}, handleError: false): function|string\n`
      + `---@overload fun(${leadingParams}, handleError: boolean): function|string|nil\n`,
  };
}
