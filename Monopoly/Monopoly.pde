Player t;
Board board;

void setup(){
  //work out something 
  size(600,300);
  t = new Player("Carmen");
  println(t.getName());
  float[] info = {12.6,22.3,33.8};
  Space test = new Space(0,0,"Park Place",info);
  test.setOwner(t);
  println(t.getMoney());
}
        
void update(){
  background(255);
  println("test");
}
