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
boolean upPressed;

//create objects
Player KiwiBird = new Player(playerX, playerY, 100, 100);
Item KiwiFruit = new Item(playerX, 800, 50, 50, "Kiwi", "insert message here", "Kiwi_Fruit.png");
Platform Platform1 = new Platform(0, y1, 1600, 50, "Metal");
Platform Platform2 = new Platform(300, y2, 500, 50, "Metal");
Ladder Ladder1 = new Ladder(300, y2, 150, 100);

void setup() {
  frameRate(70);
  size(1600, 900);
  image(KiwiBird.loadGraphic(true), playerX, playerY);
}

void draw() {
  //redraw background constantly to update screen
  background(100);
  Player KiwiBird = new Player(playerX, playerY, 100, 100);
  
  Platform1.drawPlatform();
  Platform2.drawPlatform();
  Ladder1.drawLadder();
  
  playerX += playerXSpeed;
  playerY += playerYSpeed;
  
  image(KiwiFruit.loadGraphic(), 500, 600);

  image(KiwiBird.loadGraphic(direction), playerX, playerY);
  
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
  else {
    print("fall");
    playerYSpeed += gravity;
  }
  
  if(upPressed) {
    if(KiwiBird.isTouchingL(Ladder1)) {
      playerY -= 20;
    }
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
      //if(KiwiBird.isTouching(Platform1)) {
      //  for(int i = 0; i <= 25; i++) {
      //    playerYSpeed -= i;
      //    playerYSpeed += gravity;
      //    if(playerYSpeed <= -200) {
      //      playerYSpeed = 0;
      //    }
      //  }
      //}
      //else {
      //  playerYSpeed = 0;
      //}
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
    //  if(KiwiBird.isTouching(Platform1)) {
    //    playerYSpeed = 0;
    //  }
    upPressed = false;
    }
  }
}
