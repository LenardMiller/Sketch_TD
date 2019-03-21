class BuffPt extends Particle{
  BuffPt(float x, float y, float angle, String type) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 0.25;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 5; //degrees mode
    lifespan = 100; //in milliseconds
    lifespan += (round(random((-lifespan)+20,lifespan))); //injects 25% randomness so all don't die at once
    numFrames = 8;
    spriteLocation = "sprites/particles/buff/" + type + "/";
    sprite = 0;
    sprites = new PImage[numFrames];
    velocity = PVector.fromAngle(angle-HALF_PI);
    loadSprites(sprites);
  }  
}  
