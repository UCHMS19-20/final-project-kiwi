abstract class Sprite {
  //coordinates
  int x;
  int y;
  
  //length and width of image
  int xSize;
  int ySize;
  
  //return variables for any entity
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getXSize() {
    return xSize;
  }
  
  public int getYSize() {
    return ySize;
  }
}

class Item extends Sprite {
  String message;
  String graphicFile;
  
  //declare Item constructor
  Item(int x, int y, int xSize, int ySize, String message, String graphicFile) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.message = message;
    this.graphicFile = graphicFile;
  }
  
  //load image of item
  public void loadGraphic() {
    PImage itemGraphic;
    itemGraphic = loadImage(this.graphicFile);
    image(itemGraphic, this.x, this.y);
  }
  
  //return item message
  public String getMessage() {
    return this.message;
  }
}

class Inspectable extends Sprite {
  String message;
  String graphicFile;
  
  //declare Inspectable constructor
  Inspectable(int x, int y, int xSize, int ySize, String graphicFile) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.graphicFile = graphicFile;
  }
  
  //load image of inspectable item
  public void loadGraphic() {
    PImage inspGraphic;
    inspGraphic = loadImage(this.graphicFile);
    image(inspGraphic, this.x, this.y);
  }
}

class Ladder extends Sprite {
  String graphicFile = "Ladder.png";
  
  //declare Ladder constructor
  Ladder(int x, int y, int xSize, int ySize) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  //load image of ladder
  public void drawLadder() {
    PImage ladderGraphic;
    ladderGraphic = loadImage(graphicFile);
    
    //draw ladder to a specified height
    for(int i = this.y; i <= (this.y + this.ySize); i += 100) {
      image(ladderGraphic, this.x, i);
    }
  }
}

class Platform extends Sprite {
  String type;
  String graphicFile;
  
  //declare Platform constructor
  Platform(int x, int y, int xSize, int ySize, String type) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.type = type;
    
    if(type == "Metal") {
      this.graphicFile = "Platform_Metal.jpg";
    }
  }
  
  //load image of platform
  public void drawPlatform() {
    PImage blockGraphic;
    blockGraphic = loadImage(graphicFile);
    
    //draw platform to a specified width
    for(int i = this.x; i <= (this.x + this.xSize); i += 50) {
      image(blockGraphic, i, this.y);
    }
  } 
}

class Player extends Sprite {
  
  //declare Player constructor
  Player(int x, int y, int xSize, int ySize) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  //true means that the player is moving right, and false means that the player is moving left
  boolean flipOrNah;
  
  //load image of player
  public PImage loadGraphic(boolean flipOrNah) {
    PImage itemGraphic;
    if(flipOrNah) {
      itemGraphic = loadImage("Kiwi_Sprite.png");
    }
    else {
      itemGraphic = loadImage("Kiwi_Sprite_Flipped.png");
    }
    return itemGraphic;
  }
  
  //check whether the player is touching a platform
  public boolean isTouchingP(Platform platform) {
    if(((this.x + this.xSize) >= platform.getX()) && (this.x <= (platform.getX() + platform.getXSize()))) {
      if(((this.y + this.ySize) >= platform.getY()) && ((this.y + this.ySize) <= (platform.getY() + platform.getYSize()))) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  
  //check whether the player is touching a ladder
  public boolean isTouchingL(Ladder ladder) {
    if(((this.x + this.xSize) >= ladder.getX()) && (this.x <= (ladder.getX() + ladder.getXSize()))) {
      if(((this.y + this.ySize) >= ladder.getY()) && (this.y <= (ladder.getY() + ladder.getYSize()))) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  
  //check whether the player is touching an Inspectable item, but not on top of it
  public boolean isTouchingI(Inspectable insp) {
    if(((this.x + this.xSize) >= insp.getX()) && (this.x <= (insp.getX() + insp.getXSize()))) {
      if(((this.y + this.ySize) >= (insp.getY() + 1)) && (this.y <= (insp.getY() + insp.getYSize()))) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  
  //check whether the player is touching a usable Item
  public boolean isTouchingI(Item item) {
    if(((this.x + this.xSize) >= item.getX()) && (this.x <= (item.getX() + item.getXSize()))) {
      if(((this.y + this.ySize) >= (item.getY() + 1)) && (this.y <= (item.getY() + item.getYSize()))) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}
