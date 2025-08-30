package SocialConstructs;
public class Spacetime {
    static int currentYear;
    public Spacetime (){
        currentYear = 1950;
    }
    public static void nextYears(int n){
        currentYear = currentYear + n;
    }
    public static int giveYear(){
        return currentYear;
    }
}