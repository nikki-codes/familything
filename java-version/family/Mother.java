package family;
public class Mother extends Parent{
    public String genome_x1;
    public String genome_x2; 
    public Mother(String name){
        super(name,Person.Gender.Female);
        genome_x1="x1";
        genome_x2="x2"; 
    }

    public void marry(Father spouse) {
        super.connect(spouse);
    }
    public String getGenome() {
        return(Math.random()>0.5 ? genome_x1 : genome_x2);
    }
}