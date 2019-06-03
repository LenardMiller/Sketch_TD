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
    delay = 150; //default: 150 frames
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
    damage = 6;
    error = 5;
    loadSprites();
    debrisType = "metal";
    price = 100;
    value = price;
    priority = 2; //strong
    nextLevelZero = 0;
    nextLevelOne = 2;
    setUpgrades();
  }
  @Override
  void fire(){
    float miscError = error; //default 5
    float specialError = error/2; //default 2.5
    projectile = floor(random(0,miscChance+4));
    delayTime = frameCount + delay; //waits this time before firing
    PVector spp = new PVector(position.x-size.x/2,position.y-size.y/2);
    PVector spa = PVector.fromAngle(angle-HALF_PI);
    spa.setMag(20);
    spp.add(spa);
    if (projectile <= miscChance){ //chooses projectile to fire randomly
      angle += radians(random(-miscError,miscError));
      projectiles.add(new MiscProjectile(spp.x,spp.y, angle, round(random(0,5)), damage));
    }
    else if (projectile == miscChance+1){
      angle += radians(random(-specialError,specialError));
      projectiles.add(new Waterball(spp.x,spp.y, angle));
    }
    else if (projectile == miscChance+2){
      angle += radians(random(-specialError,specialError));
      projectiles.add(new Acid(spp.x,spp.y, angle));
    }
    else if (projectile == miscChance+3){
      angle += radians(random(-specialError,specialError));
      projectiles.add(new Urchin(spp.x,spp.y, angle));
    }
    else{ //just in case
      angle += radians(random(-miscError,miscError));
      projectiles.add(new MiscProjectile(spp.x,spp.y,angle,floor(random(0,6.9)),damage)); //idk if it will ever choose the max, but I don't want to risk that
    }
  }
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    upgradeSpecial[2] = false;
    upgradeSpecial[3] = true;
    //damage
    upgradeDamage[0] = 10;
    upgradeDamage[1] = 0;
    upgradeDamage[2] = 0;
    upgradeDamage[3] = 0;
    //delay (firerate)
    upgradeDelay[0] = 0;
    upgradeDelay[1] = 0;
    upgradeDelay[2] = -20;
    upgradeDelay[3] = 0;
    //price
    upgradePrices[0] = 50;
    upgradePrices[1] = 100;
    upgradePrices[2] = 50;
    upgradePrices[3] = 100;
    //heath
    upgradeHealth[0] = 0;
    upgradeHealth[1] = 0;
    upgradeHealth[2] = 0;
    upgradeHealth[3] = 0;
    //error (accuracy)
    upgradeError[0] = 0;
    upgradeError[1] = -2;
    upgradeError[2] = 0;
    upgradeError[3] = 0;
    //names
    upgradeNames[0] = name;
    upgradeNames[1] = name;
    upgradeNames[2] = name;
    upgradeNames[3] = "consistantCannon";
    //debris
    upgradeDebris[0] = "metal";
    upgradeDebris[1] = "metal";
    upgradeDebris[2] = "metal";
    upgradeDebris[3] = "metal";
    //titles
    upgradeTitles[0] = "Damage Up";
    upgradeTitles[1] = "More Precise";
    upgradeTitles[2] = "Faster Firing";
    upgradeTitles[3] = "More Consistant";
    //desc line one
    upgradeDescOne[0] = "+10";
    upgradeDescOne[1] = "Increase";
    upgradeDescOne[2] = "Increase";
    upgradeDescOne[3] = "More";
    //desc line two
    upgradeDescTwo[0] = "normal";
    upgradeDescTwo[1] = "accuracy";
    upgradeDescTwo[2] = "firerate";
    upgradeDescTwo[3] = "debuff";
    //desc line three
    upgradeDescThree[0] = "damage";
    upgradeDescThree[1] = "";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "projectiles";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[8];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[5];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[11];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
    upgradeSprites[2] = spritesH.get("stoneWallTW");
    upgradeSprites[3] = spritesH.get("metalWallTW");
  }
  void upgrade(int id){
    int nextLevel;
    if (id == 0){
      nextLevel = nextLevelZero;
    }
    else{
      nextLevel = nextLevelOne;
    }
    damage += upgradeDamage[nextLevel];
    delay += upgradeDelay[nextLevel];
    price += upgradePrices[nextLevel];
    value += upgradePrices[nextLevel];
    maxHp += upgradeHealth[nextLevel];
    twHp += upgradeHealth[nextLevel];
    error += upgradeError[nextLevel];
    //reset names
    upgradeNames[0] = name;
    upgradeNames[1] = name;
    upgradeNames[2] = name;
    //
    name = upgradeNames[nextLevel];
    debrisType = upgradeDebris[nextLevel];
    sprite = upgradeSprites[nextLevel];
    if (upgradeSpecial[nextLevel]){
      miscChance -= 4;
    }
    if (nextLevel < upgradeNames.length && id == 0){
      nextLevelZero++;
    }
    else if (nextLevel < upgradeNames.length && id == 1){
      nextLevelOne++;
    }
    if (id == 0){
      if (nextLevelZero < upgradeNames.length/2){
        upgradeIconZero.sprite = upgradeIcons[nextLevelZero];
      }
      else{
        upgradeIconZero.sprite = spritesAnimH.get("upgradeIC")[0];
      }
    }
    if (id == 1){
      if (nextLevelOne < upgradeNames.length){
        upgradeIconOne.sprite = upgradeIcons[nextLevelOne];
      }
      else{
        upgradeIconOne.sprite = spritesAnimH.get("upgradeIC")[0];
      }
    }
    int num = floor(random(30,50)); //shower debris
    for (int j = num; j >= 0; j--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
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
        ArrayList<Integer> oldArray = new ArrayList();
        int oldSize = numLoadFrames;
        int newSize = (delayTime - frameCount);
        spriteArray = new ArrayList<Integer>();
        for (int i = 0; i < oldSize; i++){
          oldArray.add(i);
        }  
        for (int i = 0; i < oldSize; i++){
          spriteArray.add(i);
        }  
        int count = 0;
        while (spriteArray.size() != newSize){
          count++;
          compress = new CompressArray(spriteArray.size(),newSize,count,oldArray,spriteArray);
          compress.cMain();
        }  
        frame = 0;
        spriteType = 2;
        //println();
        //println(spriteArray.size()+"<-"+oldSize);
      }
    }
    else if (spriteType == 2){ //load
      frame++;
      if (frame < spriteArray.size()){
        sprite = loadFrames[spriteArray.get(frame)];
        //print(spriteArray.get(frame)+", ");
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
