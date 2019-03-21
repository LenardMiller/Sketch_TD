class Projectile {
  PVector position;
  PVector size;
  float radius;
  PVector target;
  float speed;
  float maxSpeed;
  int damage;
  int pierce;
  int hitTime;
  PImage sprite;
  PVector velocity;
  float angle;
  float angleTwo;
  float angularVelocity;
  boolean dead;
  String trail;
  boolean isTrail;
  String buff;
  
  Projectile(float x, float y, float angle) {
    position = new PVector(x, y);
    size = new PVector(10, 10);
    radius = 10;
    maxSpeed = 2;
    speed = maxSpeed;
    damage = 1;
    pierce = 1;
    hitTime = 0;
    angleTwo = angle;
    angularVelocity = 0; //degrees mode
    sprite = loadImage("sprites/projectiles/null10x10.png");
    velocity = PVector.fromAngle(angle-HALF_PI);
    isTrail = false;
    trail = "null";
    buff = "null";
  }  
  
  void pjMain(ArrayList<Projectile> projectiles, int i){
    display();
    move();
    collideEN();
    if (position.y - size.y > boardHeight || position.x - size.x > boardWidth || position.y + size.y < 0 || position.x + size.x < 0){ //if crossed edge, delete
      dead = true;
    }  
    if (dead){
      projectiles.remove(i);
    }  
    trail();
  }  
  
  void trail(){
    if (isTrail){
      int num = round(random(0,2));
      if (num == 0){
        particles.add(new BuffPt(position.x+2.5, position.y+size.y, random(0,360), trail)); 
      }
    }
  }
  
  void display(){ //move and rotate whole grid before displaying, than reset
   angleTwo += radians(angularVelocity);
   pushMatrix();
   translate(position.x,position.y);
   rotate(angleTwo);
   image(sprite,-size.x/2,-size.y/2);
   popMatrix();
  }  
  
  void move(){
    velocity.setMag(speed);
    position.add(velocity);
  }  
  
  void collideEN(){
    if (millis() > hitTime){
      for (int i = enemies.size()-1; i >= 0; i--){
        Enemy enemy = enemies.get(i);
        if (abs(enemy.position.x-position.x) <= (radius + enemy.radius) && abs(enemy.position.y-position.y) <= (radius + enemy.radius) && pierce > 0){
          enemy.collidePJ(damage,buff);
          hitTime = millis() + 100; 
          pierce--;
        }            
        if (pierce == 0) {
          dead = true;
        }  
      }  
    }  
  } 
}  
