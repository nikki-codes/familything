package SocialConstructs;
import family.Pet;
import java.util.HashMap;
/**
 * - First Internalize a new pet counter for every new pet. / or maybe make it part of an array.
 * - everytime a giveName function is called, the counter should be incremented
 * - and similarly, if the remove name fucntion is called, it should be decremented.
 * - when the counter becomes >=0 then when bogeyman.collect is called, then it will display
 * - Jimmy has been collected by bogeyman
 * - Kitty has not been collected by bogeyman.
 * Use HashMap to create a dictionary like we did in pet naming. [like our two array mapping logic]
 * => map names and counter values
 */
public class BogeyMan
{
    private int i;
    // petCM => stands for petCounterMap
    HashMap <Pet, Integer> petCM;
    public BogeyMan()
    {
        petCM = new HashMap <Pet, Integer>();
        i = 0;
    }

    public void increment(Pet p){
      // if pet exists, add 1 to existing value
      // else add a new key and put value of it as 1 [containsKey(); ]
      if (petCM.containsKey(p) == true) {
          // put => given key, value, return void
          // get => given key, return value
          petCM.put(p, (petCM.get(p)+1));
      }
      else {
          petCM.put(p, 1);
      }
    }
    
    public void decrement(Pet p) {
        // if petCM contains key, then decrement value by 1
        if (petCM.containsKey(p) == true){
            petCM.put(p, (petCM.get(p) - 1) );
        }
    }

    public void check() {
        // take the pet p, check if it's value is 0, display the statement accordingly using if-else
        for (Pet p : petCM.keySet()) {
            if (petCM.get(p) == 0) {
                System.out.println(p.getName() + " has been taken away by bogeyman :( " );
            }
            else {
                System.out.println(p.getName() + " has not been taken away by bogeyman :) (yet) ");
            }
        }
    }
}
