class MagicMissleer extends Turret{
  MagicMissleer(float x, float y) {
    super(x,y);
    name = "magicMissleer";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 30; //240 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    damage = 30;
    pjSpeed = 5;
    error = 20; //0 degrees
    numFireFrames = 8; //8
    numLoadFrames = 26; //26
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    damage = 5;
    loadSprites();
    debrisType = "crystal";
    price = 150;
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
    projectiles.add(new MagicMissle(position.x-size.x/2,position.y-size.y/2, angle, damage, 0));
    projectiles.add(new MagicMissle(position.x-size.x/2,position.y-size.y/2, angle, damage, 1));
    projectiles.add(new MagicMissle(position.x-size.x/2,position.y-size.y/2, angle, damage, 2));
  }
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = true;
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
    upgradeError[0] = -1.5;
    upgradeError[1] = 0;
    upgradeError[2] = 0;
    upgradeError[3] = 0;
    //names
    upgradeNames[0] = "energyBlaster";
    upgradeNames[1] = "energyBlaster";
    upgradeNames[2] = "energyBlaster";
    upgradeNames[3] = "energyBlaster";
    //debris
    upgradeDebris[0] = "metal";
    upgradeDebris[1] = "metal";
    upgradeDebris[2] = "metal";
    upgradeDebris[3] = "metal";
    //titles
    upgradeTitles[0] = "More Precise";
    upgradeTitles[1] = "Splashier";
    upgradeTitles[2] = "Faster Firing";
    upgradeTitles[3] = "Yet Faster Firing";
    //desc line one
    upgradeDescOne[0] = "Increase";
    upgradeDescOne[1] = "increase";
    upgradeDescOne[2] = "Increase";
    upgradeDescOne[3] = "further";
    //desc line two
    upgradeDescTwo[0] = "accuracy";
    upgradeDescTwo[1] = "explosion";
    upgradeDescTwo[2] = "firerate";
    upgradeDescTwo[3] = "increase";
    //desc line three
    upgradeDescThree[0] = "";
    upgradeDescThree[1] = "radius";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "firerate";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[5];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[12];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[10];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
    upgradeSprites[2] = spritesH.get("stoneWallTW");
    upgradeSprites[3] = spritesH.get("metalWallTW");
  }
}
