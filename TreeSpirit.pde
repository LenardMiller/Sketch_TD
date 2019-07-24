class TreeSpirit extends Enemy{
  TreeSpirit(float x, float y){
    super(x,y);
    size = new PVector(42,42);
    radius = 21;
    maxSpeed = .5;
    speed = maxSpeed;
    dangerLevel = 1;
    twDamage = 5;
    maxHp = 40; //Hp <---------------------------
    enHp = maxHp;
    hitParticle = "redOuch";
    name = "treeSpirit";
    numAttackFrames = 42;
    numMoveFrames = 47;
    startFrame = 22;
    loadSprites();
  }  
}  
