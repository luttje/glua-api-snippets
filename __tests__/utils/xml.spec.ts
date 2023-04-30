import { deserializeXml } from "../../src/utils/xml";

const xml = `
<test test="xxxx">
  <complex inner="inside">
    <with>
      <nested>1</nested>
      <nested>2</nested>
      <nested>3</nested>
    </with>
  </complex>
</test>
`;

type TestType = {
  test?: string;
  complex: {
    inner?: string;
    with: {
      nested: number[];
    }
  };
}

describe('deserializeXml', () => {
  it('should deserialize XML to described type', () => {
    const result = deserializeXml<TestType>(xml, ($) => {
      const root = $('test');
      const complex = root.find('complex');
      const nested = complex.find('nested');

      return {
        test: root.attr('test'),
        complex: {
          inner: complex.attr('inner'),
          with: {
            nested: nested.map(function () {
              return Number.parseInt($(this).text());
            }).get()
          }
        }
      }
    });

    expect(result.test).toBe('xxxx');
    expect(result.complex.inner).toBe('inside');
    expect(result.complex.with.nested).toEqual([1, 2, 3]);
  });
});