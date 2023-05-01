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
export function putCommentBeforeEachLine(text: string, skipLineOne: boolean = true) {
  return text.split(/\r?\n/g).map((line, index) => {
    if (index === 0 && skipLineOne)
      return line;

    return `--- ${line}`;
  }).join('\n');
}