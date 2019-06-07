class BuffPt extends Particle{
  BuffPt(float x, float y, float angle, String type) {
    super(x, y, angle);
    animated = true;
    position = new PVector(x, y);
    size = new PVector(7, 7);
    maxSpeed = 0.25;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 5; //degrees mode
    lifespan = 2; //in frames, default: 2
    lifespan += (round(random((-lifespan)+2,lifespan))); //injects 25% randomness so all don't die at once
    delay = lifespan/numFrames;
    delayTime = frameCount + delay;
    numFrames = 8;
    currentSprite = 0;
    sprites = spritesAnimH.get(type + "BuffPT");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
}  
