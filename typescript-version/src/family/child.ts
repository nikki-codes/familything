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
  
  // Genome functionality
  protected geneFromMom: string;
  protected geneFromDad: string;

  constructor(name: string, father: Father, mother: Mother, gender: Gender) {
    super(name, gender);
    this.father = father;
    this.mother = mother;
    this.gender = gender; // Explicitly set gender
    
    // Genome functionality
    this.geneFromMom = mother.getGenome();
    this.geneFromDad = father.getGenome(gender);

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
   * Describe the child's siblings (matches Java implementation)
   */
  describeSiblings(): void {
    const allChildren = this.mother.listChildren();
    for (const child of allChildren) {
      if (child !== this) {
        const siblingAge = child.getAge();
        const siblingName = child.getName();
        if (child.getGender() === Gender.FEMALE) {
          console.log(`${siblingName} is a ${siblingAge}-year old sister`);
        } else {
          console.log(`${siblingName} is a ${siblingAge}-year old brother`);
        }
      }
    }
  }

  /**
   * Describe the child's parents
   */
  describeParents(): void {
    const dadAge = this.father.getAge();
    const momAge = this.mother.getAge();
    const dadName = this.father.getName();
    const momName = this.mother.getName();
    console.log(`${dadName} is a ${dadAge}-year-old father and ${momName} is a ${momAge}-year-old mother.`);
  }

  /**
   * Describe the child's genome
   */
  describeGenome(): void {
    console.log(`Genomes are: ${this.geneFromMom} and ${this.geneFromDad}`);
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
    return super.getAge();
  }
}
