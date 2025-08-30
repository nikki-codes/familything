"""
Person class - base class for all family members
"""

from enum import Enum
from social_constructs.spacetime import Spacetime


class Gender(Enum):
    """Gender enumeration"""
    FEMALE = "Female"
    MALE = "Male"


class Person:
    """Base class for all family members"""
    
    def __init__(self, name: str, gender: Gender):
        """Initialize a person with name and gender"""
        self.name = name
        self.gender = gender
        self.birth_year = Spacetime.give_year()
    
    def get_gender(self) -> Gender:
        """Get the person's gender"""
        return self.gender
    
    def get_age(self) -> int:
        """Calculate and return the person's age"""
        return Spacetime.give_year() - self.birth_year
    
    def get_name(self) -> str:
        """Get the person's name"""
        return self.name
