import java.util.Arrays;
import java.util.List;

//create variables
int metalX;
int metalY;
PImage player;
PImage playerFlipped;
int playerX;
int playerY = 750;
float playerXSpeed;
float playerYSpeed;
float gravity = 0.9;
boolean direction;
int y1 = 850;
int y2 = 650;
int y3 = 250;
int y4 = 550;
boolean upPressed;
boolean climbing;
boolean spacePressed;
boolean qPressed;
int roomNum;
boolean tableKeyVisible = true;
String tableMessage = "Hmmmm, the cabinets seem to be locked.";
String computerMessage = "Press q to view the information on the computer";

//create objects
Player KiwiBird = new Player(playerX, playerY, 100, 100);
Platform Platform1 = new Platform(0, y1, 1600, 50, "Metal");
Platform Platform2 = new Platform(300, y2, 500, 50, "Metal");
Platform Platform3 = new Platform(500, y3, 700, 50, "Metal");
Platform Platform4 = new Platform(650, y4, 700, 50, "Metal");
Platform TablePlatform = new Platform(200, 650, 500, 50, "Metal");
Ladder Ladder1 = new Ladder(300, y2, 150, 100);
Ladder Ladder2 = new Ladder(500, y3, 150, 500);
Ladder Ladder3 = new Ladder(700, 650, 150, 100);
Inspectable LabTable = new Inspectable(200, 650, 500, 200, "Table.png");
Inspectable Computer = new Inspectable(250, 520, 130, 130, "Computer.png");
Item TableKey = new Item(800, 500, 50, 25, "Press q to pick up.", "Key.png");

//create inventory
ArrayList<Item> inventory = new ArrayList<Item>();

void setup() {
  frameRate(70);
  size(1600, 900);
  image(KiwiBird.loadGraphic(true), playerX, playerY);
  
  //starting room
  roomNum = 2;
  
  //set up text
  PFont thisFont;
  thisFont = createFont("designerblock.ttf", 25);
  textFont(thisFont);
}

void draw() {
  //redraw background constantly to update screen
  background(100);
  
  Player KiwiBird = new Player(playerX, playerY, 100, 100);
  
  //set player velocities
  playerX += playerXSpeed;
  playerY += playerYSpeed;
  
  //check the inventory to see whether the player is carrying the key to the cabinets
  for(Item i : inventory) {
    //open the cabinets if the player has the key
    if(i == TableKey) {
        tableMessage = "The cabinets are open!";
    }
  }
  
  //set up room 1
  if(roomNum == 1) {
    Platform1.drawPlatform();
    Ladder3.drawLadder();
    LabTable.loadGraphic();
    Computer.loadGraphic();
    
    if(KiwiBird.isTouchingP(Platform1)) {
      playerY = y1 - 100;
      playerYSpeed = 0;
    }
    else if(KiwiBird.isTouchingP(TablePlatform)) {
      playerY = 550;
      playerYSpeed = 0;
    }
    else if(!climbing) {
      playerYSpeed += gravity;
    }
    
    if(spacePressed) {
      if(KiwiBird.isTouchingI(LabTable)) {
        text(tableMessage, 10, 10, 1590, 40);
      }
      if(KiwiBird.isTouchingI(Computer)) {
        text(computerMessage, 10, 10, 1590, 40);
      }
    }
    
    if(qPressed) {
      if(KiwiBird.isTouchingI(Computer)) {
        //this does not exist yet because the graphics are extremely time-consuming
      }
    }
    
    //climb the ladder
    if(upPressed) {
      if(KiwiBird.isTouchingL(Ladder3)) {
        playerY -= 20;
        climbing = true;
      }
    }
  }
  //set up room 2
  if(roomNum == 2) {
    Platform1.drawPlatform();
    Platform2.drawPlatform();
    Ladder1.drawLadder();
    
    if(KiwiBird.isTouchingP(Platform1)) {
      playerY = y1 - 100;
      playerYSpeed = 0;
    }
    else if(KiwiBird.isTouchingP(Platform2)) {
      playerY = y2 - 100;
      playerYSpeed = 0;
    }
    else if(!climbing) {
      playerYSpeed += gravity;
    }
    
    //climb ladder
    if(upPressed) {
      if(KiwiBird.isTouchingL(Ladder1)) {
        playerY -= 20;
        climbing = true;
      }
    }
  }
  //set up room 3
  if(roomNum == 3) {
    Platform1.drawPlatform();
    Platform3.drawPlatform();
    Platform4.drawPlatform();
    Ladder2.drawLadder();
    if(tableKeyVisible) {
      TableKey.loadGraphic();
    }
    
    if(KiwiBird.isTouchingP(Platform1)) {
      playerY = y1 - 100;
      playerYSpeed = 0;
    }
    else if(KiwiBird.isTouchingP(Platform3)) {
      playerY = y3 - 100;
      playerYSpeed = 0;
    }
    else if(KiwiBird.isTouchingP(Platform4)) {
      playerY = y4 - 100;
      playerYSpeed = 0;
    }
    else if(!climbing) {
      playerYSpeed += gravity;
    }
    
    if(spacePressed) {
      if(KiwiBird.isTouchingI(TableKey)) {
        text(TableKey.getMessage(), 10, 10, 1590, 40);
      }
    }
    
    //add key to inventory and hide it from the screen
    if(qPressed) {
      if(KiwiBird.isTouchingI(TableKey)) {
        inventory.add(TableKey);
        tableKeyVisible = false;
      }
    }
    
    if(upPressed) {
      if(KiwiBird.isTouchingL(Ladder2)) {
        playerY -= 20;
        climbing = true;
      }
    }
  }
  
  //update position of player
  image(KiwiBird.loadGraphic(direction), playerX, playerY);
  
  //move player to the next room
  if(playerX > 1600) {
     roomNum += 1; 
     playerX = 0;
    
  }
  
 
  if(playerX < 0) {
     roomNum -= 1;
    playerX = 1600;
  }
}
