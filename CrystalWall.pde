class CrystalWall extends Tower{
  CrystalWall(float x, float y) {
    super(x,y);
    name = "crystalWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHp = 500;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("crystalWallTW");
    debrisType = "crystal";
    price = 400;
    value = price;
  }  
}  
