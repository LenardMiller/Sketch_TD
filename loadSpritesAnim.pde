void loadSpritesAnim(){
  spritesAnimH.put("upgradeIC",new PImage[13]);
  for (int i = 12; i >= 0; i--){
    spritesAnimH.get("upgradeIC")[i] = loadImage("sprites/icons/upgrades/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("livesAddBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("livesAddBT")[i] = loadImage("sprites/icons/buttons/livesAdd/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("moneyAddBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("moneyAddBT")[i] = loadImage("sprites/icons/buttons/moneyAdd/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("nullBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("nullBT")[i] = loadImage("sprites/icons/buttons/null/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("repairBT",new PImage[4]);
  for (int i = 3; i >= 0; i--){
    spritesAnimH.get("repairBT")[i] = loadImage("sprites/icons/buttons/repairButton/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("upgradeBT",new PImage[4]);
  for (int i = 3; i >= 0; i--){
    spritesAnimH.get("upgradeBT")[i] = loadImage("sprites/icons/buttons/upgradeButton/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("sellTowerBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("sellTowerBT")[i] = loadImage("sprites/icons/buttons/sellTower/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("targetPriorityBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("targetPriorityBT")[i] = loadImage("sprites/icons/buttons/targetPriority/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("towerTabSwitchBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("towerTabSwitchBT")[i] = loadImage("sprites/icons/buttons/towerTabSwitch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("energyBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("energyBuffPT")[i] = loadImage("sprites/particles/buff/energy/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("fireBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("fireBuffPT")[i] = loadImage("sprites/particles/buff/fire/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("poisonBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("poisonBuffPT")[i] = loadImage("sprites/particles/buff/poison/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("waterBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("waterBuffPT")[i] = loadImage("sprites/particles/buff/water/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("nullBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("nullBuffPT")[i] = loadImage("sprites/particles/buff/null/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("greenOuchEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("greenOuchEnemyPT")[i] = loadImage("sprites/particles/enemy/greenOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("greyPuffEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("greyPuffEnemyPT")[i] = loadImage("sprites/particles/enemy/greyPuff/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("pinkOuchEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("pinkOuchEnemyPT")[i] = loadImage("sprites/particles/enemy/pinkOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("redOuchEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("redOuchEnemyPT")[i] = loadImage("sprites/particles/enemy/redOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("mediumExplosionPT",new PImage[18]);
  for (int i = 17; i >= 0; i--){
    spritesAnimH.get("mediumExplosionPT")[i] = loadImage("sprites/particles/mediumExplosion/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("largeExplosionPT",new PImage[18]);
  for (int i = 17; i >= 0; i--){
    spritesAnimH.get("largeExplosionPT")[i] = loadImage("sprites/particles/largeExplosion/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("energyExDebrisPT",new PImage[4]);
  for (int i = 3; i >= 0; i--){
    spritesAnimH.get("energyExDebrisPT")[i] = loadImage("sprites/particles/explosionDebris/energy/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("miscPJ",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("miscPJ")[i] = loadImage("sprites/projectiles/misc/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("slingshotFireTR",new PImage[34]);
  for (int i = 33; i >= 0; i--){
    spritesAnimH.get("slingshotFireTR")[i] = loadImage("sprites/towers/turrets/slingshot/fire/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("slingshotLoadTR",new PImage[59]);
  for (int i = 58; i >= 0; i--){
    spritesAnimH.get("slingshotLoadTR")[i] = loadImage("sprites/towers/turrets/slingshot/load/load" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("crossbowFireTR",new PImage[13]);
  for (int i = 12; i >= 0; i--){
    spritesAnimH.get("crossbowFireTR")[i] = loadImage("sprites/towers/turrets/crossbow/fire/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("crossbowLoadTR",new PImage[81]);
  for (int i = 80; i >= 0; i--){
    spritesAnimH.get("crossbowLoadTR")[i] = loadImage("sprites/towers/turrets/crossbow/load/load" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("miscCannonFireAcidTR",new PImage[12]);
  for (int i = 11; i >= 0; i--){
    spritesAnimH.get("miscCannonFireAcidTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/acid/fire" + nf(i/2,3) + ".png");
    i--;
    spritesAnimH.get("miscCannonFireAcidTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/acid/fire" + nf(i/2,3) + ".png");
  }  
  spritesAnimH.put("miscCannonFireMiscTR",new PImage[12]);
  for (int i = 11; i >= 0; i--){
    spritesAnimH.get("miscCannonFireMiscTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/misc/fire" + nf(i/2,3) + ".png");
    i--;
    spritesAnimH.get("miscCannonFireMiscTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/misc/fire" + nf(i/2,3) + ".png");
  }  
  spritesAnimH.put("miscCannonFireUrchinTR",new PImage[12]);
  for (int i = 11; i >= 0; i--){
    spritesAnimH.get("miscCannonFireUrchinTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/urchin/fire" + nf(i/2,3) + ".png");
    i--;
    spritesAnimH.get("miscCannonFireUrchinTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/urchin/fire" + nf(i/2,3) + ".png");
  }  
  spritesAnimH.put("miscCannonFireWaterTR",new PImage[12]);
  for (int i = 11; i >= 0; i--){
    spritesAnimH.get("miscCannonFireWaterTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/water/fire" + nf(i/2,3) + ".png");
    i--;
    spritesAnimH.get("miscCannonFireWaterTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/water/fire" + nf(i/2,3) + ".png");
  }  
  spritesAnimH.put("miscCannonLoadTR",new PImage[34]);
  for (int i = 33; i >= 0; i--){
    spritesAnimH.get("miscCannonLoadTR")[i] = loadImage("sprites/towers/turrets/miscCannon/load/load" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("energyBlasterFireTR",new PImage[14]);
  for (int i = 13; i >= 0; i--){
    spritesAnimH.get("energyBlasterFireTR")[i] = loadImage("sprites/towers/turrets/energyBlaster/fire/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("energyBlasterLoadTR",new PImage[42]);
  for (int i = 41; i >= 0; i--){
    spritesAnimH.get("energyBlasterLoadTR")[i] = loadImage("sprites/towers/turrets/energyBlaster/load/load" + nf(i,3) + ".png");
  }  
}  
