"""
Parent class - base class for Father and Mother
"""

from typing import List, TYPE_CHECKING
from .person import Person, Gender

if TYPE_CHECKING:
    from .child import Child

class Parent(Person):
    def __init__(self, name: str, gender: Gender):
        super().__init__(name, gender)
        self.spouse = None
        self.children: List['Child'] = []
        self.num_children = 0
        self.children_capacity = 1

    def connect(self, spouse: 'Parent') -> None:
        """
        Connect this parent to a spouse
        """
        if self.spouse != spouse:
            self.spouse = spouse
            spouse.connect(self)
            self.children = [None] * self.children_capacity

    def add_child(self, child: 'Child') -> None:
        """
        Add a child to this parent
        """
        if child not in self.children:
            if self.children_capacity == self.num_children:
                self.increase_capacity()
            self.children[self.num_children] = child
            if self.spouse:
                self.spouse.add_child(child)
            self.num_children += 1

    def increase_capacity(self) -> None:
        """
        Increase the capacity of the children array
        """
        self.children_capacity += 1
        new_holder = [None] * self.children_capacity
        for i in range(len(self.children)):
            new_holder[i] = self.children[i]
        self.children = new_holder

    def list_children(self) -> List['Child']:
        """
        Get all children
        """
        return [child for child in self.children if child is not None]

    def get_children(self) -> List['Child']:
        """
        Get all children (alias for list_children)
        """
        return self.list_children()

    def get_num_children(self) -> int:
        """
        Get the number of children
        """
        return self.num_children
