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
  
  if(key == ' ') {
    spacePressed = true;
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
  if(key == ' ') {
    spacePressed = false;
  }
}
