public class Board{
 Card[] chanceCards;
 Card[] communityChestCards; 
  
  public void setUpCards(){
    //WRITE CODE TO SET UP CHANCE AND COMMUNITY CHEST CARDS

    BufferedReader brChance = null;
    FileReader frChance = null;

    try{
  frChance = new FileReader("chance.csv");
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
  frChest = new FileReader("communityChest.csv");
  brChest = new BufferedReader(frChest);

  String current;
  int index = 0;

  while((current = brChest.readLine()) != null){
      String[] l = current.split(",");
      communityChestCards[index] = new Card(Float.parseFloat(l[0]), l[1],Integer.parseInt(l[2]));
      index++;
  }
      }catch(IOException e){
        e.printStackTrace();
      }
    }
 
   public Card getChanceCard(){
     int num = (int) Math.random() * (chanceCards.length + 1);
     return chanceCards[num];
  }
  
  public Card getCommunityChestCard(){
     int num = (int) Math.random() * (communityChestCards.length + 1);
     return communityChestCards[num];
  }
  
  
}