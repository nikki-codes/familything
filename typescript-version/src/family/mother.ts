import { Parent } from './parent';
import { Gender } from './person';
import { Father } from './father';

/**
 * Represents a mother in the family
 */
export class Mother extends Parent {
  // x1 genome and x2 genome
  public genomeX1: string;
  public genomeX2: string;

  constructor(name: string) {
    super(name, Gender.FEMALE);
    this.genomeX1 = "x1";
    this.genomeX2 = "x2";
  }

  /**
   * Marry a father
   */
  marry(spouse: Father): void {
    super.connect(spouse);
  }

  /**
   * Get a random genome (x1 or x2)
   */
  getGenome(): string {
    return Math.random() > 0.5 ? this.genomeX1 : this.genomeX2;
  }

  /**
   * Describe the mother's genome
   */
  describeGenome(): string {
    return 'X1, X2';
  }
}
