"""
Mother class - represents a mother in the family
"""

from .parent import Parent
from .person import Gender
import random


class Mother(Parent):
    """Represents a mother in the family"""
    
    def __init__(self, name: str):
        """Initialize a mother"""
        super().__init__(name, Gender.FEMALE)
        # x1 genome and x2 genome
        self.genome_x1 = "x1"
        self.genome_x2 = "x2"

    def marry(self, father: 'Father') -> None:
        """
        Marry a father
        """
        super().connect(father)

    def get_genome(self) -> str:
        """
        Get a random genome (x1 or x2)
        """
        return self.genome_x1 if random.random() > 0.5 else self.genome_x2

    def describe_genome(self) -> str:
        """
        Describe the mother's genome
        """
        return 'X1, X2'
