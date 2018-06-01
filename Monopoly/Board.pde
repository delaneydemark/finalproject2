import java.io.BufferedReader;
import java.io.FileReader;


public class Board{
 Card[] chanceCards;
 Card[] communityChestCards;
 Space[] board;

 public Board(){
 	board = new Space[40];
 	BufferedReader brSpace = null;
	FileReader frSpace = null;
	try{

	    frSpace = new FileReader("properties.csv");
	    brSpace = new BufferedReader(frSpace);

	    String c;
	    int j = 0;

	    while((c = brSpace.readLine()) != null){
	        String[] cLine = c.split(",");
		Integer t = Integer.parseInt(cLine[1]);
		String n = cLine[2];
		float[] prices = new float[9];
		prices[0] = Float.parseFloat(cLine[3]);
		prices[1] = Float.parseFloat(cLine[4]);
		prices[2] = Float.parseFloat(cLine[5]);
		prices[3] = Float.parseFloat(cLine[7]);
		prices[4] = Float.parseFloat(cLine[8])
		prices[5] = Float.parseFloat(cLine[9]);
		prices[6] = Float.parseFloat(cLine[10]);
		prices[7] = Float.parseFloat(cLine[11]);
		prices[8] = Float.parseFloat(cLine[12]);
		Space[j] = new Space(t, n, prices);
		j++;
		
		
	    }
	}catch(IOException e){
	    e.printStackTrace();
	}
 	
 }
  
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