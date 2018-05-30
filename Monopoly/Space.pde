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
 }
 
 public void setUpCards(){
    //WRITE CODE TO SET UP CHANCE AND COMMUNITY CHEST CARDS 
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