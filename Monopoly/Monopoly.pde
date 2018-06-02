import controlP5.*;

ControlP5 cp5;
Player[] players = new Player[4];
Board board = new Board();
float x=0;
String t ="";

void setup(){
  //work out something 
  size(700,400);
  cp5= new ControlP5(this);
  cp5.addButton("TwoPlayers").setPosition(50,50).setSize(50,50);
  cp5.addButton("ThreePlayers").setPosition(150,50).setSize(50,50);
  cp5.addButton("FourPlayers").setPosition(250,50).setSize(50,50);
  cp5.addTextfield("PlayerName").setPosition(20,200).setSize(200,40).setAutoClear(false);
  cp5.addButton("Submit").setPosition(240,200).setSize(80,40);
  cp5.addButton("BeginGame").setPosition(600,300).setSize(80,40);
}

void draw(){
 background(0); 
}

void parseFile(){
  BufferedReader reader;
  try{
    reader= createReader("properties.csv");
    String c = reader.readLine();
    int j = 0;
    while((c = reader.readLine()) != null){
      String[] cLine = c.split(",");
      Integer t = Integer.parseInt(cLine[1]);
      String n = cLine[2];
      float[] prices = new float[9];
      prices[0] = Float.parseFloat(cLine[3]);
      prices[1] = Float.parseFloat(cLine[4]);
      prices[2] = Float.parseFloat(cLine[5]);
      prices[3] = Float.parseFloat(cLine[7]);
      prices[4] = Float.parseFloat(cLine[8]);
      prices[5] = Float.parseFloat(cLine[9]);
      prices[6] = Float.parseFloat(cLine[10]);
      prices[7] = Float.parseFloat(cLine[11]);
      prices[8] = Float.parseFloat(cLine[12]);
      Space s = new Space(j,t, n, prices);
      board.setBoard(s,j);
      j++;
    
    
    }
  }catch(IOException e ){
    e.printStackTrace();
  }
  
}

void TwoPlayers(){
  players = new Player[2];  
}

void ThreePlayers(){
  players = new Player[3];  
}

void FourPlayers(){
  players = new Player[4];  
}
void Submit(){
 t = cp5.get(Textfield.class,"PlayerName").getText(); 
 players[(int)x] = new Player(t);
 x++;
 println(players);
 }
 
 void BeginGame(){
 /*    cp5.remove("TwoPlayers");
     cp5.remove("ThreePlayers");
     cp5.remove("FourPlayers");
     cp5.remove("BeginGame");
     cp5.remove("Submit");
     cp5.remove("PlayerName");*/
 }
