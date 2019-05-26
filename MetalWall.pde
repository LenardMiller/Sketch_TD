class MetalWall extends Tower{
  MetalWall(float x, float y) {
    super(x,y);
    name = "metalWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHp = 250;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("metalWallTW");
    debrisType = "metal";
    price = 175;
    value = price;
  }  
}  
