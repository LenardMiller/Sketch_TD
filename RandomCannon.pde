class RandomCannon extends Turret{
  PImage[] fireFramesMisc;
  PImage[] fireFramesWater;
  PImage[] fireFramesAcid;
  PImage[] fireFramesUrchin;
  int projectile;
  int miscChance;
  RandomCannon(float x, float y) {
    super(x,y);
    name = "miscCannon";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 40; //default: 40 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 12;
    numFireFrames = 12;
    numLoadFrames = 1;
    fireFrames = new PImage[numFireFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    projectile = 0;
    damage = 3;
    error = 8; //default 8
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
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = frameCount + delay; //waits this time before firing
    int p = floor(random(0,5.99));
    PVector spp = new PVector(position.x-size.x/2,position.y-size.y/2);
    PVector spa = PVector.fromAngle(angle-HALF_PI);
    spa.setMag(20);
    spp.add(spa);
    projectiles.add(new MiscProjectile(spp.x,spp.y, angle, p, damage));
  }
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    upgradeSpecial[2] = false;
    upgradeSpecial[3] = true;
    //damage
    upgradeDamage[0] = 3;
    upgradeDamage[1] = 0;
    upgradeDamage[2] = 0;
    upgradeDamage[3] = 0;
    //delay (firerate)
    upgradeDelay[0] = 0;
    upgradeDelay[1] = -10;
    upgradeDelay[2] = 0;
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
    upgradeError[1] = 0;
    upgradeError[2] = -2;
    upgradeError[3] = -2;
    //names
    upgradeNames[0] = name;
    upgradeNames[1] = name;
    upgradeNames[2] = name;
    upgradeNames[3] = name;
    //debris
    upgradeDebris[0] = "metal";
    upgradeDebris[1] = "metal";
    upgradeDebris[2] = "metal";
    upgradeDebris[3] = "metal";
    //titles
    upgradeTitles[0] = "Damage Up";
    upgradeTitles[1] = "Faster Firing";
    upgradeTitles[2] = "Reduce Spread";
    upgradeTitles[3] = "Limited Spread";
    //desc line one
    upgradeDescOne[0] = "+3";
    upgradeDescOne[1] = "Increase";
    upgradeDescOne[2] = "Increase";
    upgradeDescOne[3] = "Further";
    //desc line two
    upgradeDescTwo[0] = "damage";
    upgradeDescTwo[1] = "firerate";
    upgradeDescTwo[2] = "accuracy";
    upgradeDescTwo[3] = "increase";
    //desc line three
    upgradeDescThree[0] = "";
    upgradeDescThree[1] = "";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "accuracy";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[8];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[10];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[5];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[6];
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
    upgradeNames[3] = name;
    //
    name = upgradeNames[nextLevel];
    debrisType = upgradeDebris[nextLevel];
    sprite = upgradeSprites[nextLevel];
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
    sBase = spritesH.get("miscCannonBaseTR");
    sIdle = spritesH.get("miscCannonIdleTR");
    fireFrames = spritesAnimH.get("miscCannonFireTR");
    loadFrames = spritesAnimH.get("miscCannonLoadTR");
  }  
}  
class MiscProjectile extends Projectile{
  PImage[] sprites = new PImage[6]; //alternate sprites, passed in
  int spriteType;
  MiscProjectile(float x, float y, float angle, int spriteType, int damage) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 10);
    radius = 5;
    maxSpeed = 12;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 1;
    this.angle = angle;
    angleTwo = angle;
    angularVelocity = 15; //degrees mode
    this.spriteType = spriteType;
    sprites = spritesAnimH.get("miscPJ");
    sprite = sprites[spriteType];
  }
}
