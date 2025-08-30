import { Pet } from '../family/pet';

/**
 * BogeyMan class that tracks pets and their nickname counters.
 * - Uses a Map to map pets to their counter values
 * - Increments counter when pet gets a nickname
 * - Decrements counter when pet loses a nickname
 * - Checks if pets should be taken away when counter reaches 0
 */
export class BogeyMan {
  // petCounterMap => maps Pet objects to their counter values
  private petCounterMap: Map<Pet, number> = new Map();

  /**
   * Increment the counter for a pet when it gets a nickname
   */
  increment(pet: Pet): void {
    if (this.petCounterMap.has(pet)) {
      // If pet exists, add 1 to existing value
      const currentValue = this.petCounterMap.get(pet)!;
      this.petCounterMap.set(pet, currentValue + 1);
    } else {
      // Add a new pet with counter value of 1
      this.petCounterMap.set(pet, 1);
    }
  }

  /**
   * Decrement the counter for a pet when it loses a nickname
   */
  decrement(pet: Pet): void {
    if (this.petCounterMap.has(pet)) {
      const currentValue = this.petCounterMap.get(pet)!;
      this.petCounterMap.set(pet, currentValue - 1);
    }
  }

  /**
   * Check all pets and display if they should be taken away
   */
  check(): void {
    for (const [pet, counter] of this.petCounterMap.entries()) {
      if (counter === 0) {
        console.log(`${pet.getName()} has been taken away by bogeyman :(`);
      } else {
        console.log(`${pet.getName()} has not been taken away by bogeyman :) (yet)`);
      }
    }
  }
}
