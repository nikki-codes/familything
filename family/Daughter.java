package family;

public class Daughter extends Child
{
    public Daughter(String name, Father d, Mother m)
    {
        super(name,Person.Gender.Female, d, m);
    }
}
