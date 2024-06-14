//Version 0.1
import family.*; 
import SocialConstructs.*;
public class Main
{
  public static void main(String[] args){
      BogeyMan bogey = new BogeyMan();
      Spacetime.nextYears(29);
      Father pavan = new Father("Pavan");
      Spacetime.nextYears(4);
      Mother prathima = new Mother("Prathima");
      Spacetime.nextYears(23);
      prathima.marry(pavan);
      Spacetime.nextYears(1);
      Daughter nikhita = new Daughter("Nikhita", pavan, prathima);
      Spacetime.nextYears(5);
      Son tejas = new Son("Tejas", pavan, prathima);
      Spacetime.nextYears(10);
      tejas.describeSiblings();
      nikhita.describeSiblings();
      nikhita.describeParents();
      nikhita.describeGenome();
      tejas.describeGenome();
      Pet dog = new Pet("Jimmy", bogey);
      dog.namePet(nikhita, "yoyo");
      dog.namePet(pavan, "jim");
      dog.callsmeBy(nikhita);
      dog.callsmeBy(pavan);
      dog.removeName();
      dog.removeName();
      bogey.check();
  }
}
