#!/usr/bin/env python3
"""
FamilyThing Project - Python Version
Main entry point for the family dynamics simulation
"""

from social_constructs.spacetime import Spacetime
from social_constructs.bogey_man import BogeyMan
from family.father import Father
from family.mother import Mother
from family.daughter import Daughter
from family.son import Son
from family.pet import Pet


def main():
    """Main function to run the family simulation"""
    # Initialize spacetime
    spacetime = Spacetime()
    
    # Create bogeyman
    bogey = BogeyMan()
    
    # Advance time and create family members
    spacetime.next_years(29)
    pavan = Father("Pavan")
    
    spacetime.next_years(4)
    prathima = Mother("Prathima")
    
    spacetime.next_years(23)
    prathima.marry(pavan)
    
    spacetime.next_years(1)
    nikhita = Daughter("Nikhita", pavan, prathima)
    
    spacetime.next_years(5)
    tejas = Son("Tejas", pavan, prathima)
    
    spacetime.next_years(10)
    
    # Describe family relationships
    tejas.describe_siblings()
    nikhita.describe_siblings()
    nikhita.describe_parents()
    nikhita.describe_genome()
    tejas.describe_genome()
    
    # Pet interactions
    dog = Pet("Jimmy", bogey)
    dog.name_pet(nikhita, "yoyo")
    dog.name_pet(pavan, "jim")
    dog.calls_me_by(nikhita)
    dog.calls_me_by(pavan)
    dog.remove_name()
    dog.remove_name()
    
    # Bogeyman check
    bogey.check()


if __name__ == "__main__":
    main()
