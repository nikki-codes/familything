"""
Father class - represents a father in the family
"""

from .parent import Parent
from .person import Gender
import random


class Father(Parent):
    """Represents a father in the family"""
    
    def __init__(self, name: str):
        """Initialize a father"""
        super().__init__(name, Gender.MALE)
        # x genome and y genome
        self.genome_x = "x"
        self.genome_y = "y"

    def marry(self, mother: 'Mother') -> None:
        """
        Marry a mother
        """
        super().connect(mother)

    def get_genome(self, gender: Gender) -> str:
        """
        Get the genome based on gender
        """
        return self.genome_x if gender == Gender.FEMALE else self.genome_y

    def describe_genome(self) -> str:
        """
        Describe the father's genome
        """
        return 'X, Y'
