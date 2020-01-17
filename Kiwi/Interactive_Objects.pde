import java.util.ArrayList;
import java.util.List;

abstract class Sprite {
  //Coordinates
  int x;
  int y;
  
  //Length and width of image
  int xSize;
  int ySize;
  
  //Graphics
  String graphicFile
  
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
 
  public abstract boolean isTouching(Player player, Sprite otherObject);
}

class Item extends Sprite {
  String type;
  String message;
  
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
    return !((object.x + object.xSize) > (otherObject.getX()) || (object.x) < (otherObject.getX() + otherObject.getXSize()) || (object.y) > (otherObject.getY() + otherObject.getYSize()) || (object.y + object.ySize) < (otherObject.getY));
  }
  
  public PImage loadGraphic(Item object, String graphicFile) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    return itemGraphic;
  }
  
}

class Player extends Sprite {
  Player(int x, int y, int xSize, int ySize) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  public boolean isTouching(Player player, Sprite otherObject) {
    return !((player.x + player.xSize) > (otherObject.getX()) || (player.x) < (otherObject.getX() + otherObject.getXSize()) || (player.y) > (otherObject.getY() + otherObject.getYSize()) || (player.y + player.ySize) < (otherObject.getY));
  }
  
  public PImage loadGraphic(Item object, String graphicFile) {
    PImage itemGraphic;
    itemGraphic = loadImage(graphicFile);
    return itemGraphic;
  }
}
