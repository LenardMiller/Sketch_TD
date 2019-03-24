class Turret extends Tower{
  PVector target;
  PImage sBase;
  PImage sIdle;
  PVector ratio;
  int targetEn;
  int delayTime;
  int pjSpeed;
  int numFireFrames;
  int numLoadFrames;
  PImage[] fireFrames;
  PImage[] loadFrames;
  String spriteLocation;
  int spriteType;
  int frame;
  int loadDelay;
  int loadDelayTime;
  Turret(float x, float y) {
    super(x,y);
    name = "null";
    target = new PVector(x, -boardHeight);
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHP = 20;
    twHP = maxHP;
    hit = false;
    delay = 4000;
    delayTime = delay;
    pjSpeed = 2;
    error = 0;
    numFireFrames = 1;
    numLoadFrames = 1;
    spriteLocation = "sprites/towers/turrets/null/";
    debrisType = "null";
    //the following is usually unchanged.
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    loadSprites();
  }
  void checkTarget(){
    for (int i = enemies.size()-1; i >= 0; i--){ //chooses an enemy to attack
      Enemy enemy = enemies.get(i);
      if (enemy.position.y > target.y){ //if the enemy is closer to the exit than the current target
        target = new PVector(enemy.position.x+((enemy.size.x/2)),enemy.position.y+((enemy.size.y/2)));
        PVector d = PVector.sub(target,position); //finds distance to enemy
        PVector t = d.div(pjSpeed); //finds time to hit
        PVector newTarget = new PVector(target.x,target.y + ((t.mag())*enemy.speed)); //I am too lazy to explain this
        target = newTarget; //leads shots
        ratio = PVector.sub(target,position);
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
          if (position.x < target.x && position.y > target.y){ //if to left and below
             angle = (atan(abs(ratio.x)/abs(ratio.y)));
          }  
          else if (position.x < target.x && position.y < target.y){ //if to left and above
             angle = (atan(abs(ratio.y)/abs(ratio.x))) + HALF_PI;
          } 
          else if (position.x > target.x && position.y < target.y){ //if to right and above
             angle = (atan(abs(ratio.x)/abs(ratio.y))) + PI;
          }  
          else if (position.x > target.x && position.y > target.y){ //if to right and below
             angle = (atan(abs(ratio.y)/abs(ratio.x))) + 3*HALF_PI;
          } 
        }
      }
      if (frame == 0 && spriteType == 0){
        spriteType = 1;
        frame = 0;
        fire();
      }
    }
  }  
  void fire(){  
    delayTime = millis() + delay; //waits this time before firing
    angle += radians(random(-error,error));
    projectiles.add(new Projectile(position.x-size.x/2,position.y-size.y/2, angle));
    target = new PVector(position.x, -boardHeight);
  }  
  void loadSprites(){
    sBase = loadImage(spriteLocation + "base.png");
    sIdle = loadImage(spriteLocation + "idle.png");
    for (int i = 0; i < numFireFrames; i++) {
      fireFrames[i] = loadImage(spriteLocation + "fire/fire" + nf(i, 3) + ".png");
    }  
    for (int i = 0; i < numLoadFrames; i++) {
      loadFrames[i] = loadImage(spriteLocation + "load/load" + nf(i, 3) + ".png");
    }  
  }  
  @Override
  void twMain(ArrayList<Tower> towers, int i){ //need to check target
    if (twHP <= 0){
       die();
       towers.remove(i);
    }  
    if (alive){
      checkTarget();
    }
    if (mousePressed && mouseX < position.x && mouseX > position.x-size.x && mouseY < position.y && mouseY > position.y-size.y && alive){
      selection.swapSel(i);
    }
    display();
  }  
  void display(){
    if (tintColor < 255){
      tintColor += 20;  
    }  
    if (spriteType == 0){ //idle
      sprite = sIdle;
    }  
    else if (spriteType == 1){ //fire
      if (frame < numFireFrames-1){ //if not done, keep going
        frame++;
        sprite = fireFrames[frame];
      }  
      else { //if done, switch to load
        frame = 0;
        spriteType = 2;
        loadDelay = (int) (((delayTime - millis())/numLoadFrames)/3);
        loadDelayTime = millis() + loadDelay;
      }  
    }
    else if (spriteType == 2){ //load
      if (millis() - loadDelayTime >= loadDelay){ //animates dialated to the remaining delay time
        frame++;
        loadDelayTime = millis() + loadDelay;
      }  
      if (frame < numLoadFrames){
        sprite = loadFrames[frame];
      }
      else{ //if time runs out, switch to idle
        frame = 0;
        sprite = sIdle;
        spriteType = 0;
      }  
   }  
   if (hit){ //change to red if under attack
      tintColor = 0;
      hit = false;
   }  
   if (twHP > 0){
      HPBar();
   }
   tint(255,tintColor,tintColor);
   image(sBase,position.x-size.x,position.y-size.y);
   pushMatrix();
   translate(position.x-size.x/2,position.y-size.y/2);
   rotate(angle);
   image(sprite,-size.x/2,-size.y/2);
   popMatrix();
   tint(255,255,255);
  }
}  
