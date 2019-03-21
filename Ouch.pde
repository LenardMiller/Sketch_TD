class Ouch extends Particle{
  Ouch(float x, float y, float angle, String type) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 0.25;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 0; //degrees mode
    lifespan = 25; //in milliseconds
    lifespan += (round(random(-(lifespan/4),lifespan/4))); //injects 25% randomness so all don't die at once
    numFrames = 11;
    spriteLocation = "sprites/particles/enemy/" + type + "/";
    sprite = 0;
    sprites = new PImage[numFrames];
    velocity = PVector.fromAngle(angle-HALF_PI);
    loadSprites(sprites);
  }  
}  
