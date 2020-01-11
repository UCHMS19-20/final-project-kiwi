PImage metal;
PImage player;
int playerX = 0;

void setup() {
  size(1600, 900);
  metal = loadImage("Platform_Metal.jpg");
  player = loadImage("Kiwi_Sprite.png");
}

void draw() {
  for(int i = 0; i <= 800; i += 50) {
    image(metal, i, 850);
  }
  image(player, playerX, 750);
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      playerX += 25;
    }
  }
}
