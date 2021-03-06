import controlP5.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;
import java.util.*;

ControlP5 cp5,main,prop,ind;
controlP5.Button b,s,c,uC,buy,m, um;
controlP5.Textlabel t,rA, dice, iJ, jC,loc,name,money,propert,info;
Player[] players = new Player[4];
Board board = new Board();
float x=0;
Player player;
boolean rollAgain;
Space currentProp;
int index=0;
controlP5.Button[] please = new controlP5.Button[28]; 

void setup(){
  //work out something 
  size(1100,850);
  rollAgain = false;
  surface.setResizable(true);
  cp5= new ControlP5(this);
  main = new ControlP5(this);
  prop = new ControlP5(this);
  ind = new ControlP5(this);
  t= ind.addTextlabel("info").setPosition(720,120).setFont(createFont("Calibri",20)).setColor(255);
  b= ind.addButton("Buy_House").setPosition(720,350).setSize(100,50);
  s= ind.addButton("Sell_House").setPosition(850,350).setSize(100,50);
  c= ind.addButton("Close").setPosition(1000,420).setSize(50,50);
  m = ind.addButton("Mortgage_Property").setPosition(720,420).setSize(100,50);
  um = ind.addButton("Unmortgage_Property").setPosition(720,420).setSize(100,50);
  um.hide();
  m.hide();
  ind.hide();
  cp5.addButton("Two_Players").setPosition(50,50).setSize(175,50).setFont(createFont("Calibri",20));
  cp5.addButton("Three_Players").setPosition(275,50).setSize(175,50).setFont(createFont("Calibri",20));
  cp5.addButton("Four_Players").setPosition(500,50).setSize(175,50).setFont(createFont("Calibri",20));
  cp5.addTextfield("Player_Name").setPosition(20,200).setSize(200,40).setAutoClear(false).setFont(createFont("Calibri",20));
  cp5.addButton("Submit").setPosition(240,200).setSize(100,40).setFont(createFont("Calibri",20));
  cp5.addButton("Begin_Game").setPosition(500,300).setSize(150,40).setFont(createFont("Calibri",20));  
  parseFile();
}

void Buy_House(){
  if(currentProp.getHouses() < 5){
    currentProp.addHouses(1);
    player.changeMoney((-1)*currentProp.getPrices()[8]);  
    float[] ps = currentProp.getPrices();
    money.setText("Cash: "+ player.getMoney());
    t.setText(currentProp.getName()+"\nPrice: $"+ps[0]+"   Rent: $"+ps[2]+"\nWith 1 House:  $"+ps[3]+"\nWith 2 Houses:  $"+ps[4]+"\nWith 3 Houses:  $"+ps[5]+"\nWith 4 Houses:  $"+ps[6]+"\nWith a Hotel:  $"+ps[7]+"\nOne House Costs: $"+ps[8]+"\nMortgage Value: $"+ps[1]+"\nYou have "+ currentProp.getHouses()+" houses");
  }
}
void Sell_House(){
  if(currentProp.getHouses() > 0){
   currentProp.addHouses(-1);
   player.changeMoney(currentProp.getPrices()[8]);
    float[] ps = currentProp.getPrices();
    money.setText("Cash: "+ player.getMoney());
   t.setText(currentProp.getName()+"\nPrice: $"+ps[0]+"   Rent: $"+ps[2]+"\nWith 1 House:  $"+ps[3]+"\nWith 2 Houses:  $"+ps[4]+"\nWith 3 Houses:  $"+ps[5]+"\nWith 4 Houses:  $"+ps[6]+"\nWith a Hotel:  $"+ps[7]+"\nOne House Costs: $"+ps[8]+"\nMortgage Value: $"+ps[1]+"\nYou have "+ currentProp.getHouses()+" houses");

  }
}
void Close(){
  ind.hide();
  prop.show();
}

void Mortgage_Property(){
  currentProp.setMortgage(true);
  player.changeMoney(currentProp.getPrices()[1]);
  money.setText("Cash: "+ player.getMoney());
  m.hide();
  um.show();
}
void Unmortgage_Property(){
  currentProp.setMortgage(false);
  money.setText("Cash: "+ player.getMoney());
  player.changeMoney((-1)*currentProp.getPrices()[1]);
  um.hide();
  m.show();
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
    reader.close();
  }catch(IOException e ){
    e.printStackTrace();
  }
  
  BufferedReader chance;
  try{
    chance = createReader("chance.csv");
    String currentLine = chance.readLine();
    int i = 0;
    while((currentLine = chance.readLine()) != null){
     String[] line = currentLine.split(",");
     Card c = new Card(Float.parseFloat(line[2]), line[1], Integer.parseInt(line[0]));
     board.setChance(c, i);
     i++;
    }
    chance.close();
  }catch(IOException e){
    e.printStackTrace();
  }
  
  BufferedReader chest;
  try{
    chest = createReader("communityChest.csv");
    String current = chest.readLine();
    int index = 0;
    while((current = chest.readLine()) != null){
      String[] l = current.split(",");
      Card com = new Card(Float.parseFloat(l[2]), l[1],Integer.parseInt(l[0]));
      board.setCommunityChest(com, index);
      index++;
    }
  }catch(IOException e){
    e.printStackTrace();
  } 
}

void Two_Players(){
  players = new Player[2];  
}

void Three_Players(){
  players = new Player[3];  
}

void Four_Players(){
  players = new Player[4];  
}
void Submit(){
 String t = cp5.get(Textfield.class,"Player_Name").getText(); 
 players[(int)x] = new Player(t);
 x++;
 //println(players);
 }
 
 void Begin_Game(){
     cp5.hide();
     main.addButton("gameBoard").setPosition(0,0).setImage(loadImage("board.jpg"));
     main.addButton("End_Turn").setPosition(950,725).setSize(100,50).setFont(createFont("Calibri",20));
     main.addButton("Roll_Dice").setPosition(925,70).setSize(115,30).setFont(createFont("Calibri",20));
     rA = main.addTextlabel("rollAgain").setPosition(900,110).setFont(createFont("Calibri",10)).setColor(255).setText("");
    dice = main.addTextlabel("dice").setPosition(1050,70).setFont(createFont("Calibri",30)).setColor(255).setText("");
     iJ = main.addTextlabel("inJail").setPosition(20,710).setFont(createFont("Calibri",30)).setColor(255).setText("");
     jC =  main.addTextlabel("jailCard").setPosition(20,750).setFont(createFont("Calibri",30)).setColor(255).setText("");
     uC = main.addButton("Use_It").setPosition(525,755).setSize(50,30);
     loc = main.addTextlabel("location").setPosition(20,740).setFont(createFont("Calibri",40)).setColor(255).setText("");
     name = main.addTextlabel("name").setPosition(720,20).setFont(createFont("Calibri",30)).setColor(255).setText("");
     money = main.addTextlabel("money").setPosition(720,70).setFont(createFont("Calibri",30)).setColor(255).setText("");
     propert = prop.addTextlabel("props").setPosition(720,120).setFont(createFont("Calibri",30)).setColor(255);
     buy = main.addButton("Buy").setPosition(925,800).setSize(50,30).hide();
     info = main.addTextlabel("info").setPosition(20,800).setFont(createFont("Calibri",40)).setColor(255).setText("");
     for(int i = 0; i <28;i++){
       please[i] = prop.addButton(""+i).setPosition(720,150+(30*i)).setSize(250,25).setFont(createFont("Calibri",20));
     }    
     uC.hide();
     turn(players[0]);
 }
 
 void Use_It(){
  player.setGetOutOfJail(-1);
  player.setJail(false);
  player.changeJailCounter(-1*player.getJailCounter());
  move(player, rollDice(), rollDice());
 }

 void End_Turn(){
   index++;
   dice.setText("");
   iJ.setText("");
   uC.hide();
   name.setText("");
   money.setText("");
   propert.setText("");
   info.setText("");
   buy.hide();
   um.hide();
   m.hide();
   boolean found = false;
    for(int i=0;i < players.length;i++){
      if(players[((index%players.length)+i)%players.length].getMoney() >0&&!found){
       turn(players[((index%players.length) + i)%players.length]);
       index+= i;
       found = true;
      }
    }
    if(!found){
      main.addTextlabel("GAME OVER").setPosition(20,450).setFont(createFont("Calibri",30)).setColor(1255);
    }
 }
 
 
 int move(Player pl, int b, int c){
  /*int b = rollDice();
  int c = rollDice();*/
  int d= b+c;
  pl.changeLocation((float) d);
  loc.setText("You Are At "+ board.getArray()[(int)pl.getLocation()].getName());
  if(pl.getLocation() - d < 0){
     pl.changeMoney(200); 
  }
  board.getArray()[(int)pl.getLocation()].evaluate(pl,board,(float)d,buy,info,money); 
  if(b==c){
    rA.setText("You rolled doubles. Roll again!");
    //main.addTextlabel("rollAgain").setPosition(900,110).setFont(createFont("Calibri",30)).setColor(255).setText("You rolled doubles. Roll again!");
    //move(p); // INSTEAD ASK THEM TO ROLL AGAIN...WORK OUT HOW TO GET P(MAYBE CREATE AN INSTANVCE VARIABLE KEEPING TRACK OF PLAYER
    player =pl;
    rollAgain = true;
  }
  return d;
 }
 
 
 void Roll_Dice(){
   int b = rollDice();
   int c = rollDice();
   String d= "" + (b+c);
   rA.setText("");
   dice.setText(d);
   if(player.getJail()){
      breakingOutOfJail(player,b,c); 
   }
   else if(rollAgain){
     rollAgain= false;
     buy.hide();
     move(player, b, c);
   }
   else{
     move(player,b,c);
   }
 }
 
 void turn(Player p){
   if(p.getJail()){
     iJ.setText("You are in Jail. Max turns left in Jail: "+ (3-p.getJailCounter()));
     if(p.getGetOutOfJail()>0){     
       jC.setText("You have a get out of Jail Card");
       uC.show();
     }
   }
   else{
     iJ.setText("You are not in Jail");
     loc.setText("You Are At "+ board.getArray()[(int)p.getLocation()].getName());
   }
   name.setText(p.getName()+ "'s Turn");
   money.setText("Cash: "+ p.getMoney());
   propert.setText("PROPERTIES");
  for(int i = 0; i < p.getProperties().size();i++){
       please[i].setLabel(board.getArray()[p.getProperties().get(i)].getName()).show()
      .onPress(new CallbackListener(){
       public void controlEvent(CallbackEvent theEvent){
         prop.hide();
         ind.show();
         currentProp = board.getArray()[player.getProperties().get(Integer.parseInt(theEvent.getController().getName()))];
         float[] ps = currentProp.getPrices();
         if(currentProp.getMortgage()){
            um.show(); 
         }
         else{
            m.show(); 
         }
         t.setText(currentProp.getName()+"\nPrice: $"+ps[0]+"   Rent: $"+ps[2]+"\nWith 1 House:  $"+ps[3]+"\nWith 2 Houses:  $"+ps[4]+"\nWith 3 Houses:  $"+ps[5]+"\nWith 4 Houses:  $"+ps[6]+"\nWith a Hotel:  $"+ps[7]+"\nOne House Costs: $"+ps[8]+"\nMortgage Value: $"+ps[1]+"\nYou have "+ currentProp.getHouses()+" houses");
       }
     });
  }
  for(int i = p.getProperties().size();i < 28;i++){
       please[i].hide();
  }
     //WORK OUT HOW TO REDISTRIBUTE OUT CODE BELOW
  if(p.getMoney() >0 && !p.getJail()){
     player = p;
  }
  else if(p.getMoney() > 0 && p.getJail()){
    player = p;
  }
 }
 
 void breakingOutOfJail(Player p,int b,int c){
   int dieOne = b;
   int dieTwo =c;
   if(p.getJailCounter() < 3){
     // if the player rolls doubles, they are free
     if(dieOne == dieTwo){
       p.setJail(false);
       p.changeJailCounter(-1*p.getJailCounter());
       move(p, dieOne, dieTwo);
      // if the player doesn't roll doubles and has had less 
      //than three turns in jail, stay in jail
     }else{
       p.changeJailCounter(1);
     }
     // if the player has spent three turns in jail, pay 50 & free
   }else{
     p.changeMoney(-50);
     p.setJail(false);
     p.changeJailCounter(-3);
     move(p, dieOne, dieTwo);
   }
 }


// returns true if the game is over, returns false otherwise
 boolean end(){
   int alive = players.length;
   for(int i = 0; i<players.length; i++){
     if(players[i].getMoney()<=0){
       alive--;
     }
   }
   return alive < 2; 
 }
 
 int rollDice(){
   return 1 + (int)(Math.random() * 6);
 }
