class BuffPt extends Particle{
  BuffPt(float x, float y, float angle, String type) {
    super(x, y, angle);
    animated = true;
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 0.25;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 5; //degrees mode
    lifespan = 100; //in milliseconds, default: 100
    lifespan += (round(random((-lifespan)+20,lifespan))); //injects 25% randomness so all don't die at once
    delay = lifespan/numFrames;
    delayTime = millis() + delay;
    numFrames = 8;
    currentSprite = 0;
    sprites = spritesAnimH.get(type + "buffPT");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
  @Override
  void display(){ //move and rotate whole grid before displaying, than reset
   if (millis() - delayTime >= delay){
     if (currentSprite == numFrames-1){
      dead = true;       
     }
     else{
      currentSprite++;  
      delayTime = millis() + delay;
     }  
   }  
   angleTwo += radians(angularVelocity);
   pushMatrix();
   translate(position.x,position.y);
   rotate(angleTwo);
   image(sprites[currentSprite],-size.x+1.5,-size.y+1.5);
   popMatrix();
  }  
}  
