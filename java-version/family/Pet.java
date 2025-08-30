package family;
import java.util.Arrays;
import SocialConstructs.BogeyMan;
public class Pet
{
    private String defaultName;
    private Person nickPerson[];
    private String nickName[];
    private int i;
    private BogeyMan bogey;
    public Pet(String s, BogeyMan b){
        defaultName = s;
        i = 0;
        bogey = b;
        nickPerson = new Person[5]; 
        nickName = new String[5]; 
    } 
    public void namePet(Person p, String name) {
        nickPerson[i] = p;
        nickName[i] = name;
        i++;
        bogey.increment(this);
}
   public void callsmeBy(Person p){
      String myName=defaultName;
      if(Arrays.asList(nickPerson).contains(p)) {
          int index = Arrays.asList(nickPerson).indexOf(p);
          myName = nickName[index];
      }
       System.out.println(myName);
       
   }
   public void removeName(){
       bogey.decrement(this);
   }
   public String getName() {
       return defaultName;
   }
}
