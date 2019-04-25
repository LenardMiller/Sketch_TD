class CrystalWall extends Tower{
  CrystalWall(float x, float y) {
    super(x,y);
    name = "crystalWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 500;
    twHP = maxHP;
    hit = false;
    sprite = spritesH.get("crystalWallTw");
    debrisType = "crystal";
    price = 400;
    value = price;
  }  
}  
