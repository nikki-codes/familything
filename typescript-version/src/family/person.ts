import { Spacetime } from '../social-constructs/spacetime';

/**
 * Gender enumeration
 */
export enum Gender {
  FEMALE = 'Female',
  MALE = 'Male'
}

/**
 * Base class for all family members
 */
export abstract class Person {
  protected name: string;
  protected gender: Gender;
  protected birthYear: number;

  constructor(name: string, gender: Gender) {
    this.name = name;
    this.gender = gender;
    this.birthYear = Spacetime.giveYear();
  }

  /**
   * Get the person's gender
   */
  protected getGender(): Gender {
    return this.gender;
  }

  /**
   * Calculate and return the person's age
   */
  public getAge(): number {
    return Spacetime.giveYear() - this.birthYear;
  }

  /**
   * Get the person's name
   */
  public getName(): string {
    return this.name;
  }
}
