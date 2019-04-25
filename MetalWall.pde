class MetalWall extends Tower{
  MetalWall(float x, float y) {
    super(x,y);
    name = "metalWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 250;
    twHP = maxHP;
    hit = false;
    sprite = spritesH.get("metalWallTw");
    debrisType = "metal";
    price = 175;
    value = price;
  }  
}  
