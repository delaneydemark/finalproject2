import g4p_controls.*;

Player[] players;
Board board;

void setup(){
  board =new Board();
  //work out something 
  size(600,300);
  GTextField text = new GTextField(this,55,56,160,30, G4P.SCROLLBARS_NONE);
  text.draw();
  println(text.getText());
  BufferedReader br;
  FileReader fr;
  try{
    fr = new FileReader("a.txt");
  
  }catch(Exception e){
    
  }
}
public void handleTextEvents(GEditableTextControl textcont,GEvent event){
    println(textcont.getText());
    
  
}
        
void update(){
  background(255);
  println("test");
}