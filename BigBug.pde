class BigBug extends Enemy{
  BigBug(float x, float y){
    super(x,y);
    size = new PVector(53,53);
    radius = 26;
    maxSpeed = .3;
    speed = maxSpeed;
    dangerLevel = 1;
    twDamage = 15;
    maxHp = 160; //Hp <---------------------------
    enHp = maxHp;
    hitParticle = "redOuch";
    name = "bigBug";
    numAttackFrames = 100;
    numMoveFrames = 32;
    startFrame = 48; //attack start
    attackFrame = startFrame;
    loadSprites();
  }  
}  
