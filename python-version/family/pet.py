"""
Pet class - represents a pet in the family
"""

from typing import Dict
from social_constructs.bogey_man import BogeyMan


class Pet:
    """Represents a pet in the family"""
    
    def __init__(self, name: str, bogey_man: BogeyMan):
        """Initialize a pet"""
        self.name = name
        self.bogey_man = bogey_man
        self.nicknames: Dict[str, str] = {}  # person_name -> nickname
        self.default_name = name
    
    def name_pet(self, person_name: str, nickname: str):
        """Give the pet a nickname by a person"""
        self.nicknames[person_name] = nickname
        print(nickname)
    
    def calls_me_by(self, person_name: str):
        """Check what a person calls this pet"""
        if person_name in self.nicknames:
            print(self.nicknames[person_name])
        else:
            print(self.default_name)
    
    def remove_name(self):
        """Remove a nickname (simplified version)"""
        if self.nicknames:
            # Remove the last added nickname
            last_person = list(self.nicknames.keys())[-1]
            del self.nicknames[last_person]
        
        # Check if pet should be taken away
        if not self.nicknames:
            print(f"{self.name} has been taken away by bogeyman :(")
            self.bogey_man.check()
