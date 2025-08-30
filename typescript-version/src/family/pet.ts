import { BogeyMan } from '../social-constructs/bogey-man';

/**
 * Represents a pet in the family
 */
export class Pet {
  private name: string;
  private bogeyMan: BogeyMan;
  private nicknames: Map<string, string> = new Map();
  private defaultName: string;

  constructor(name: string, bogeyMan: BogeyMan) {
    this.name = name;
    this.bogeyMan = bogeyMan;
    this.defaultName = name;
  }

  /**
   * Give the pet a nickname by a person
   */
  namePet(personName: string, nickname: string): void {
    this.nicknames.set(personName, nickname);
    console.log(nickname);
  }

  /**
   * Check what a person calls this pet
   */
  callsMeBy(personName: string): void {
    const nickname = this.nicknames.get(personName);
    if (nickname) {
      console.log(nickname);
    } else {
      console.log(this.defaultName);
    }
  }

  /**
   * Remove a nickname (simplified version)
   */
  removeName(): void {
    if (this.nicknames.size > 0) {
      // Remove the last added nickname
      const lastKey = Array.from(this.nicknames.keys()).pop();
      if (lastKey) {
        this.nicknames.delete(lastKey);
      }
    }

    // Check if pet should be taken away
    if (this.nicknames.size === 0) {
      console.log(`${this.name} has been taken away by bogeyman :(`);
      this.bogeyMan.check();
    }
  }
}
