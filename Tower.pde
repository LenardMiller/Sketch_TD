class Turret extends Tower{
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
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 240;
    delayTime = delay;
    pjSpeed = 2;
    error = 0;
    numFireFrames = 1;
    numLoadFrames = 1;
    debrisType = "null";
    //the following is usually unchanged.
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    turret = true;
    loadSprites();
    upgradeSpecial = new boolean[2];
    upgradeDamage = new int[2];
    upgradeDelay = new int[2];
    upgradePrices = new int[2];
    upgradeHealth = new int[2];
    upgradeError = new float[2];
    upgradeNames = new String[2];
    upgradeDebris = new String[2];
    upgradeTitles = new String[2];
    upgradeIcons = new PImage[2];
    upgradeSprites = new PImage[2];
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
    if (frame == 0 && spriteType == 0){ //if done animating
      spriteType = 1;
      frame = 0;
      fire();
    }
  }  
  void aim(PVector target, PVector position, int id){
    Enemy enemy = enemies.get(id);
    PVector e = PVector.div(enemy.size,2);
    target = PVector.add(target,e);
    PVector d = PVector.sub(target,position); //finds distance to enemy
    PVector t = PVector.div(d,pjSpeed); //finds time to hit
    PVector newTarget = new PVector(target.x,target.y+(t.mag()*enemy.speed)); //target + how far the enemy will go in t
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
    if (visualize){ //cool lines
      stroke(255);
      line(position.x-size.x/2,position.y-size.y/2,target.x-enemy.size.x/2,target.y-enemy.size.y/2);
      stroke(255,0,0,150);
      line(target.x-enemy.size.x/2,height,target.x-enemy.size.x/2,0);
      stroke(0,0,255,150);
      line(width,target.y-enemy.size.y/2,0,target.y-enemy.size.y/2);
    }
  }  
  void fire(){  
    delayTime = frameCount + delay; //waits this time before firing
    angle += radians(random(-error,error));
    projectiles.add(new Projectile(position.x-size.x/2,position.y-size.y/2, angle));
  }  
  void loadSprites(){
    sBase = spritesH.get(name+"BaseTR");
    sIdle = spritesH.get(name+"IdleTR");
    fireFrames = spritesAnimH.get(name+"FireTR");
    loadFrames = spritesAnimH.get(name+"LoadTR"); 
  }  
  @Override
  void twMain(ArrayList<Tower> towers, int i){ //need to check target
    if (twHp <= 0){
       die(i);
       towers.remove(i);
    }  
    if (enemies.size() > 0 && alive){
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
        loadDelay = (int) (((delayTime - frameCount)/numLoadFrames));
        println(loadDelay);
        loadDelayTime = frameCount + loadDelay;
      }  
    }
    else if (spriteType == 2){ //load
      if (frameCount - loadDelayTime >= loadDelay){ //animates dialated to the remaining delay time
        frame++;
        loadDelayTime = frameCount + loadDelay;
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
   if (twHp > 0){
      HpBar();
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
