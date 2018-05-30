public class Player{
 String name;
 float money;
 Integer location;
 ArrayList<Integer> properties;
 boolean inJail;
 Integer getOutOfJail;
 
 public Player(String Name){
    name = Name;
    money = 1500.0;
    location = 0;
    properties = new ArrayList<Integer>();
    inJail = false;
    getOutOfJail = 0;
 }
 
 public void addProperties(Integer prop){
    properties.add(prop); 
 }
 
 public void removeProperties(Integer prop){
    properties.remove(prop); 
 }
 
 public ArrayList<Integer> getProperties(){
    return properties; 
 }
 
 public float getMoney(){
    return money;
 }
 
 public void changeMoney(float change){
    money += change;
 }
 
 public Integer getLocation(){
    return location; 
 }
 
 public void changeLocation(Integer spaces){
   location += spaces;
 }
 
 public boolean getJail(){
   return inJail;
 }
 
 public void setJail(boolean val){
   inJail = val;
 }
 
 public Integer getGetOutOfJail(){
    return getOutOfJail; 
 }
 
 public void setGetOutOfJail(Integer val){
    getOutOfJail += val; 
 }
   
}