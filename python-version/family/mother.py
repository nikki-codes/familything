"""
Mother class - represents a mother in the family
"""

from .parent import Parent
from .person import Gender


class Mother(Parent):
    """Represents a mother in the family"""
    
    def __init__(self, name: str):
        """Initialize a mother"""
        super().__init__(name, Gender.FEMALE)
    
    def marry(self, father: 'Father'):
        """Marry a father"""
        # Link the parents together
        pass
    
    def describe_genome(self) -> str:
        """Describe the mother's genome"""
        return "X1, X2"
