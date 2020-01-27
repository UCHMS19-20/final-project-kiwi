void keyPressed() {
  if(key == CODED) {
    if(keyCode == RIGHT) {
      //set direction to right
      direction = true;
      //add ten to the player's horizontal speed
      playerXSpeed += 10;
      
      //limit the horizontal speed to 20 pixels
      if(playerXSpeed >= 20) {
        playerXSpeed = 20;
      }
    }
    if(keyCode == LEFT) {
      //set direction to left
      direction = false;
      //subtract ten from the player's horizontal speed
      playerXSpeed -= 10;
      
      //limit the horizontal speed to 20 pixels
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
  if(key == 'q') {
    qPressed = true;
  }
}

void keyReleased() {
  if(key == CODED) {
    //when the keys are released, set player x speeds to 0
    if(keyCode == RIGHT) {
      direction = true;
      playerXSpeed = 0;
    }
    if(keyCode == LEFT) {
      direction = false;
      playerXSpeed = 0;
    }
    //stop the player from defying gravity
    if(keyCode == UP) {
      upPressed = false;
      climbing = false;
    }
  }

  if(key == ' ') {
    spacePressed = false;
  }
  if(key == 'q') {
    qPressed = false;
  }
}
