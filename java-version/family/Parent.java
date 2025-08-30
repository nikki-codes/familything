package family;
import java.util.Arrays;
public class Parent extends Person
{
    public Parent(String name, Person.Gender gender) {
        super(name,gender); 
    }
    private Parent spouse;
    private Child children[];
    public int numChildren=0;
    private int childrenCapacity=1;

    protected void connect(Parent spouse){
        if(this.spouse != spouse ) {
            this.spouse = spouse;
            spouse.connect(this);
            children = new Child[childrenCapacity];
        }
    }

    public void addChild(Child child){
        // if child is not present in the arrary then do rest of the logic
        if(Arrays.asList(children).contains(child) == false) {
            // put the new child into 0th place of children array
            // if 0th place is full, put in next place
            if(childrenCapacity == numChildren) {
                increaseCapacity();
            }
            children[numChildren] = child;
            this.spouse.addChild(child);
            numChildren++;
        }
    }
    private void increaseCapacity() {
        //Create a new holder
        Child newHolder[] = new Child[++childrenCapacity];
        //Move all old children to this holder
        for (int i=0; i<children.length; i++) {
            newHolder[i] = children[i];
        }
        children = newHolder;
        //override our name children to the new holder
        //bogey man will cleanup old data ram children pointing to 
    }

    public Child[] listChildren(){
        return children;
    }

}
