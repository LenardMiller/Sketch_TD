class Particle{
  PVector position;
  PVector size;
  PVector target;
  float speed;
  float maxSpeed;
  PImage[] sprites;
  PVector velocity;
  float angle;
  float angleTwo;
  float angularVelocity;
  boolean dead;
  int lifespan;
  int numFrames;
  int currentSprite;
  PImage sprite;
  boolean animated;
  int delay;
  int delayTime;
  Particle(float x, float y, float angle) {
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 1;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 0; //degrees mode
    lifespan = 60; //in frames
    lifespan += (round(random(-(lifespan/4),lifespan/4))); //injects 10% randomness so all don't die at once
    numFrames = 1;
    currentSprite = 0;
    animated = false;
    delay = lifespan/numFrames;
    delayTime = frameCount + delay;
    sprite = spritesH.get("nullPt");
    velocity = PVector.fromAngle(angle-HALF_PI);
  }  
  void ptMain(ArrayList<Particle> particles, int i){
    if (position.y - size.y > boardHeight || position.x - size.x > boardWidth || position.y + size.y < 0 || position.x + size.x < 0){ //if crossed edge, delete
      dead = true;
    }  
    if (dead){
      particles.remove(i);
    }  
    display();
    move();
  }  
  void display(){ //move and rotate whole grid before displaying, than reset
   if (animated){
     if (frameCount - delayTime >= delay){
       if (currentSprite == numFrames-1){
        dead = true;       
       }
       else{
        currentSprite++;  
        delayTime = frameCount + delay;
       }  
     }  
     angleTwo += radians(angularVelocity);
     pushMatrix();
     translate(position.x,position.y);
     rotate(angleTwo);
     image(sprites[currentSprite],-size.x/2,-size.y/2);
     popMatrix();
   } 
   else{
     if (frameCount - delayTime >= delay){
       dead = true;
     }  
     angleTwo += radians(angularVelocity);
     pushMatrix();
     translate(position.x,position.y);
     rotate(angleTwo);
     image(sprite,-size.x/2,-size.y/2);
     popMatrix();  
   }  
  }  
  void move(){
    velocity.setMag(speed);
    position.add(velocity);
  }  
}
