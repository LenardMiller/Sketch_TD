class EnergyBlaster extends Turret{
  EnergyBlaster(float x, float y) {
    super(x,y);
    name = "energyBlaster";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 240; //default: 240 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    damage = 20;
    pjSpeed = 16;
    error = 3; //set to 360 for a fun time. default: 5 degrees
    numFireFrames = 14;
    numLoadFrames = 42;
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    damage = 10;
    loadSprites();
    debrisType = "metal";
    price = 50;
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
    PVector spp = new PVector(position.x-size.x/2,position.y-size.y/2);
    PVector spa = PVector.fromAngle(angle-HALF_PI);
    spa.setMag(40);
    spp.add(spa);
    projectiles.add(new EnergyBlast(spp.x,spp.y, angle, damage));
  }
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    upgradeSpecial[2] = false;
    upgradeSpecial[3] = false;
    //damage
    upgradeDamage[0] = 0;
    upgradeDamage[1] = 0;
    upgradeDamage[2] = 0;
    upgradeDamage[3] = 10;
    //delay (firerate)
    upgradeDelay[0] = 0;
    upgradeDelay[1] = 0;
    upgradeDelay[2] = -30;
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
    upgradeError[0] = -1;
    upgradeError[1] = -2;
    upgradeError[2] = 0;
    upgradeError[3] = 0;
    //names
    upgradeNames[0] = "slingshot";
    upgradeNames[1] = "slingshot";
    upgradeNames[2] = "slingshot";
    upgradeNames[3] = "slingshot";
    //debris
    upgradeDebris[0] = "stone";
    upgradeDebris[1] = "stone";
    upgradeDebris[2] = "stone";
    upgradeDebris[3] = "stone";
    //titles
    upgradeTitles[0] = "More Precise";
    upgradeTitles[1] = "Super Precise";
    upgradeTitles[2] = "Faster Firing";
    upgradeTitles[3] = "Damage Up";
    //desc line one
    upgradeDescOne[0] = "Increase";
    upgradeDescOne[1] = "further";
    upgradeDescOne[2] = "Increase";
    upgradeDescOne[3] = "+10";
    //desc line two
    upgradeDescTwo[0] = "accuracy";
    upgradeDescTwo[1] = "increase";
    upgradeDescTwo[2] = "firerate";
    upgradeDescTwo[3] = "damage";
    //desc line three
    upgradeDescThree[0] = "";
    upgradeDescThree[1] = "accuracy";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[5];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[6];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[8];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
    upgradeSprites[2] = spritesH.get("stoneWallTW");
    upgradeSprites[3] = spritesH.get("metalWallTW");
  }
  void display(){
   tint(255,tintColor,tintColor);
   image(sBase,position.x-size.x,position.y-size.y);
   pushMatrix();
   translate(position.x-size.x/2,position.y-size.y/2);
   rotate(angle);
   image(sprite,-size.x/2-11,-size.y/2-11);
   popMatrix();
   tint(255,255,255);
  }
}
