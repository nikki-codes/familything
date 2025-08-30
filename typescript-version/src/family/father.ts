import { Parent } from './parent';
import { Gender } from './person';

/**
 * Represents a father in the family
 */
export class Father extends Parent {
  constructor(name: string) {
    super(name, Gender.MALE);
  }

  /**
   * Describe the father's genome
   */
  describeGenome(): string {
    return 'X, Y';
  }
}
