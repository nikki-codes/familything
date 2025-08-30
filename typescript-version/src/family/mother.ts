import { Parent } from './parent';
import { Gender } from './person';
import { Father } from './father';

/**
 * Represents a mother in the family
 */
export class Mother extends Parent {
  constructor(name: string) {
    super(name, Gender.FEMALE);
  }

  /**
   * Marry a father
   */
  marry(father: Father): void {
    // Link the parents together
  }

  /**
   * Describe the mother's genome
   */
  describeGenome(): string {
    return 'X1, X2';
  }
}
