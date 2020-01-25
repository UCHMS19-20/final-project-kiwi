//create variables
int metalX;
int metalY;
PImage player;
PImage playerFlipped;
int playerX;
int playerY = 750;
float playerXSpeed;
float playerYSpeed;
float gravity = 0.5;
boolean direction;
int y1 = 850;
int y2 = 650;

//create objects //<>//
Player KiwiBird = new Player(playerX, playerY, 100, 100);
Item KiwiFruit = new Item(playerX, 800, 50, 50, "Kiwi", "insert message here", "Kiwi_Fruit.png");
Platform Platform1 = new Platform(0, y1, 1600, 50, "Metal");
Platform Platform2 = new Platform(300, y2, 500, 50, "Metal");

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
  
  playerX += playerXSpeed;
  playerY += playerYSpeed;
  
  image(KiwiBird.loadGraphic(direction), playerX, playerY);
  
  if(KiwiBird.isTouching(Platform1)) {
    print("one");
    playerYSpeed = 0;
  }
  else if(KiwiBird.isTouching(Platform2)) {
    print("two");
    playerYSpeed = 0;
  }
  else {
    print("fall");
    playerYSpeed += gravity;
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
      if(KiwiBird.isTouching(Platform1)) {
        playerYSpeed = -200;
      }
      if(playerYSpeed <= -250) {
        playerYSpeed = -250;
      }
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
      if(KiwiBird.isTouching(Platform1)) {
        playerYSpeed = 0;
      }
    }
  }
}
