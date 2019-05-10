class StoneWall extends Tower{
  StoneWall(float x, float y) {
    super(x,y);
    name = "stoneWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 125;
    twHP = maxHP;
    hit = false;
    sprite = spritesH.get("stoneWallTW");
    debrisType = "stone";
    price = 75;
    value = price;
  }  
}  
