import { Row, Table } from "../../src/scrapers/table-scraper";
import { Person } from "./Person";

export const expectedTables: (Table<Person> | null)[] = [
  new Table<Person>('https://webscraper.io/test-sites/tables', [
    new Row<Person>(new Person({ id: 1, firstName: 'Mark', lastName: 'Otto', username: '@mdo' })),
    new Row<Person>(new Person({ id: 2, firstName: 'Jacob', lastName: 'Thornton', username: '@fat' })),
    new Row<Person>(new Person({ id: 3, firstName: 'Larry', lastName: 'the Bird', username: '@twitter' })),
  ]),
  new Table<Person>('https://webscraper.io/test-sites/tables', [
    new Row<Person>(new Person({ id: 4, firstName: 'Harry', lastName: 'Potter', username: '@hp' })),
    new Row<Person>(new Person({ id: 5, firstName: 'John', lastName: 'Snow', username: '@dunno' })),
    new Row<Person>(new Person({ id: 6, firstName: 'Tim', lastName: 'Bean', username: '@timbean' })),
  ]),
  new Table<Person>('https://webscraper.io/test-sites/tables', [
    new Row<Person>(new Person({ id: 1, firstName: 'Mark', lastName: 'Otto', username: '@mdo' })),
    new Row<Person>(new Person({ id: 2, firstName: 'Jacob', lastName: 'Thornton', username: '@fat' })),
    new Row<Person>(new Person({ id: 3, firstName: 'Larry', lastName: 'the Bird', username: '@twitter' })),
  ]),
  // The last table is not scraped because at the moment we don't support tables with multiple headings and empty rows
];