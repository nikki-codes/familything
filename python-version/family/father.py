"""
Father class - represents a father in the family
"""

from .parent import Parent
from .person import Gender


class Father(Parent):
    """Represents a father in the family"""
    
    def __init__(self, name: str):
        """Initialize a father"""
        super().__init__(name, Gender.MALE)
    
    def describe_genome(self) -> str:
        """Describe the father's genome"""
        return "X, Y"
