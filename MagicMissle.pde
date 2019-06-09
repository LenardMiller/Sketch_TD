class MagicMissle extends Projectile{
  int priority;
  MagicMissle(float x, float y, float angle, int damage, int priority) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(6, 20);
    radius = 14;
    maxSpeed = 5;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 1;
    this.angle = angle;
    sprite = spritesH.get("magicMisslePj");
    isTrail = true;
    trail = "greenMagic";
    this.priority = priority;
  }
  void checkTarget(){
    if (priority == 0){ //first
      aim(enTrak.firstPos,position,enTrak.firstId);
    }
    else if (priority == 1){ //last
      aim(enTrak.lastPos,position,enTrak.lastId);
    }
    else if (priority == 2){ //strong
      aim(enTrak.strongPos,position,enTrak.strongId);
    }
    else{ //first, placeholder for close
      aim(enTrak.firstPos,position,enTrak.firstId);
    }
  }
  void aim(PVector target, PVector position, int id){
    if (enemies.size()-1 < id){
      id = 0;  
    }  
    Enemy enemy = enemies.get(id);
    PVector ratio = PVector.sub(target,position);
    if (position.x == target.x){ //if on the same x
       if (position.y >= target.y){ //if below target or on same y, angle right
         angle = 0;
       }
       else if (position.y < target.y){ //if above target, angle left
         angle = PI;
       }
    }
    else if (position.y == target.y){ //if on same y
       if (position.x > target.x){ //if  right of target, angle down
         angle = 3*HALF_PI;
       }
       else if (position.x < target.x){ //if left of target, angle up
         angle = HALF_PI;
       }
    }
    else{
      if (position.x < target.x && position.y > target.y){ //if to left and below NOT WORKING
        angle = (atan(abs(ratio.x+15)/abs(ratio.y)));
      }
      else if (position.x < target.x && position.y < target.y){ //if to left and above
        angle = (atan(abs(ratio.y)/abs(ratio.x))) + HALF_PI;
      }
      else if (position.x > target.x && position.y < target.y){ //if to right and above NOT WORKING
        angle = (atan(abs(ratio.x+15)/abs(ratio.y))) + PI;
      }
      else if (position.x > target.x && position.y > target.y){ //if to right and below
        angle = (atan(abs(ratio.y)/abs(ratio.x))) + 3*HALF_PI;
      }
    }
   angleTwo = angle;
   velocity = PVector.fromAngle(angle-HALF_PI); 
  }
  @Override
  void move(){
    if (enemies.size() > 0){
      checkTarget();
    }
    velocity.setMag(speed);
    position.add(velocity);
  } 
}  
