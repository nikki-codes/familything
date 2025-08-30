"""
Spacetime class for managing time progression in the family simulation
"""


class Spacetime:
    """Manages the current year and time progression"""
    
    current_year = 1950
    
    def __init__(self):
        """Initialize spacetime with default year"""
        pass
    
    @classmethod
    def next_years(cls, years: int):
        """Advance time by the specified number of years"""
        cls.current_year += years
    
    @classmethod
    def give_year(cls) -> int:
        """Get the current year"""
        return cls.current_year
