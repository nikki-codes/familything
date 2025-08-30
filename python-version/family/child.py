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
        
        # Genome functionality
        self.gene_from_mom = mother.get_genome()
        self.gene_from_dad = father.get_genome(gender)

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
        """Describe the child's siblings (matches Java implementation)"""
        all_children = self.mother.list_children()
        for child in all_children:
            if child != self:
                sibling_age = child.get_age()
                sibling_name = child.get_name()
                if child.get_gender() == Gender.FEMALE:
                    print(f"{sibling_name} is a {sibling_age}-year old sister")
                else:
                    print(f"{sibling_name} is a {sibling_age}-year old brother")

    def describe_parents(self):
        """Describe the child's parents"""
        dad_age = self.father.get_age()
        mom_age = self.mother.get_age()
        dad_name = self.father.get_name()
        mom_name = self.mother.get_name()
        print(f"{dad_name} is a {dad_age}-year-old father and {mom_name} is a {mom_age}-year-old mother.")

    def describe_genome(self):
        """Describe the child's genome"""
        print(f"Genomes are: {self.gene_from_mom} and {self.gene_from_dad}")

    def get_name(self) -> str:
        """Get the person's name (public access)"""
        return self.name

    def get_age(self) -> int:
        """Get the person's age (public access)"""
        return super().get_age()
