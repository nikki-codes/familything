import { BogeyMan } from '../social-constructs/bogey-man';
import { Person } from './person';

/**
 * Pet class that can be given nicknames by family members.
 * Integrates with BogeyMan for tracking nickname status.
 */
export class Pet {
  private defaultName: string;
  private bogeyMan: BogeyMan;
  private nickPersons: Person[] = [];  // Store Person objects
  private nickNames: string[] = [];    // Store corresponding nicknames
  private counter: number = 0;  // Track number of nicknames

  constructor(name: string, bogeyMan: BogeyMan) {
    this.defaultName = name;
    this.bogeyMan = bogeyMan;
  }

  /**
   * Give the pet a nickname by a person
   */
  namePet(person: Person, nickname: string): void {
    this.nickPersons.push(person);
    this.nickNames.push(nickname);
    this.counter += 1;
    console.log(nickname);
    // Increment the bogeyman counter for this pet
    this.bogeyMan.increment(this);
  }

  /**
   * Check what a person calls this pet
   */
  callsMeBy(person: Person): void {
    let myName = this.defaultName;
    const index = this.nickPersons.indexOf(person);
    if (index !== -1 && this.nickNames[index]) {
      myName = this.nickNames[index];
    }
    console.log(myName);
  }

  /**
   * Remove a nickname (simplified version - removes the last added)
   */
  removeName(): void {
    if (this.counter > 0) {
      this.counter -= 1;
      this.nickPersons.pop();
      this.nickNames.pop();
    }

    // Decrement the bogeyman counter for this pet
    this.bogeyMan.decrement(this);
  }

  /**
   * Get the pet's default name
   */
  getName(): string {
    return this.defaultName;
  }
}
