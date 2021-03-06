class EnergyBlaster extends Turret{
  int effectRadius;
  boolean bigExplosion;
  EnergyBlaster(float x, float y) {
    super(x,y);
    name = "energyBlaster";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 240; //240 frames
    delay += (round(random(-(delay/10),delay/10))); //injects 10% randomness so all don't fire at once
    delayTime = delay;
    damage = 30;
    pjSpeed = 16;
    error = 3; //3 degrees
    numFireFrames = 14; //14
    numLoadFrames = 42; //42
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteType = 0;
    damage = 20;
    effectRadius = 15;
    bigExplosion = false;
    loadSprites();
    debrisType = "metal";
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
    PVector spp = new PVector(position.x-size.x/2,position.y-size.y/2);
    PVector spa = PVector.fromAngle(angle-HALF_PI);
    spa.setMag(40);
    spp.add(spa);
    projectiles.add(new EnergyBlast(spp.x,spp.y, angle, damage, effectRadius, bigExplosion));
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
    upgradeError[0] = -1.5;
    upgradeError[1] = 0;
    upgradeError[2] = 0;
    upgradeError[3] = 0;
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
      effectRadius += 10;
      bigExplosion = true;
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
   image(sprite,-size.x/2-11,-size.y/2-11);
   popMatrix();
   tint(255,255,255);
  }
}
class EnergyBlast extends Projectile{
  boolean bigExplosion;
  EnergyBlast(float x, float y, float angle, int damage, int effectRadius, boolean bigExplosion) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 18);
    radius = 14;
    maxSpeed = 16;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 1;
    this.angle = angle;
    sprite = spritesH.get("energyPj");
    isTrail = true;
    this.effectRadius = effectRadius;
    trail = "energy";
    this.bigExplosion = bigExplosion;
  }
  @Override
  void collideEn(){
    if (frameCount > hitTime){
      for (int i = enemies.size()-1; i >= 0; i--){
        Enemy enemy = enemies.get(i);
        if (abs(enemy.position.x-position.x) <= (radius + enemy.radius) && abs(enemy.position.y-position.y) <= (radius + enemy.radius) && pierce > 0){ //if touching enemy, and has pierce
          enemy.collidePJ(damage,buff,i);
          if (!bigExplosion){
            int num = floor(random(10,16));
            for (int j = num; j >= 0; j--){
              particles.add(new ExplosionDebris(position.x, position.y, random(0,360), "energy", maxSpeed = random(0.5,2.5)));
            }  
            particles.add(new MediumExplosion(position.x, position.y, random(0,360)));
          }
          else{
            int num = floor(random(16,42));
            for (int j = num; j >= 0; j--){
              particles.add(new ExplosionDebris(position.x, position.y, random(0,360), "energy", maxSpeed = random(1.5,4.5)));
            }  
            particles.add(new LargeExplosion(position.x, position.y, random(0,360)));
          }  
          hitTime = frameCount + hitDelay; //little timer so no constant damage, NOT unneccissary
          pierce--;
          for (int j = enemies.size()-1; j >= 0; j--){
            Enemy erEnemy = enemies.get(j);
            if (abs(erEnemy.position.x-position.x) <= (effectRadius + erEnemy.radius) && abs(erEnemy.position.y-position.y) <= (effectRadius + erEnemy.radius)){ //if near enemy
              erEnemy.collidePJ(damage/2,buff,i);
            }
          }
        }            
        if (pierce == 0) {
          dead = true;
        }  
      }  
    }  
  } 
}  
