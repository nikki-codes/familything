package family;
import SocialConstructs.Spacetime;
public class Person{ 
    enum Gender {
    Female,
    Male
}
    private String name;
    private Gender gender;
    private int birthYear;
    public Person (String name,Gender gender){
        this.name = name;
        birthYear = Spacetime.giveYear(); 
        this.gender = gender;
    }
    protected Gender getGender() {
        return gender; 
    }
    protected int getAge() {
        return (Spacetime.giveYear() - birthYear);
    }
    protected String getName() {
        return name; 
    }
}
