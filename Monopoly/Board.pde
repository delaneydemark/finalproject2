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
 
 public void setCommunityChest(Card c, int index){
   communityChestCards[index] = c;
 }
  
 public Card getChanceCard(){
   int num = (int) (Math.random() * (chanceCards.length));
   return chanceCards[num];
 }
  
 public Card getCommunityChestCard(){
   int num = (int) (Math.random() * (communityChestCards.length));
   return communityChestCards[num];
 }
  
 public Space[] getArray(){
  return board;
 }
  
  
}
