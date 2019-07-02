class Crossbow extends Turret{
  int pierce;
  Crossbow(float x, float y) {
    super(x,y);
    name = "crossbow";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 210; //default: 210 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 24;
    error = 2; //set to 360 for a fun time. default: 2 degrees
    numFireFrames = 13;
    numLoadFrames = 81;
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    damage = 20;
    pierce = 2;
    loadSprites();
    debrisType = "wood";
    price = 100;
    value = price;
    priority = 1; //last
    nextLevelZero = 0;
    nextLevelOne = 2;
    setUpgrades();
  }
  @Override
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = frameCount + delay; //waits this time before firing
    projectiles.add(new Bolt(position.x-size.x/2,position.y-size.y/2, angle, damage, pierce));
  }
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = true;
    upgradeSpecial[2] = false;
    upgradeSpecial[3] = false;
    //damage
    upgradeDamage[0] = 10;
    upgradeDamage[1] = 0;
    upgradeDamage[2] = 0;
    upgradeDamage[3] = 0;
    //delay (firerate)
    upgradeDelay[0] = 0;
    upgradeDelay[1] = 0;
    upgradeDelay[2] = -25;
    upgradeDelay[3] = -35;
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
    upgradeError[2] = 0;
    upgradeError[3] = 0;
    //names
    upgradeNames[0] = name;
    upgradeNames[1] = name;
    upgradeNames[2] = name;
    upgradeNames[3] = name;
    //debris
    upgradeDebris[0] = "wood";
    upgradeDebris[1] = "wood";
    upgradeDebris[2] = "wood";
    upgradeDebris[3] = "wood";
    //titles
    upgradeTitles[0] = "Sharpness";
    upgradeTitles[1] = "Piercing";
    upgradeTitles[2] = "Faster Firing";
    upgradeTitles[3] = "Yet Faster Firing";
    //desc line one
    upgradeDescOne[0] = "+10";
    upgradeDescOne[1] = "Increase";
    upgradeDescOne[2] = "Increase";
    upgradeDescOne[3] = "Further";
    //desc line two
    upgradeDescTwo[0] = "Damage";
    upgradeDescTwo[1] = "Piercing";
    upgradeDescTwo[2] = "firerate";
    upgradeDescTwo[3] = "Increase";
    //desc line three
    upgradeDescThree[0] = "";
    upgradeDescThree[1] = "";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "firerate";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[8];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[9];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[10];
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
    name = upgradeNames[nextLevel];
    debrisType = upgradeDebris[nextLevel];
    sprite = upgradeSprites[nextLevel];
    if (upgradeSpecial[nextLevel]){
      pierce += 2;
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
  void display(){
   tint(255,tintColor,tintColor);
   image(sBase,position.x-size.x,position.y-size.y);
   pushMatrix();
   translate(position.x-size.x/2,position.y-size.y/2);
   rotate(angle);
   image(sprite,-size.x/2-2,-size.y/2-2);
   popMatrix();
   tint(255,255,255);
  }
}  
class Bolt extends Projectile{
  Bolt(float x, float y, float angle, int damage, int pierce) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(7, 32);
    radius = 10;
    maxSpeed = 24;
    speed = maxSpeed;
    this.damage = damage;
    this.pierce = pierce;
    this.angle = angle;
    hitDelay = 2;
    sprite = spritesH.get("boltPj");
  }  
}  
