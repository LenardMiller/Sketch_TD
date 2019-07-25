class SmolBug extends Enemy{
  SmolBug(float x, float y){
    super(x,y);
    size = new PVector(12,12);
    radius = 6;
    maxSpeed = .4;
    speed = maxSpeed;
    dangerLevel = 1;
    twDamage = 1;
    maxHp = 10; //Hp <---------------------------
    enHp = maxHp;
    hitParticle = "redOuch";
    name = "smolBug";
    numAttackFrames = 34;
    numMoveFrames = 24;
    startFrame = 15; //attack start
    attackFrame = startFrame;
    loadSprites();
  }  
}  
