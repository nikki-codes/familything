package family;

public class Child extends Person
{
    Mother mom;
    Father dad;
    protected String geneFromMom;
    protected String geneFromDad;
    public Child(String name, Person.Gender gender, Father d, Mother m) {
        super(name,gender); 
        dad = d;
        mom = m;
        dad.addChild(this);
        geneFromDad = dad.getGenome(gender);
        geneFromMom = mom.getGenome();
    }

    public void describeSiblings(){
        // pick either mom or dad
        // get a list of their children
        // go over that list, add condition to discard myself
        // print others in the list based on their gender
        Child[] allChildren = mom.listChildren();
        int numChildren = allChildren.length;
        for (int i=0; i<numChildren; i++){
            if (allChildren[i] != this){
                Child sibling = allChildren[i];
                int siblingAge = sibling.getAge();
                    String siblingName = sibling.getName();
                if (Person.Gender.Female == sibling.getGender() ){
                    System.out.println(siblingName + " is a " + siblingAge +"-year old sister");
                } else {
                    System.out.println(siblingName + " is a " + siblingAge +"-year old brother");
                }
            }
        }
    }

    public void describeParents(){
        //Pavan is a 44-year-old father and Prathima is a 40-year-old mother.
        int dadAge = dad.getAge();
        int momAge = mom.getAge();
        String dadName = dad.getName();
        String momName = mom.getName();
        System.out.println(dadName + " is a " + dadAge + "-year-old father and "
        + momName + " is a " + momAge + "-year-old mother.");
    }
    public void describeGenome(){
       System.out.println("Genomes are: " + geneFromMom + " and " + geneFromDad);
    }
}

