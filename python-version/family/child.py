"""
Child class - base class for Son and Daughter
"""

from typing import List
from .person import Person, Gender
from .father import Father
from .mother import Mother


class Child(Person):
    """Base class for children (Son and Daughter)"""
    
    def __init__(self, name: str, father: Father, mother: Mother, gender: Gender):
        """Initialize a child with parents"""
        super().__init__(name, gender)
        self.father = father
        self.mother = mother
        self.siblings: List[Child] = []
        
        # Add this child to both parents
        father.add_child(self)
        mother.add_child(self)
        
        # Link siblings
        self._link_siblings()
    
    def _link_siblings(self):
        """Link this child with existing siblings"""
        # Get all children from both parents and link them as siblings
        all_children = self.father.get_children() + self.mother.get_children()
        for child in all_children:
            if child != self and child not in self.siblings:
                self.siblings.append(child)
                if self not in child.siblings:
                    child.siblings.append(self)
    
    def describe_siblings(self):
        """Describe the child's siblings"""
        if not self.siblings:
            print(f"{self.name} has no siblings.")
        else:
            sibling_names = [sibling.name for sibling in self.siblings]
            print(f"{self.name} has siblings: {', '.join(sibling_names)}")
    
    def describe_parents(self):
        """Describe the child's parents"""
        print(f"{self.father.name} is a {self.father.get_age()}-year-old father and {self.mother.name} is a {self.mother.get_age()}-year-old mother.")
    
    def describe_genome(self):
        """Describe the child's genome"""
        # Randomly select X genome from mother
        import random
        mother_x = random.choice(["x1", "x2"])
        father_x = "x" if self.gender == Gender.FEMALE else "y"
        print(f"Genomes are: {mother_x} and {father_x}")
