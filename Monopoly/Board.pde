import java.io.BufferedReader;
import java.io.FileReader;
import java.io.*;
import java.util.*;

public class Board{
 Card[] chanceCards;
 Card[] communityChestCards;
 Space[] board;

 public Board(){
 	chanceCards = new Card[15];
 	communityChestCards = new Card[14];
 	board = new Space[40];
 }
 
 public void setBoard(Space s, int index){
   board[index] = s;
 }
 
 public void setChance(Card c, int index){
   chanceCards[index] = c;
 }
  
  public void setUpCards(){
    //WRITE CODE TO SET UP CHANCE AND COMMUNITY CHEST CARDS

    BufferedReader brChance = null;
    FileReader frChance = null;

    try{
  frChance = new FileReader("chance.csv");
  brChance = new BufferedReader(frChance);

  String currentLine = brChance.readLine();
  int i = 0;

  while((currentLine = brChance.readLine()) != null){

     String[] line = currentLine.split(",");
     chanceCards[i] = new Card(Float.parseFloat(line[2]), line[1], Integer.parseInt(line[0]));
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

  String current = brChest.readLine();
  int index = 0;

  while((current = brChest.readLine()) != null){
      String[] l = current.split(",");
      communityChestCards[index] = new Card(Float.parseFloat(l[2]), l[1],Integer.parseInt(l[0]));
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
  
  public Space[] getArray(){
    return board;
  }
  
  
}
