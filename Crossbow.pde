class Crossbow extends Turret{
  Crossbow(float x, float y) {
    super(x,y);
    target = new PVector(x, -height);
    position = new PVector(x,y);
    size = new PVector(54,54);
    maxHP = 20;
    twHP = maxHP;
    hit = false;
    delay = 0; //default: 1500 milliseconds
    delay += ((int) random(-(delay/10),delay/10)); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 24;
    error = 2; //set to 360 for a fun time. default: 2 degrees
    numFireFrames = 13;
    numLoadFrames = 81;
    spriteLocation = "sprites/towers/turrets/crossbow/";
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    loadSprites();
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
  }  
  @Override
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = millis() + delay; //waits this time before firing
    projectiles.add(new Bolt(position.x-size.x/2,position.y-size.y/2, angle));
    target = new PVector(position.x, -height);
  }  
  
}  
