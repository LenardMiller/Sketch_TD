class TreeSprite extends Enemy{
  TreeSprite(float x, float y){
    super(x,y);
    size = new PVector(25,25);
    radius = 15;
    maxSpeed = .4;
    speed = maxSpeed;
    dangerLevel = 1;
    twDamage = 2;
    maxHp = 80; //Hp <---------------------------
    enHp = maxHp;
    hitParticle = "redOuch";
    name = "treeSprite";
    numAttackFrames = 50;
    numMoveFrames = 58;
    startFrame = 28;
    attackFrame = startFrame;
    loadSprites();
  }  
}  
