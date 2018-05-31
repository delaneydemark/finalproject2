import java.io.BufferedReader;
import java.io.FileReader;



public class Space{
 Integer type;
 String name;
 float[] prices;
 Integer houses;
 Player owner;
 Card[] chanceCards;
 Card[] communityChestCards;
 
 public Space(Integer Type, String Name, float[] Prices){
   type = Type;
   name = Name;
   prices = Prices;
   houses = 0;
   owner = null;
   chanceCards = new Card[16];
   communityChestCards = new Card[16];
 }
 
 public void setUpCards(){
    //WRITE CODE TO SET UP CHANCE AND COMMUNITY CHEST CARDS

    BufferedReader brChance = null;
    FileReader frChance = null;

    try{
	frChance = new FileReader("chanceCards.csv");
	brChance = new BufferedReader(frChance);

	String currentLine;
	int i = 0;

	while((currentLine = brChance.readLine()) != null){

	   String[] line = currentLine.split(",");
	   chanceCards[i] = new Card(Float.parseFloat(line[0]), line[1], Integer.parseInt(line[2]));
	   i++;

	}
    }catch(IOException e){
      	e.printStackTrace();
      }

      BufferedReader brChest = null;
      FileReader frChest = null;

      try{
	frChest = new FileReader("communityChestCards.csv");
	brChest = new BufferedReader(frChest);

	String current;
	int index = 0;

	while((current = brChest.readLine()) != null){
	    String[] l = current.split(",");
	    communityChestCards[i] = new Card(Float.parseFloat(line[0]), line[1],Integer.parseInt(line[2]));
	    index++;
	}
      }catch(IOException e){
      	e.printStackTrace();
      }
    }
 
 
 public Player getOwner(){
   return owner;
 }
 
 public void setOwner(Player own){
   owner = own; 
 }
  
  
  public Integer getHouses(){
     return houses; 
  }
  
  public void addHouses(Integer change){
     houses += change; 
  }
  
  public float[] getPrices(){
     return prices; 
  }
  
  public Card getChanceCard(){
     int num = (int) Math.random() * (chanceCards.length + 1);
     return chanceCards[num];
  }
  
  public Card getCommunityChestCard(){
     int num = (int) Math.random() * (communityChestCards.length + 1);
     return communityChestCards[num];
  }
  
  public Integer getType(){
     return type; 
  }
  
  public String getName(){
     return name; 
  }
}
