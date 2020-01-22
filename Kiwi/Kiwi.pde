//create variables
int metalX;
int metalY;
PImage player;
PImage playerFlipped;
int playerX;
int playerY = 750;
int playerSpeed;
int gravity = 20;
boolean direction;

//create objects
Block Metal = new Block(metalX, metalY, 50, 50, "Platform_Metal.jpg");
Player KiwiBird = new Player(playerX, playerY, 100, 100);
Item KiwiFruit = new Item(playerX, 800, 50, 50, "Kiwi", "insert message here", "Kiwi_Fruit.png");

void setup() {
  frameRate(70);
  size(1600, 900);
  image(KiwiBird.loadGraphic(true), playerX, playerY);
}

void draw() {
  //redraw background constantly to update screen
  background(100);
  Player KiwiBird = new Player(playerX, playerY, 100, 100);
  
  Metal.drawPlatform(platformXS[0], platformXE[0], platformY[0]);
  
  playerY += playerSpeed;
  
  image(KiwiBird.loadGraphic(direction), playerX, playerY);
  
  if(Metal.isTouching(platformXS[0], platformXE[0], KiwiBird)) {
    playerSpeed = 0;
    print("touching");
  }
  else {
    playerSpeed += gravity;
  }

}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      direction = true;
      playerX += 10;
    }
    if(keyCode == LEFT) {
      direction = false;
      playerX -= 10;
    }
    if(keyCode == UP) {
      if(Metal.isTouching(platformXS[0], platformXE[0], KiwiBird)) {
        playerSpeed = -25;
      }
    }
  }
}
