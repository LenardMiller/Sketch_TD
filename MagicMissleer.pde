class MagicMissleer extends Turret{
  boolean four;
  MagicMissleer(float x, float y) {
    super(x,y);
    name = "magicMissleer";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 90; //90 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    damage = 5;
    pjSpeed = 5;
    error = 0; //0 degrees
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
    four = false;
    setUpgrades();
  }
  @Override
  void checkTarget(){
    if (frame == 0 && spriteType == 0){ //if done animating
      spriteType = 1;
      frame = 0;
      fire();
    }
  }
  void fire(){ //needed to change projectile fired
    delayTime = frameCount + delay; //waits this time before firing
    projectiles.add(new MagicMissle(random(position.x-size.x,position.x),random(position.y-size.y,position.y), angle, damage, 0));
    projectiles.add(new MagicMissle(random(position.x-size.x,position.x),random(position.y-size.y,position.y), angle, damage, 1));
    projectiles.add(new MagicMissle(random(position.x-size.x,position.x),random(position.y-size.y,position.y), angle, damage, 2));
    if (four){
      projectiles.add(new MagicMissle(random(position.x-size.x,position.x),random(position.y-size.y,position.y), angle, damage, floor(random(0,2.99))));
    }  
  }
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    upgradeSpecial[2] = false;
    upgradeSpecial[3] = true;
    //damage
    upgradeDamage[0] = 3;
    upgradeDamage[1] = 3;
    upgradeDamage[2] = 0;
    upgradeDamage[3] = 0;
    //delay (firerate)
    upgradeDelay[0] = 0;
    upgradeDelay[1] = 0;
    upgradeDelay[2] = -15;
    upgradeDelay[3] = 0;
    //price
    upgradePrices[0] = 50;
    upgradePrices[1] = 100;
    upgradePrices[2] = 50;
    upgradePrices[3] = 200;
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
    upgradeNames[3] = "magicMissleerFour";
    //debris
    upgradeDebris[0] = "crystal";
    upgradeDebris[1] = "crystal";
    upgradeDebris[2] = "crystal";
    upgradeDebris[3] = "crystal";
    //titles
    upgradeTitles[0] = "Magic Power";
    upgradeTitles[1] = "Mega Magic";
    upgradeTitles[2] = "Faster Firing";
    upgradeTitles[3] = "More Missiles";
    //desc line one
    upgradeDescOne[0] = "+3";
    upgradeDescOne[1] = "+3";
    upgradeDescOne[2] = "Increase";
    upgradeDescOne[3] = "+1 Missile";
    //desc line two
    upgradeDescTwo[0] = "damage";
    upgradeDescTwo[1] = "damage";
    upgradeDescTwo[2] = "firerate";
    upgradeDescTwo[3] = "";
    //desc line three
    upgradeDescThree[0] = "per missile";
    upgradeDescThree[1] = "per missile";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[8];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[13];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[7];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[14];
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
      four = true;
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
    //reset names
    upgradeNames[0] = name;
    upgradeNames[1] = name;
    upgradeNames[2] = name;
    int num = floor(random(30,50)); //shower debris
    for (int j = num; j >= 0; j--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }
}
