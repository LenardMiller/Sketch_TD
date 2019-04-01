class MetalWall extends Tower{
  MetalWall(float x, float y) {
    super(x,y);
    name = "metalWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 250;
    twHP = maxHP;
    hit = false;
    sprite = loadImage("sprites/towers/walls/metalWall.png");
    debrisType = "metal";
    value = 175;
  }  
}  
