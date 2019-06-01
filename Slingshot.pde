class Slingshot extends Turret{
  Slingshot(float x, float y) {
    super(x,y);
    name = "slingshot";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 60; //default: 60 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    pjSpeed = 12;
    error = 5; //set to 360 for a fun time. default: 5 degrees
    numFireFrames = 34;
    numLoadFrames = 59;
    spriteLocation = "sprites/towers/turrets/slingshot/";
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    damage = 10;
    loadSprites();
    debrisType = "stone";
    price = 50;
    value = price;
    priority = 0; //first
    setUpgrades();
  }  
  @Override
  void fire(){ //needed to change projectile fired
    angle += radians(random(-error,error));
    delayTime = frameCount + delay; //waits this time before firing
    projectiles.add(new Pebble(position.x-size.x/2,position.y-size.y/2, angle, damage));
  }  
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    //damage
    upgradeDamage[0] = 0;
    upgradeDamage[1] = 10;
    //delay (firerate)
    upgradeDelay[0] = -30;
    upgradeDelay[1] = 0;
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
    upgradeNames[0] = "slingshot";
    upgradeNames[1] = "slingshot";
    //debris
    upgradeDebris[0] = "stone";
    upgradeDebris[1] = "stone";
    //titles
    upgradeTitles[0] = "Faster Firing";
    upgradeTitles[1] = "Damage Up";
    //desc line one
    upgradeDescOne[0] = "Increase";
    upgradeDescOne[1] = "+10";
    //desc line two
    upgradeDescTwo[0] = "firerate";
    upgradeDescTwo[1] = "damage";
    //desc line three
    upgradeDescThree[0] = "";
    upgradeDescThree[1] = "";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[8];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
  }  
}
