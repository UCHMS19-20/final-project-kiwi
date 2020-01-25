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
float gravity = 0.75;
boolean direction;
int y1 = 850;
int y2 = 650;
int y3 = 250;
boolean upPressed;
boolean climbing;
int roomNum;

//create objects
Player KiwiBird = new Player(playerX, playerY, 100, 100);
Platform Platform1 = new Platform(0, y1, 1600, 50, "Metal");
Platform Platform2 = new Platform(300, y2, 500, 50, "Metal");
Platform Platform3 = new Platform(500, y3, 700, 50, "Metal");
Ladder Ladder1 = new Ladder(300, y2, 150, 100);
Ladder Ladder2 = new Ladder(500, y3, 150, 500);

void setup() {
  frameRate(70);
  size(1600, 900);
  image(KiwiBird.loadGraphic(true), playerX, playerY);
  roomNum = 2;
}

void draw() {
  //redraw background constantly to update screen
  background(100);
  Player KiwiBird = new Player(playerX, playerY, 100, 100);

  
  playerX += playerXSpeed;
  playerY += playerYSpeed;
     
  if(roomNum == 2) {
    Platform1.drawPlatform();
    Platform2.drawPlatform();
    Ladder1.drawLadder();
    
    if(KiwiBird.isTouchingP(Platform1)) {
      playerY = y1 - 100;
      print("one");
      playerYSpeed = 0;
    }
    else if(KiwiBird.isTouchingP(Platform2)) {
      playerY = y2 - 100;
      print("two");
      playerYSpeed = 0;
    }
    else if(!climbing) {
      print("fall");
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
    Ladder2.drawLadder();
    

    if(KiwiBird.isTouchingP(Platform1)) {
      playerY = y1 - 100;
      print("one");
      playerYSpeed = 0;
    }
    else if(KiwiBird.isTouchingP(Platform3)) {
      playerY = y3 - 100;
      print("three");
      playerYSpeed = 0;
    }
    else if(!climbing) {
      print("fall");
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

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      direction = true;
      playerXSpeed += 10;
      
      if(playerXSpeed >= 20) {
        playerXSpeed = 20;
      }
    }
    if(keyCode == LEFT) {
      direction = false;
      playerXSpeed -= 10;
      
      if(playerXSpeed <= -20) {
        playerXSpeed = -20;
      }
    }
    if(keyCode == UP) {
      upPressed = true;
    }
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      direction = true;
      playerXSpeed = 0;
    }
    if(keyCode == LEFT) {
      direction = false;
      playerXSpeed = 0;
    }
    if(keyCode == UP) {
      upPressed = false;
      climbing = false;
    }
  }
}
