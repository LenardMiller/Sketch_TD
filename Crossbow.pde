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
    loadSprites();
    debrisType = "wood";
    price = 100;
    value = price;
    priority = 1; //last
  }  
  @Override
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = frameCount + delay; //waits this time before firing
    projectiles.add(new Bolt(position.x-size.x/2,position.y-size.y/2, angle));
  }  
  void setUpgrades(){
    //price
    upgradePrices[0] = 50;
    upgradePrices[1] = 100;
    //heath
    upgradeHealth[0] = 0;
    upgradeHealth[1] = 0;
    //damage
    upgradeDamage[0] = 0;
    upgradeDamage[1] = 0;
    //names
    upgradeNames[0] = "firerateA";
    upgradeNames[1] = "firerateB";
    //debris
    upgradeDebris[0] = "wood";
    upgradeDebris[1] = "wood";
    //titles
    upgradeTitles[0] = "Firerate";
    upgradeTitles[1] = "Firerate";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[11];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
  }  
}  
