class WoodWall extends Tower{
  WoodWall(float x, float y) {
    super(x,y);
    name = "woodWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 100;
    twHP = maxHP;
    hit = false;
    sprite = loadImage("sprites/towers/walls/woodWall.png");
    spriteHit = loadImage("sprites/towers/walls/woodWallHit.png");
    debrisType = "wood";
  }  
}  
