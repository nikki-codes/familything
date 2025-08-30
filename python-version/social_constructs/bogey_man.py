"""
BogeyMan class for monitoring pets and taking them away if they don't have nicknames
"""

from typing import Dict, TYPE_CHECKING

if TYPE_CHECKING:
    from family.pet import Pet

class BogeyMan:
    """
    BogeyMan class that tracks pets and their nickname counters.
    - Uses a dictionary to map pets to their counter values
    - Increments counter when pet gets a nickname
    - Decrements counter when pet loses a nickname
    - Checks if pets should be taken away when counter reaches 0
    """
    
    def __init__(self):
        # pet_counter_map => maps Pet objects to their counter values
        self.pet_counter_map: Dict['Pet', int] = {}
    
    def increment(self, pet: 'Pet') -> None:
        """
        Increment the counter for a pet when it gets a nickname
        """
        if pet in self.pet_counter_map:
            # If pet exists, add 1 to existing value
            self.pet_counter_map[pet] += 1
        else:
            # Add a new pet with counter value of 1
            self.pet_counter_map[pet] = 1
    
    def decrement(self, pet: 'Pet') -> None:
        """
        Decrement the counter for a pet when it loses a nickname
        """
        if pet in self.pet_counter_map:
            self.pet_counter_map[pet] -= 1
    
    def check(self) -> None:
        """
        Check all pets and display if they should be taken away
        """
        for pet, counter in self.pet_counter_map.items():
            if counter == 0:
                print(f"{pet.get_name()} has been taken away by bogeyman :(")
            else:
                print(f"{pet.get_name()} has not been taken away by bogeyman :) (yet)")
