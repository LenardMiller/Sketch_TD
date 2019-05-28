class Debris extends Particle{
  Debris(float x, float y, float angle, String type) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 2; //default: 2
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 8; //degrees mode
    lifespan = 6; //in frames, default: 6
    lifespan += (round(random((-lifespan+2),lifespan))); //injects 100% randomness so all don't die at once
    numFrames = 1;
    animated = false;
    delay = lifespan/numFrames;
    delayTime = frameCount + delay;
    sprite = spritesH.get(type + "Pt");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
}  
