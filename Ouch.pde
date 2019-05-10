class Ouch extends Particle{
  Ouch(float x, float y, float angle, String type) {
    super(x, y, angle);
    animated = true;
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 0.25;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 0; //degrees mode
    lifespan = 10; //in milliseconds
    lifespan += (round(random(-(lifespan/4),lifespan/4))); //injects 25% randomness so all don't die at once
    delay = lifespan/numFrames;
    delayTime = millis() + delay;
    numFrames = 11;
    currentSprite = 0;
    sprites = spritesAnimH.get(type + "EnemyPT");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
}  
