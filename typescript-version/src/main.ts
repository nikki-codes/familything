/**
 * FamilyThing Project - TypeScript Version
 * Main entry point for the family dynamics simulation
 */

import { Spacetime } from './social-constructs/spacetime';
import { BogeyMan } from './social-constructs/bogey-man';
import { Father } from './family/father';
import { Mother } from './family/mother';
import { Daughter } from './family/daughter';
import { Son } from './family/son';
import { Pet } from './family/pet';

/**
 * Main function to run the family simulation
 */
function main(): void {
  // Initialize spacetime
  const spacetime = new Spacetime();
  
  // Create bogeyman
  const bogey = new BogeyMan();
  
  // Advance time and create family members
  Spacetime.nextYears(29);
  const pavan = new Father('Pavan');
  
  Spacetime.nextYears(4);
  const prathima = new Mother('Prathima');
  
  Spacetime.nextYears(23);
  prathima.marry(pavan);
  
  Spacetime.nextYears(1);
  const nikhita = new Daughter('Nikhita', pavan, prathima);
  
  Spacetime.nextYears(5);
  const tejas = new Son('Tejas', pavan, prathima);
  
  Spacetime.nextYears(10);
  
  // Describe family relationships
  tejas.describeSiblings();
  nikhita.describeSiblings();
  nikhita.describeParents();
  nikhita.describeGenome();
  tejas.describeGenome();
  
  // Pet interactions (using Person objects like Java)
  const dog = new Pet('Jimmy', bogey);
  dog.namePet(nikhita, 'yoyo');
  dog.namePet(pavan, 'jim');
  dog.callsMeBy(nikhita);
  dog.callsMeBy(pavan);
  dog.removeName();
  dog.removeName();
  
  // Bogeyman check
  bogey.check();
}

// Run the main function
if (require.main === module) {
  main();
}

export { main };
