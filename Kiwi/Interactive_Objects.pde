import java.util.ArrayList;
import java.util.List;

abstract class Sprite {
  //Coordinates
  int x;
  int y;
  
  //Length and width of image
  int xSize;
  int ySize;
  
  //Return variables
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
  
  //Declare Item constructor
  Item(int x, int y, int xSize, int ySize, String type, String message, String graphicFile) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.type = type;
    this.message = message;
    this.graphicFile = graphicFile;
  }
  
  //public boolean isTouching(Item item, Sprite otherObject) {
  //  if(item.x <= otherObject.getX() && (item.x + item.xSize) >= otherObject.getX()) {
  //    if(item.y <= (otherObject.getY() + otherObject.getYSize())) {
  //      return true;
  //    }
  //    else {
  //      return false;
  //    }
  //  }
  //  else {
  //    return false;
  //  }
  //}
  
  public PImage loadGraphic(String graphicFile) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    return itemGraphic;
  }
  
}

class Player extends Sprite {
  //Declare Player constructor
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
  
  Block(int x, int y, int xSize, int ySize, String graphicFile) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.graphicFile = graphicFile;
  }
  
  public boolean isTouching(Block block, Sprite otherObject) {
    if(block.x <= otherObject.getX() && (block.x + block.xSize) >= otherObject.getX()) {
      if(block.y <= (otherObject.getY() + otherObject.getYSize())) {
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
  
  int blockNumber;
  int platformHeight;
  
  public void drawPlatform(int blockNumber, int platformHeight) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    image(itemGraphic, x + blockNumber, platformHeight);
  }
}
