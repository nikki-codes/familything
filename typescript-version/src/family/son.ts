import { Child } from './child';
import { Gender } from './person';
import { Father } from './father';
import { Mother } from './mother';

/**
 * Represents a son in the family
 */
export class Son extends Child {
  constructor(name: string, father: Father, mother: Mother) {
    super(name, father, mother, Gender.MALE);
  }

  /**
   * Describe the son's siblings
   */
  describeSiblings(): void {
    if (this.siblings.length === 0) {
      console.log(`${this.name} has no siblings.`);
    } else {
      for (const sibling of this.siblings) {
        if (sibling.gender === Gender.FEMALE) {
          console.log(`${this.name} is a ${this.getAge()}-year old brother`);
        } else {
          console.log(`${this.name} is a ${this.getAge()}-year old brother`);
        }
      }
    }
  }
}
