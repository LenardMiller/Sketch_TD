class Debris extends Particle{
  Debris(float x, float y, float angle, String type) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 2; //default: 2
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 8; //degrees mode
    lifespan = 100; //in milliseconds, default: 100
    lifespan += (round(random((-lifespan)+20,lifespan))); //injects 100% randomness so all don't die at once
    numFrames = 1;
    spriteLocation = "sprites/particles/debris/" + type + "/";
    sprite = 0;
    sprites = new PImage[numFrames];
    velocity = PVector.fromAngle(angle-HALF_PI);
    loadSprites(sprites);
  }  
}  
