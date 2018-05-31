import java.io.BufferedReader;
import java.io.FileReader;



public class Space extends Monopoly{
 Integer type;
 String name;
 float[] prices;
 Integer houses;
 Player owner;
 
 public Space(Integer Type, String Name, float[] Prices){
   type = Type;
   name = Name;
   prices = Prices;
   houses = 0;
   owner = null;
   chanceCards = new Card[16];
   communityChestCards = new Card[16];
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
  
  public Integer getType(){
     return type; 
  }
  
  public String getName(){
     return name; 
  }
}