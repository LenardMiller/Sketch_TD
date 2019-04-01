class CrystalWall extends Tower{
  CrystalWall(float x, float y) {
    super(x,y);
    name = "crystalWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 500;
    twHP = maxHP;
    hit = false;
    sprite = loadImage("sprites/towers/walls/crystalWall.png");
    debrisType = "crystal";
    value = 400;
  }  
}  
