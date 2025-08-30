import { Parent } from './parent';
import { Gender } from './person';
import { Mother } from './mother';

/**
 * Represents a father in the family
 */
export class Father extends Parent {
  // x genome and y genome
  public genomeX: string;
  public genomeY: string;

  constructor(name: string) {
    super(name, Gender.MALE);
    this.genomeX = "x";
    this.genomeY = "y";
  }

  /**
   * Marry a mother
   */
  marry(spouse: Mother): void {
    super.connect(spouse);
  }

  /**
   * Get the genome based on gender
   */
  getGenome(gender: Gender): string {
    return gender === Gender.FEMALE ? this.genomeX : this.genomeY;
  }

  /**
   * Describe the father's genome
   */
  describeGenome(): string {
    return 'X, Y';
  }
}
