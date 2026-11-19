import { LUALS_VERSION, installLuaLs } from './lua-language-server.js';

await installLuaLs();
console.log(`LuaLS ${LUALS_VERSION} is installed`);
