public class Player{
 String name;
 float money;
 float location;
 ArrayList<Integer> properties;
 boolean inJail;
 Integer getOutOfJail;
 Integer jailCounter;
 Integer rrCounter=0;
 Integer uCounter= 0;
 
 public Player(String Name){
    name = Name;
    money = 1500.0;
    location = 0;
    properties = new ArrayList<Integer>();
    inJail = false;
    getOutOfJail = 0;
    jailCounter = 0;
 }
 
 public String toString(){
  return name; 
 }
 
 public Integer getUCounter(){
  return uCounter; 
 }
 
 public Integer getRRCounter(){
   return rrCounter;
 }
 
 public void setRRCounter(Integer c){
  rrCounter += c; 
 }
 
 public void setUCounter(Integer c){
  uCounter += c; 
 }
 
 public Integer getJailCounter(){
  return jailCounter; 
 }
 
 public void changeJailCounter(Integer c){
  jailCounter+= c; 
 }
 
 public String getName(){
    return name; 
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
 
 public void setLocation(float l){
    location = l; 
 }
 
 public float getLocation(){
    return location; 
 }
 
 public void changeLocation(float spaces){
   location += spaces+40;
   location = location % 40;
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
