"""
Parent class - base class for Father and Mother
"""

from typing import List
from .person import Person, Gender


class Parent(Person):
    """Base class for parents (Father and Mother)"""
    
    def __init__(self, name: str, gender: Gender):
        """Initialize a parent"""
        super().__init__(name, gender)
        self.num_children = 0
        self.children: List['Child'] = []
    
    def add_child(self, child: 'Child'):
        """Add a child to this parent"""
        self.children.append(child)
        self.num_children += 1
    
    def get_children(self) -> List['Child']:
        """Get all children"""
        return self.children
    
    def get_num_children(self) -> int:
        """Get the number of children"""
        return self.num_children
