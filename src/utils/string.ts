/**
 * Converts a string to lowerCamelCase
 *
 * @param str The string to convert
 * @returns The converted string
 */
export function toLowerCamelCase(str: string) {
  str = str.replace(/[_-]/g, ' ');
  return str.replace(/(?:^\w|\b\w)/g, (letter, index) => {
    return index === 0 ? letter.toLowerCase() : letter.toUpperCase();
  }).replace(/\s+/g, '');
}

/**
 * Replaces all newlines in a string with spaces
 */
export function removeNewlines(text: string) {
  return text.replace(/\r?\n/g, ' ');
}

/**
 * Puts a comment before each line in a string
 */
function putCommentBeforeEachLine(text: string, skipLineOne: boolean = true) {
  return text.split(/\r?\n/g).map((line, index) => {
    if (index === 0 && skipLineOne)
      return line;

    line = line.trimEnd();
    let space = line.length > 0 ? ' ' : '';
    return `---${space}${line}`;
  }).join('\n');
}

/**
 * Puts every following line in a long comment. We do this so any markdown
 * inside the comment doesn't break. Like markdown tables only work in
 * long comments.
 */
export function wrapInComment(text: string, skipLineOne: boolean = true) {
  // Trim any leading and trailing line breaks, or lines with only white spaces.
  text = text.replace(/^\s*\r?\n|\r?\n\s*$/g, '');

  // Remove duplicate consequitive new lines.
  while (text.match(/\r?\n\r?\n\r?\n/g)) {
    text = text.replace(/\r?\n\r?\n\r?\n/g, "\n\n");
  }

  text = unindentText(text);

  // If the text contains no markdown tables, we use the old method
  // of putting a comment before each line.
  if (!text.match(/^\s*\|.*\|\s*\n^\s*\|(?:\s*[:\-]+[-| :]*).*$/gm)) {
    return putCommentBeforeEachLine(text, skipLineOne);
  }

  const lines = text.split(/\r?\n/g);
  let output = '';
  let i = 0;

  if (skipLineOne) {
    if (lines.length <= 1) {
      return text;
    }

    output = `${lines[0]}\n--[[\n`;
    i = 1;
  } else {
    output = '--[[\n';
  }

  for (; i < lines.length; i++) {
    output += `${lines[i]}\n`;
  }

  output += '--]]';

  return output;
}

/**
 * Makes a string safe for use as a file name
 *
 * @param str The string to make safe
 * @param replacement The string to replace unsafe characters with
 * @returns The safe string
 */
export function safeFileName(str: string, replacement: string = '_') {
  return str.replace(/[^a-z0-9_\-\. ]/gi, replacement);
}

/**
 * Escapes all single quotes in a string
 *
 * @param str The string to escape
 * @returns The escaped string
 */
export function escapeSingleQuotes(str: string) {
  return str.replace(/'/g, '\\\'');
}

/**
 * Indents all lines in a string by a given amount
 *
 * @param text The text to indent
 * @param indent The amount of spaces to indent by
 * @returns The indented text
 */
export function indentText(text: string, indent: number) {
  return text.split('\n').map(line => ' '.repeat(indent) + line).join('\n');
}

/**
 * Unindents all lines in the text using the given indent amount or
 * by the first line's indent amount.
 * @param text The text to unindent
 * @param indent The amount of spaces to unindent by
 * @returns The unindented text
 */
export function unindentText(text: string, indent: number = 0) {
  const lines = text.split('\n');

  if (lines.length === 0)
    return text;

  const firstLineIndent = lines[0].search(/\S/);
  const unindentAmount = indent > 0 ? indent : firstLineIndent;

  return lines.map(line => line.slice(unindentAmount)).join('\n');
}
