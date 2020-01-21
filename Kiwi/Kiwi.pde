int metalX;
int metalY;
PImage player;
PImage playerFlipped;
int playerX = 0;
int playerY = 750;
int playerSpeed;
int gravity = 10;
boolean direction;
Block Metal = new Block(metalX, metalY, 50, 50, "Platform_Metal.jpg");
Player KiwiBird = new Player(playerX, playerY, 100, 100);
Item KiwiFruit = new Item(playerX, 800, 50, 50, "Kiwi", "Fruity", "Kiwi_Fruit.png");

void setup() {
  frameRate(70);
  size(1600, 900);
  image(KiwiBird.loadGraphic(true), playerX, playerY);
}

void draw() {
  background(100);
  for(int i = 0; i <= 800; i += 50) {
    Metal.drawPlatform(i, 850);
  }
  image(KiwiBird.loadGraphic(direction), playerX, playerY);
  
  int nextY = playerY + playerSpeed;
  playerSpeed += gravity;
  
  if(Metal.isTouching(Metal, KiwiBird)) {
    playerSpeed = 0;
  }
  
  playerY = nextY;
  playerY += playerSpeed;
  
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
      if(Metal.isTouching(Metal, KiwiBird)) {
        playerSpeed = -15;
      }
    }
  }
}
