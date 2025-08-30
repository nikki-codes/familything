import { Person, Gender } from './person';

/**
 * Base class for parents (Father and Mother)
 */
export abstract class Parent extends Person {
  protected spouse: Parent | null = null;
  protected children: (any | null)[] = [];
  protected numChildren: number = 0;
  protected childrenCapacity: number = 1;

  constructor(name: string, gender: Gender) {
    super(name, gender);
  }

  /**
   * Connect this parent to a spouse
   */
  protected connect(spouse: Parent): void {
    if (this.spouse !== spouse) {
      this.spouse = spouse;
      spouse.connect(this);
      this.children = new Array(this.childrenCapacity).fill(null);
    }
  }

  /**
   * Add a child to this parent
   */
  addChild(child: any): void {
    if (!this.children.includes(child)) {
      if (this.childrenCapacity === this.numChildren) {
        this.increaseCapacity();
      }
      this.children[this.numChildren] = child;
      if (this.spouse) {
        this.spouse.addChild(child);
      }
      this.numChildren += 1;
    }
  }

  /**
   * Increase the capacity of the children array
   */
  private increaseCapacity(): void {
    this.childrenCapacity += 1;
    const newHolder: (any | null)[] = new Array(this.childrenCapacity).fill(null);
    for (let i = 0; i < this.children.length; i++) {
      newHolder[i] = this.children[i] || null;
    }
    this.children = newHolder;
  }

  /**
   * Get all children
   */
  listChildren(): any[] {
    return this.children.filter((child): child is any => child !== null);
  }

  /**
   * Get all children (alias for listChildren)
   */
  getChildren(): any[] {
    return this.listChildren();
  }

  /**
   * Get the number of children
   */
  getNumChildren(): number {
    return this.numChildren;
  }
}
