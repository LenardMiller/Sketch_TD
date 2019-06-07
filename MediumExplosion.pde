class MediumExplosion extends Particle{
  MediumExplosion(float x, float y, float angle) {
    super(x, y, angle);
    animated = true;
    position = new PVector(x, y);
    size = new PVector(30,30);
    maxSpeed = 0;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 0; //degrees mode
    lifespan = 0; //in frames, default: 0
    delay = lifespan/numFrames;
    delayTime = frameCount + delay;
    numFrames = 18;
    currentSprite = 0;
    sprites = spritesAnimH.get("mediumExplosionPT");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
}  
