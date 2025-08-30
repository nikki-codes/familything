"""
Son class - represents a son in the family
"""

from .child import Child
from .person import Gender
from .father import Father
from .mother import Mother


class Son(Child):
    """Represents a son in the family"""
    
    def __init__(self, name: str, father: Father, mother: Mother):
        """Initialize a son"""
        super().__init__(name, father, mother, Gender.MALE)
    
    def describe_siblings(self):
        """Describe the son's siblings"""
        if not self.siblings:
            print(f"{self.name} has no siblings.")
        else:
            for sibling in self.siblings:
                if sibling.gender == Gender.FEMALE:
                    print(f"{self.name} is a {self.get_age()}-year old brother")
                else:
                    print(f"{self.name} is a {self.get_age()}-year old brother")
