class Crossbow extends Turret{
  Crossbow(float x, float y) {
    super(x,y);
    name = "crossbow";
    position = new PVector(x,y);
    size = new PVector(54,54);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 4000; //default: 4000 milliseconds
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 24;
    error = 2; //set to 360 for a fun time. default: 2 degrees
    numFireFrames = 13;
    numLoadFrames = 81;
    spriteLocation = "sprites/towers/turrets/crossbow/";
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    loadSprites();
    debrisType = "wood";
    price = 100;
    value = price;
    priority = 1; //last
  }  
  @Override
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = millis() + delay; //waits this time before firing
    projectiles.add(new Bolt(position.x-size.x/2,position.y-size.y/2, angle));
  }  
}  
