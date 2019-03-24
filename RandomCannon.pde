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
    target = new PVector(x, -boardHeight);
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHP = 20;
    twHP = maxHP;
    hit = false;
    delay = 3000; //default: 3000 milliseconds
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 12;
    error = 0; //irrelivant, set in fire()
    numFireFrames = 11;
    numLoadFrames = 33;
    spriteLocation = "sprites/towers/turrets/miscCannon/";
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
    miscChance = 5; //still decideing, default 5?
    loadSprites(fireFramesMisc,fireFramesWater,fireFramesAcid,fireFramesUrchin);
    debrisType = "metal";
    value = 80;
  }  
  @Override
  void fire(){ //needed to change projectile fired
    int miscError = 5; //default 5
    int specialError = 2; //default 2
    projectile = round(random(0,miscChance+3.49));
    angle += radians(random(-error,error));
    delayTime = millis() + delay; //waits this time before firing
    if (projectile <= miscChance){
      error = miscError;
      projectiles.add(new MiscProjectile(position.x-size.x/2,position.y-size.y/2, angle, round(random(0,5))));
    }
    else if (projectile == miscChance+1){
      error = specialError;
      projectiles.add(new Waterball(position.x-size.x/2,position.y-size.y/2, angle));
    }
    else if (projectile == miscChance+2){
      error = specialError;
      projectiles.add(new Acid(position.x-size.x/2,position.y-size.y/2, angle));
    }
    else if (projectile == miscChance+3){
      error = specialError;
      projectiles.add(new Urchin(position.x-size.x/2,position.y-size.y/2, angle));
    }
    target = new PVector(position.x, -boardHeight);
  }  
  void loadSprites(PImage[] fireFramesMisc, PImage[] fireFramesWater, PImage[] fireFramesAcid, PImage[] fireFramesUrchin){
    sBase = loadImage(spriteLocation + "base.png");
    sIdle = loadImage(spriteLocation + "idle.png");
    for (int i = 0; i < numFireFrames; i++) {
      String imageName = spriteLocation + "fire/misc/fire" + nf(i, 3) + ".png";
      fireFramesMisc[i] = loadImage(imageName);
    }  
    for (int i = 0; i < numFireFrames; i++) {
      String imageName = spriteLocation + "fire/water/fire" + nf(i, 3) + ".png";
      fireFramesWater[i] = loadImage(imageName);
    }  
    for (int i = 0; i < numFireFrames; i++) {
      String imageName = spriteLocation + "fire/acid/fire" + nf(i, 3) + ".png";
      fireFramesAcid[i] = loadImage(imageName);
    }  
    for (int i = 0; i < numFireFrames; i++) {
      String imageName = spriteLocation + "fire/urchin/fire" + nf(i, 3) + ".png";
      fireFramesUrchin[i] = loadImage(imageName);
    }  
    for (int i = 0; i < numLoadFrames; i++) {
      String imageName = spriteLocation + "load/load" + nf(i, 3) + ".png";
      loadFrames[i] = loadImage(imageName);
    }  
  } 
 void display(){
    if (spriteType == 0){ //idle
      sprite = sIdle;
    }  
    else if (spriteType == 1){ //fire
      if (frame < numFireFrames-1){ //if not done, keep going
        frame++;
        if (projectile <= miscChance){
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
   if (twHP > 0){
      HPBar();
    }
   pushMatrix();
   translate(position.x-size.x/2,position.y-size.y/2);
   rotate(angle);
   image(sprite,-size.x/2,-size.y/2);
   popMatrix();
   tint(255,255,255);
  } 
}  
