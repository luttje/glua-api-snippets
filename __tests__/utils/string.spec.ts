import { toLowerCamelCase } from '../../src/utils/string';

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