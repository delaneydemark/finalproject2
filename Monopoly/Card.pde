public class Card{
 float change;
 String description;
 
 public Card(float Change, String Description){
    change = Change;
    description = Description;
    println("test");
 }
 
 public float getChange(){
    return change; 
 }
 
 public String getDescription(){
    return description; 
 }
}