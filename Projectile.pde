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
    sprite = spritesH.get("nullPj");
    velocity = PVector.fromAngle(angle-HALF_PI);
    isTrail = false;
    trail = "null";
    buff = "null";
  }  
  
  void pjMain(ArrayList<Projectile> projectiles, int i){
    trail();
    display();
    move();
    collideEn();
    if (position.y - size.y > boardHeight || position.x - size.x > boardWidth || position.y + size.y < 0 || position.x + size.x < 0){ //if crossed edge, delete
      dead = true;
    }  
    if (dead){
      projectiles.remove(i);
    }  
  }  
  
  void trail(){ //leaves a trail of particles
    if (isTrail){
      int num = floor(random(0,3));
      if (num == 0){
        particles.add(new BuffPt(position.x, position.y, random(0,360), trail)); 
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
  
  void collideEn(){
    if (millis() > hitTime){
      for (int i = enemies.size()-1; i >= 0; i--){
        Enemy enemy = enemies.get(i);
        if (abs(enemy.position.x-position.x) <= (radius + enemy.radius) && abs(enemy.position.y-position.y) <= (radius + enemy.radius) && pierce > 0){ //if touching enemy, and has pierce
          enemy.collidePJ(damage,buff,i);
          hitTime = millis() + 100; //little timer so no constant damage, kind of unneccissary
          pierce--;
        }            
        if (pierce == 0) {
          dead = true;
        }  
      }  
    }  
  } 
}  
