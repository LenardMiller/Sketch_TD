class RandomCannon extends Turret{
  PImage[] fireFramesMisc;
  PImage[] fireFramesWater;
  PImage[] fireFramesAcid;
  PImage[] fireFramesUrchin;
  int projectile;
  int miscChance;
  RandomCannon(float x, float y) {
    super(x,y);
    name = "randomCannon";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 3000; //default: 3000 milliseconds
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 12;
    error = 0; //irrelivant, set in fire()
    numFireFrames = 12;
    numLoadFrames = 34;
    fireFramesMisc = new PImage[numFireFrames];
    fireFramesWater = new PImage[numFireFrames];
    fireFramesAcid = new PImage[numFireFrames];
    fireFramesUrchin = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    projectile = 0;
    miscChance = 5; //still deciding, default 5?
    loadSprites();
    debrisType = "metal";
    price = 100;
    value = price;
    priority = 2; //strong
  }  
  @Override
  void fire(){
    int miscError = 5; //default 5
    int specialError = 2; //default 2
    projectile = round(random(0,miscChance+3.49));
    angle += radians(random(-error,error));
    delayTime = millis() + delay; //waits this time before firing
    PVector spp = new PVector(position.x-size.x/2,position.y-size.y/2);
    PVector spa = PVector.fromAngle(angle-HALF_PI);
    spa.setMag(20);
    spp.add(spa);
    if (projectile <= miscChance){ //chooses projectile to fire randomly
      error = miscError;
      projectiles.add(new MiscProjectile(spp.x,spp.y, angle, round(random(0,5))));
    }
    else if (projectile == miscChance+1){
      error = specialError;
      projectiles.add(new Waterball(spp.x,spp.y, angle));
    }
    else if (projectile == miscChance+2){
      error = specialError;
      projectiles.add(new Acid(spp.x,spp.y, angle));
    }
    else if (projectile == miscChance+3){
      error = specialError;
      projectiles.add(new Urchin(spp.x,spp.y, angle));
    }
    else{ //just in case
      error = miscError;
      projectiles.add(new MiscProjectile(spp.x,spp.y,angle,floor(random(0,6.9)))); //idk if it will ever choose the max, but I don't want to risk that
    }
  }  
  void loadSprites(){
    sBase = spritesH.get("randomCannonBaseTR");
    sIdle = spritesH.get("randomCannonIdleTR");
    fireFramesMisc = spritesAnimH.get("randomCannonFireMiscTR");
    fireFramesWater = spritesAnimH.get("randomCannonFireWaterTR");
    fireFramesAcid = spritesAnimH.get("randomCannonFireAcidTR");
    fireFramesUrchin = spritesAnimH.get("randomCannonFireUrchinTR");
    loadFrames = spritesAnimH.get("randomCannonLoadTR"); 
  } 
 void display(){
    if (spriteType == 0){ //idle
      sprite = sIdle;
    }  
    else if (spriteType == 1){ //fire
      if (frame < numFireFrames-1){ //if not done, keep going
        frame++;
        if (projectile <= miscChance){ //all different firing animations
          sprite = fireFramesMisc[frame];
        }
        else if (projectile == miscChance+1){
          sprite = fireFramesWater[frame];
        }
        else if (projectile == miscChance+2){
          sprite = fireFramesAcid[frame];
        }
        else if (projectile == miscChance+3){
          sprite = fireFramesUrchin[frame];
        }
      }  
      else { //if done, switch to load
        frame = 0;
        spriteType = 2;
        loadDelay = (int) (((delayTime - millis())/numLoadFrames)/3);
        loadDelayTime = millis() + loadDelay;
      }  
    }
    else if (spriteType == 2){ //load
      if (millis() - loadDelayTime >= loadDelay){ //SUPPOSSED to animate dialated to the remaining delay time, but it doesn't really. TODO: fix
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
      tint(255,45,45);
      hit = false;
    }  
   image(sBase,position.x-size.x,position.y-size.y);
   if (twHp > 0){
      HpBar();
    }
   pushMatrix();
   translate(position.x-size.x/2,position.y-size.y/2);
   rotate(angle);
   image(sprite,-size.x/2,-size.y/2);
   popMatrix();
   tint(255,255,255);
  } 
}  
