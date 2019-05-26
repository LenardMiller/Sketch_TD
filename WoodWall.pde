class WoodWall extends Tower{
  WoodWall(float x, float y) {
    super(x,y);
    name = "woodWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHp = 50;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("woodWallTW");
    debrisType = "wood";
    price = 25;
    value = price;
  }  
}  
