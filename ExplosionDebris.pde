class ExplosionDebris extends Particle{
  ExplosionDebris(float x, float y, float angle, String type, float maxSpeed) {
    super(x, y, angle);
    animated = true;
    position = new PVector(x, y);
    size = new PVector(9, 9);
    this.maxSpeed = maxSpeed;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 5; //degrees mode
    lifespan = 0; //in frames, default: 0
    lifespan += (round(random((-lifespan)+2,lifespan))); //injects 25% randomness so all don't die at once
    delay = lifespan/numFrames;
    delayTime = frameCount + delay;
    numFrames = 4;
    currentSprite = 0;
    sprites = spritesAnimH.get(type + "ExDebrisPT");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
}  
