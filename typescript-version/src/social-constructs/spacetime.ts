/**
 * Spacetime class for managing time progression in the family simulation
 */
export class Spacetime {
  private static currentYear: number = 1950;

  /**
   * Advance time by the specified number of years
   */
  static nextYears(years: number): void {
    Spacetime.currentYear += years;
  }

  /**
   * Get the current year
   */
  static giveYear(): number {
    return Spacetime.currentYear;
  }
}
