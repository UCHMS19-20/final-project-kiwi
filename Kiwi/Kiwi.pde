int metalX;
int metalY;
PImage player;
PImage playerFlipped;
int playerX = 0;
int playerY = 750;
boolean direction;
Block Metal = new Block(metalX, metalY, 50, 50, "Platform_Metal.jpg");
Player KiwiBird = new Player(playerX, playerY, 100, 100);

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
  }
}
