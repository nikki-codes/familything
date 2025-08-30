"""
Daughter class - represents a daughter in the family
"""

from .child import Child
from .person import Gender
from .father import Father
from .mother import Mother


class Daughter(Child):
    """Represents a daughter in the family"""
    
    def __init__(self, name: str, father: Father, mother: Mother):
        """Initialize a daughter"""
        super().__init__(name, father, mother, Gender.FEMALE)
    
    def describe_siblings(self):
        """Describe the daughter's siblings"""
        if not self.siblings:
            print(f"{self.name} has no siblings.")
        else:
            for sibling in self.siblings:
                if sibling.gender == Gender.FEMALE:
                    print(f"{self.name} is a {self.get_age()}-year old sister")
                else:
                    print(f"{self.name} is a {self.get_age()}-year old sister")
