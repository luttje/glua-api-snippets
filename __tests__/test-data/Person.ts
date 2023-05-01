import { tableColumn } from "../../src/scrapers/table-scraper";

export class Person {
  @tableColumn('#')
  public id: number = -1;

  @tableColumn('First Name')
  public firstName: string = '';

  @tableColumn('Last Name')
  public lastName: string = '';

  public username: string = '';

  public constructor(
    idOrPartial: Partial<Person> | number = -1,
    firstName: string = '',
    lastName: string = '',
    username: string = ''
  ) {
    if (typeof idOrPartial !== 'number') {
      Object.assign(this, idOrPartial);
      return;
    }

    this.id = idOrPartial;
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
  }
}
