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
  int sprite;
  int delay;
  int delayTime;
  String spriteLocation;
  Particle(float x, float y, float angle) {
    position = new PVector(x, y);
    size = new PVector(5, 5);
    maxSpeed = 1;
    speed = maxSpeed;
    angleTwo = angle;
    angularVelocity = 0; //degrees mode
    lifespan = 1000; //in milliseconds
    lifespan += (round(random(-(lifespan/4),lifespan/4))); //injects 10% randomness so all don't die at once
    numFrames = 1;
    spriteLocation = "sprites/particles/null/null/";
    sprite = 0;
    sprites = new PImage[numFrames];
    velocity = PVector.fromAngle(angle-HALF_PI);
    loadSprites(sprites);
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
  void loadSprites(PImage[] sprites){
    for (int i = 0; i < numFrames; i++) {
      String imageName = spriteLocation + nf(i, 3) + ".png";
      sprites[i] = loadImage(imageName);
    }   
    delay = lifespan/numFrames;
    delayTime = millis() + delay;
  }  
  void display(){ //move and rotate whole grid before displaying, than reset
   if (millis() - delayTime >= delay){
     if (sprite == numFrames-1){
      dead = true;       
     }
     else{
      sprite++;  
      delayTime = millis() + delay;
     }  
   }  
   angleTwo += radians(angularVelocity);
   pushMatrix();
   translate(position.x,position.y);
   rotate(angleTwo);
   image(sprites[sprite],-size.x+2.5,-size.y+2.5);
   popMatrix();
  }  
  void move(){
    velocity.setMag(speed);
    position.add(velocity);
  }  
}
