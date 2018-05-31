public class Card{
 float change;
 String description;
 Integer type;
 
 public Card(float Change, String Description, Integer t){
    change = Change;
    description = Description;
    type = t;
    println("test");
 }
 
 public float getChange(){
    return change; 
 }
 
 public String getDescription(){
    return description; 
 }
 
 public Integer getType(){
  return type
 }
}
