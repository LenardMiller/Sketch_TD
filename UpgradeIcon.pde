class UpgradeIcon extends Icon{
  PVector position;
  PVector size;
  String spriteLocation;
  PImage sprite;
  boolean active;
  UpgradeIcon(float x, float y, String type, boolean active){
    super(x,y,type,active);
    this.active = active;
    position = new PVector(x, y);
    size = new PVector(25, 25);
    sprite = spritesAnimH.get("upgradeIC")[0];
  }
}
