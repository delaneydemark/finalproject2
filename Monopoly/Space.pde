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
  
  
  public void evaluate(Player p, Board b){
    if(type.equals(0)){
      
    }
    else if (type.equals(1)){
      
    }
    else if (type.equals(2)){
      
    }
    else if (type.equals(3)){
      Card c = board.getChanceCard();
      if(c.getType().equals(0)){
         p.changeLocation(c.getChange());
         b.getArray()[(int) p.getLocation()].evaluate(p,b);
      }
      else if(c.getType().equals(1){
         p.changeMoney(c.getChange());
      }
      else if(c.getType().equals(2){
         p.setGetOutOfJail(1); 
      }
      else if(c.getType().equals(4){
         p.setLocation(c.getChange()); 
      }
    }
    else if (type.equals(4)){
      
    }
    else if (type.equals(5)){
      
    }
  }
}