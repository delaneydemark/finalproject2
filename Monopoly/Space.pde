import java.io.BufferedReader;
import java.io.FileReader;



public class Space extends Monopoly{
 Integer type;
 String name;
 float[] prices;
 Integer houses;
 Player owner;
 int index;
 
 public Space(int ind, Integer Type, String Name, float[] Prices){
   type = Type;
   name = Name;
   prices = Prices;
   houses = 0;
   owner = null;
   index = ind;
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
  
  
  public void evaluate(Player p, Board b, float d){
    println(prices[0]);
    if(type.equals(0)){
      if(owner.equals(null)){//not the problem
        //check if want to buy
        boolean buy = true;
        if(buy){
          
         p.changeMoney(-1*prices[0]);
         owner = p;
         p.addProperties(index);
        }
      }
      else if(!owner.equals(p)){
        float rent = 0;
        if(houses.equals(0)){
          rent = prices[2];
        }
        else{
          rent = prices[houses+3];
        }
        p.changeMoney(-1*rent);
        owner.changeMoney(rent);
      }
    }
    else if (type.equals(1)){
      int n = 0;
      if(index % 5 == 0){
        n = 1;
      }        
      if(owner.equals(null)){
        //check if want to buy
        boolean buy = true;
        if(buy){
         p.changeMoney(-1*prices[0]);
         owner = p;
         p.addProperties(index);
         if(n == 0){
          p.setUCounter(1); 
         }
         else{
          p.setRRCounter(1); 
         }
        }
      }
      else if(!owner.equals(p)){
        int t = 0;
      if(index % 5 == 0){
        t = 1;
      }  
      float count = 0;
      if(t == 0){
          count = owner.getUCounter(); 
         }
         else{
          count = owner.getRRCounter(); 
         }
        float rent = 0;
         if(t==0 && count == 1){
          rent = 4*d; 
         }
         else if(t ==0 && count ==2){
           rent = 10 * d;
         }
         else{
          rent = 25 * (float)(java.lang.Math.pow(2,count)); 
         }
        p.changeMoney(-1*rent);
        owner.changeMoney(rent);
      }
    }
    else if (type.equals(2)){
      Card c = board.getCommunityChestCard();
      if(c.getType().equals(1)){
         p.changeMoney(c.getChange());
      }
      else if(c.getType().equals(2)){
         p.setGetOutOfJail(1); 
      }
      else if(c.getType().equals(4)){
         p.setLocation(c.getChange()); 
      }
    }
    else if (type.equals(3)){
      Card c = board.getChanceCard();
      if(c.getType().equals(0)){
         p.changeLocation(c.getChange());
         b.getArray()[(int) p.getLocation()].evaluate(p,b,d);
      }
      else if(c.getType().equals(1)){
         p.changeMoney(c.getChange());
      }
      else if(c.getType().equals(2)){
         p.setGetOutOfJail(1); 
      }
      else if(c.getType().equals(4)){
         p.setLocation(c.getChange()); 
      }
    }
    else if (type.equals(4)){
      p.changeMoney(-1*prices[2]);
    }
  }
}
