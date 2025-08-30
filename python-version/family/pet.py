"""
Pet class - represents a pet in the family
"""

from typing import Dict, List
from social_constructs.bogey_man import BogeyMan
from .person import Person

class Pet:
    """
    Pet class that can be given nicknames by family members.
    Integrates with BogeyMan for tracking nickname status.
    """
    
    def __init__(self, name: str, bogey_man: BogeyMan):
        self.default_name = name
        self.bogey_man = bogey_man
        self.nick_persons: List[Person] = []  # Store Person objects
        self.nick_names: List[str] = []       # Store corresponding nicknames
        self.counter = 0  # Track number of nicknames
    
    def name_pet(self, person: Person, nickname: str) -> None:
        """
        Give the pet a nickname by a person
        """
        self.nick_persons.append(person)
        self.nick_names.append(nickname)
        self.counter += 1
        print(nickname)
        # Increment the bogeyman counter for this pet
        self.bogey_man.increment(self)
    
    def calls_me_by(self, person: Person) -> None:
        """
        Check what a person calls this pet
        """
        my_name = self.default_name
        if person in self.nick_persons:
            index = self.nick_persons.index(person)
            my_name = self.nick_names[index]
        print(my_name)
    
    def remove_name(self) -> None:
        """
        Remove a nickname (simplified version - removes the last added)
        """
        if self.counter > 0:
            self.counter -= 1
            if self.nick_persons:
                self.nick_persons.pop()
            if self.nick_names:
                self.nick_names.pop()
        
        # Decrement the bogeyman counter for this pet
        self.bogey_man.decrement(self)
    
    def get_name(self) -> str:
        """
        Get the pet's default name
        """
        return self.default_name
