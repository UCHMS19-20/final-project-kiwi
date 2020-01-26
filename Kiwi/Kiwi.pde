//create variables
int metalX;
int metalY;
PImage player;
PImage playerFlipped;
int playerX;
int playerY = 750;
int formerpY;
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
int roomNum;

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
Inspectable LabTable = new Inspectable(200, 650, 500, 200, "Hmmmm, the cabinets seem to be locked.", "Table.png");

//create inventory
Item inventory[] = new Item[5];

void setup() {
  frameRate(70);
  size(1600, 900);
  image(KiwiBird.loadGraphic(true), playerX, playerY);
  roomNum = 2;
  PFont thisFont;
  thisFont = createFont("designerblock.ttf", 25);
  textFont(thisFont);
  //textSize(25);
}

void draw() {
  //redraw background constantly to update screen
  background(100);
  Player KiwiBird = new Player(playerX, playerY, 100, 100);

  
  playerX += playerXSpeed;
  playerY += playerYSpeed;
  
  if(roomNum == 1) {
    Platform1.drawPlatform();
    Ladder3.drawLadder();
    LabTable.loadGraphic();
    
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
    
    if(KiwiBird.isTouchingI(LabTable)) {
      if(spacePressed) {
        text(LabTable.getMessage(), 10, 10, 1590, 40);
      }
    }
    
    if(upPressed) {
      if(KiwiBird.isTouchingL(Ladder3)) {
        playerY -= 20;
        climbing = true;
      }
    }
  }
     
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
    
    if(upPressed) {
      if(KiwiBird.isTouchingL(Ladder1)) {
        playerY -= 20;
        climbing = true;
      }
    }
  }
  
  if(roomNum == 3) {
    Platform1.drawPlatform();
    Platform3.drawPlatform();
    Platform4.drawPlatform();
    Ladder2.drawLadder();
    

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
    
    if(upPressed) {
      if(KiwiBird.isTouchingL(Ladder2)) {
        playerY -= 20;
        climbing = true;
      }
    }
  }
  
  image(KiwiBird.loadGraphic(direction), playerX, playerY);
  
  if(playerX > 1600) {
     roomNum += 1; 
     playerX = 0;
    
  }
  
    
  if(playerX < 0) {
     roomNum -= 1;
    playerX = 1600;
  }
}
