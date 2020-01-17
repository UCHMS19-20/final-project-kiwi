PImage metal;
PImage player;
PImage playerFlipped;
int playerX = 0;
int playerY = 750;
PImage direction;

void setup() {
  frameRate(70);
  size(1600, 900);
  metal = loadImage("Platform_Metal.jpg");
  player = loadImage("Kiwi_Sprite.png");
  playerFlipped = loadImage("Kiwi_Sprite_Flipped.png");
  direction = player;
}

void draw() {
  background(100);
  for(int i = 0; i <= 800; i += 50) {
    image(metal, i, 850);
  }
  image(direction, playerX, playerY);
  image(kiwiFruit, 500, playerY);
  
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      direction = player;
      playerX += 10;
    }
    if(keyCode == LEFT) {
      direction = playerFlipped;
      playerX -= 10;
    }
  }
}
