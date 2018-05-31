public void setup(){
  //work out something 
  size(600,300);
  Player t = new Player("Carmen");
  float[] info = {12.6,22.3,33.8};
  Space test = new Space(0,"Park Place",info);
  test.setOwner(t);
  println(test.getOwner());  
}
        
public void update(){
  background(255);
  println("test");
}