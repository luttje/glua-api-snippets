import { removeNewlines, toLowerCamelCase, wrapInComment, safeFileName, unindentText } from '../../src/utils/string';

describe('toLowerCamelCase', () => {
  it('should convert a string to lowerCamelCase', () => {
    expect(toLowerCamelCase('hello world')).toBe('helloWorld');
    expect(toLowerCamelCase('Hello World')).toBe('helloWorld');
    expect(toLowerCamelCase('HelloWorld')).toBe('helloWorld');
    expect(toLowerCamelCase('helloWorld')).toBe('helloWorld');
    expect(toLowerCamelCase('hello_world')).toBe('helloWorld');
  });

  it('should not convert a string that is already lowerCamelCase', () => {
    expect(toLowerCamelCase('helloWorld')).toBe('helloWorld');
  });
});

describe('removeNewlines', () => {
  it.each([
    ['hello\nworld', 'hello world'],
    ['hello\r\nworld', 'hello world'],
    ['hello\n\nworld', 'hello  world'],
    ['hello\r\n\r\nworld', 'hello  world'],
  ])('should replace newlines with spaces', (input, expected) => {
    expect(removeNewlines(input)).toBe(expected);
  });
});

describe('putCommentBeforeEachLine', () => {
  it.each([
    ['hello\nworld', 'hello\n--- world', true],
    ['hello\nworld', '--- hello\n--- world'],
    ['hello\r\nworld', '--- hello\n--- world'],
    ['hello\n\nworld', '--- hello\n---\n--- world'],
    ['hello\r\n\r\nworld', '--- hello\n---\n--- world'],
    ['hello\n\n\n\nworld', '--- hello\n---\n--- world'],
    ['hello\r\n\r\n\r\n\r\nworld', '--- hello\n---\n--- world'],
  ])('should put a comment before each line', (input, expected, skipFirstLine = false) => {
    expect(wrapInComment(input, skipFirstLine)).toBe(expected);
  });
});

describe('wrapInComment', () => {
  it.each([
    [
      `The following specifiers are exclusive to LuaJIT:

| Format | Description | Example of the output |
|:------:|:-----------:|:---------------------:|
| %p | Returns pointer to supplied structure (table/function) | \`0xf20a8968\` |
| %q | Formats a string between double quotes, using escape sequences when necessary to ensure that it can safely be read back by the Lua interpreter | \`"test\\1\\2test"\` |`,
      `The following specifiers are exclusive to LuaJIT:
--[[

| Format | Description | Example of the output |
|:------:|:-----------:|:---------------------:|
| %p | Returns pointer to supplied structure (table/function) | \`0xf20a8968\` |
| %q | Formats a string between double quotes, using escape sequences when necessary to ensure that it can safely be read back by the Lua interpreter | \`"test\\1\\2test"\` |
--]]`,
      true,
    ],
    [
      `The following specifiers are exclusive to LuaJIT:

| Format | Description | Example of the output |
| ------ | ----------- | --------------------- |
| %p | Returns pointer to supplied structure (table/function) | \`0xf20a8968\` |
| %q | Formats a string between double quotes, using escape sequences when necessary to ensure that it can safely be read back by the Lua interpreter | \`"test\\1\\2test"\` |`,
      `--[[
The following specifiers are exclusive to LuaJIT:

| Format | Description | Example of the output |
| ------ | ----------- | --------------------- |
| %p | Returns pointer to supplied structure (table/function) | \`0xf20a8968\` |
| %q | Formats a string between double quotes, using escape sequences when necessary to ensure that it can safely be read back by the Lua interpreter | \`"test\\1\\2test"\` |
--]]`,
    ],
  ])('should put a comment before each line', (input, expected, skipFirstLine = false) => {
    expect(wrapInComment(input, skipFirstLine)).toBe(expected);
  });
});

describe('safeFileName', () => {
  it.each([
    ['hello world', 'hello world'],
    ['hello:World', 'hello_World'],
    ['hello:World', 'hello-World', '-'],
    ['hello:World', 'helloWorld', ''],
    ['hello:World', 'hello World', ' '],
  ])('should make a string "%s" safe ("%s") for use as a file name', (input: string, expected: string, replacement: string | undefined = undefined) => {
    if (replacement !== undefined)
      expect(safeFileName(input, replacement)).toBe(expected);
    else
      expect(safeFileName(input)).toBe(expected);
  });
});

describe('unindentText', () => {
  it.each([
    ['hello\nworld', 'hello\nworld'],
    ['  hello\n  world', 'hello\nworld'],
    ['    hello\n    world', 'hello\nworld'],
    ['\thello\n\tworld', 'hello\nworld'],
    ['\thello\n\t world\nyo', 'hello\n world\nyo'],
    ['\t\thello\n\t\tworld', 'hello\nworld'],
  ])('should unindent text by the given amount', (input, expected) => {
    expect(unindentText(input)).toBe(expected);
  });
});
