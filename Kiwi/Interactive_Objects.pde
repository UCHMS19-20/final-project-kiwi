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
 
  //public abstract boolean isTouching(Sprite sprite, Sprite otherObject);
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
  
  public boolean isTouching(Item object, Sprite otherObject) {
    return !((object.x + object.xSize) > (otherObject.getX()) || (object.x) < (otherObject.getX() + otherObject.getXSize()) || (object.y) > (otherObject.getY() + otherObject.getYSize()) || (object.y + object.ySize) < (otherObject.getY()));
  }
  
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
  
  public boolean isTouching(Player player, Sprite otherObject) {
    return !((player.x + player.xSize) > (otherObject.getX()) || (player.x) < (otherObject.getX() + otherObject.getXSize()) || (player.y) > (otherObject.getY() + otherObject.getYSize()) || (player.y + player.ySize) < (otherObject.getY()));
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
    return !((block.x + block.xSize) > (otherObject.getX()) || (block.x) < (otherObject.getX() + otherObject.getXSize()) || (block.y) > (otherObject.getY() + otherObject.getYSize()) || (block.y + block.ySize) < (otherObject.getY()));
  }
  
  int blockNumber;
  int platformHeight;
  
  public void drawPlatform(int blockNumber, int platformHeight) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    image(itemGraphic, x + blockNumber, platformHeight);
  }
}
