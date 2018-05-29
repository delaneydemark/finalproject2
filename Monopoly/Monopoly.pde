public void setup(){
  //work out something 
  size(600,300);
  Card test = new Card(-13.5,"You lose $13.5");
  println(test.getChange());
  println(test.getDescription());
}
        
public void update(){
  background(255);
  println("test");
  Card test = new Card(-13.5,"You lose $13.5");
  println(test.getChange());
  println(test.getDescription());
}