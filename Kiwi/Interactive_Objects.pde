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
  String type;
  String message;
  String graphicFile;
  
  //declare Item constructor
  Item(int x, int y, int xSize, int ySize, String type, String message, String graphicFile) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.type = type;
    this.message = message;
    this.graphicFile = graphicFile;
  }
  
  //load image of item
  public PImage loadGraphic(String graphicFile) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    return itemGraphic;
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
  
  boolean flipOrNah;
  
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
  
}

class Block extends Sprite {
  String graphicFile;
  
  //declare Block constructor
  Block(int x, int y, int xSize, int ySize, String graphicFile) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.graphicFile = graphicFile;
  }
  
  //draw a platform of blocks
  public void drawPlatform(int xStart, int xEnd, int platformHeight) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    
    for(int i = xStart; i <= xEnd; i += 50) {
      this.x = i;
      this.y = platformHeight;
      image(itemGraphic, i, platformHeight);
    }
  }
  
  //check if something is touching the top surface of the platform
  public boolean isTouching(int xStart, int xEnd, Sprite otherObject) {
    if(xStart <= otherObject.getX() && xEnd >= otherObject.getX()) {
      if(this.y <= (otherObject.getY() + otherObject.getYSize())) {
        print("touching");
        return true;
      }
      else {
        print("oop");
        return false;
      }
    }
    else {
      print("cri");
      return false;
    }
  }
  
}
