import { JSDOM } from 'jsdom';

// Source https://stackoverflow.com/a/9609450
export const decodeEntities = (function() {
  // This prevents any overhead from creating the object each time
  const element = new JSDOM().window.document.createElement('div');

  function decodeHTMLEntities (str: string): string {
    if(str && typeof str === 'string') {
      // strip script/html tags
      str = str.replace(/<script[^>]*>([\S\s]*?)<\/script>/gmi, '');
      str = str.replace(/<\/?\w(?:[^"'>]|"[^"]*"|'[^']*')*>/gmi, '');
      element.innerHTML = str;
      str = element.textContent ? element.textContent: element.innerText;
      element.textContent = '';
    }

    return str;
  }

  return decodeHTMLEntities;
})();