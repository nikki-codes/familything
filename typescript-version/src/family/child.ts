import { Person, Gender } from './person';
import { Father } from './father';
import { Mother } from './mother';

/**
 * Base class for children (Son and Daughter)
 */
export abstract class Child extends Person {
  protected father: Father;
  protected mother: Mother;
  protected siblings: Child[] = [];
  public gender: Gender; // Make gender public for access in subclasses

  constructor(name: string, father: Father, mother: Mother, gender: Gender) {
    super(name, gender);
    this.father = father;
    this.mother = mother;
    this.gender = gender; // Explicitly set gender

    // Add this child to both parents
    father.addChild(this);
    mother.addChild(this);

    // Link siblings
    this.linkSiblings();
  }

  /**
   * Link this child with existing siblings
   */
  private linkSiblings(): void {
    // Get all children from both parents and link them as siblings
    const allChildren = [...this.father.getChildren(), ...this.mother.getChildren()];
    
    for (const child of allChildren) {
      if (child !== this && !this.siblings.includes(child)) {
        this.siblings.push(child);
        if (!child.siblings.includes(this)) {
          child.siblings.push(this);
        }
      }
    }
  }

  /**
   * Describe the child's siblings
   */
  describeSiblings(): void {
    if (this.siblings.length === 0) {
      console.log(`${this.name} has no siblings.`);
    } else {
      const siblingNames = this.siblings.map(sibling => sibling.name);
      console.log(`${this.name} has siblings: ${siblingNames.join(', ')}`);
    }
  }

  /**
   * Describe the child's parents
   */
  describeParents(): void {
    console.log(`${this.father.getName()} is a ${this.father.getAge()}-year-old father and ${this.mother.getName()} is a ${this.mother.getAge()}-year-old mother.`);
  }

  /**
   * Describe the child's genome
   */
  describeGenome(): void {
    // Randomly select X genome from mother
    const motherX = Math.random() < 0.5 ? 'x1' : 'x2';
    const fatherX = this.gender === Gender.FEMALE ? 'x' : 'y';
    console.log(`Genomes are: ${motherX} and ${fatherX}`);
  }

  /**
   * Get the person's name (public access)
   */
  getName(): string {
    return this.name;
  }

  /**
   * Get the person's age (public access)
   */
  getAge(): number {
    return this.birthYear;
  }
}
