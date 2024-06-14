package family;

public class Father extends Parent
{
    // x genome and y genome
    public String genome_x;
    public String genome_y; 
    public Father(String name)
    {
        super(name,Person.Gender.Male);
        genome_x= "x";
        genome_y= "y";
    }

    public void marry(Mother spouse){
        super.connect(spouse);
    }

    public String getGenome(Person.Gender g) {
        // return (condtion ? truevalue : falsevalue)
        return (g == Person.Gender.Female ? genome_x : genome_y);
    }
}

