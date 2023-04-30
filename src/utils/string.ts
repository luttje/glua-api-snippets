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