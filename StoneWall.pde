class StoneWall extends Tower{
  StoneWall(float x, float y) {
    super(x,y);
    name = "stoneWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHp = 125;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("stoneWallTW");
    debrisType = "stone";
    price = 75;
    value = price;
  }  
}  
