class MidBug extends Enemy{
  MidBug(float x, float y){
    super(x,y);
    size = new PVector(25,25);
    radius = 13;
    maxSpeed = .5;
    speed = maxSpeed;
    dangerLevel = 1;
    twDamage = 2;
    maxHp = 40; //Hp <---------------------------
    enHp = maxHp;
    hitParticle = "redOuch";
    name = "midBug";
    numAttackFrames = 42;
    numMoveFrames = 32;
    startFrame = 34; //attack start
    attackFrame = startFrame;
    loadSprites();
  }  
}  
