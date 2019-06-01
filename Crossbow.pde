class Crossbow extends Turret{
  Crossbow(float x, float y) {
    super(x,y);
    name = "crossbow";
    position = new PVector(x,y);
    size = new PVector(54,54);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 120; //default: 120 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 24;
    error = 2; //set to 360 for a fun time. default: 2 degrees
    numFireFrames = 13;
    numLoadFrames = 81;
    spriteLocation = "sprites/towers/turrets/crossbow/";
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    damage = 20;
    loadSprites();
    debrisType = "wood";
    price = 100;
    value = price;
    priority = 1; //last
    setUpgrades();
  }  
  @Override
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = frameCount + delay; //waits this time before firing
    projectiles.add(new Bolt(position.x-size.x/2,position.y-size.y/2, angle, damage));
  }  
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    //damage
    upgradeDamage[0] = 0;
    upgradeDamage[1] = 0;
    //delay (firerate)
    upgradeDelay[0] = -20;
    upgradeDelay[1] = -20;
    //price
    upgradePrices[0] = 50;
    upgradePrices[1] = 100;
    //heath
    upgradeHealth[0] = 0;
    upgradeHealth[1] = 0;
    //error (accuracy)
    upgradeError[0] = 0;
    upgradeError[1] = 0;
    //names
    upgradeNames[0] = "crossbow";
    upgradeNames[1] = "crossbow";
    //debris
    upgradeDebris[0] = "wood";
    upgradeDebris[1] = "wood";
    //titles
    upgradeTitles[0] = "Faster Firing";
    upgradeTitles[1] = "Yet Faster Firing";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[10];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
  }  
}  
