import { Person, Gender } from './person';
import { Child } from './child';

/**
 * Base class for parents (Father and Mother)
 */
export abstract class Parent extends Person {
  protected numChildren: number = 0;
  protected children: Child[] = [];

  constructor(name: string, gender: Gender) {
    super(name, gender);
  }

  /**
   * Add a child to this parent
   */
  addChild(child: Child): void {
    this.children.push(child);
    this.numChildren += 1;
  }

  /**
   * Get all children
   */
  getChildren(): Child[] {
    return this.children;
  }

  /**
   * Get the number of children
   */
  getNumChildren(): number {
    return this.numChildren;
  }
}
