void loadSpritesAnim(){
  spritesAnimH.put("upgradeIC",new PImage[15]);
  for (int i = 14; i >= 0; i--){
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
  spritesAnimH.put("greenMagicBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("greenMagicBuffPT")[i] = loadImage("sprites/particles/buff/greenMagic/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("miscPJ",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("miscPJ")[i] = loadImage("sprites/projectiles/misc/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("nullAttackEN", new PImage[1]);
  spritesAnimH.get("nullAttackEN")[0] = loadImage("sprites/enemies/null/attack/000.png");
  spritesAnimH.put("nullMoveEN", new PImage[1]);
  spritesAnimH.get("nullMoveEN")[0] = loadImage("sprites/enemies/null/move/000.png");
  spritesAnimH.put("treeSpiritAttackEN", new PImage[42]);
  for (int i = 41; i >= 0; i--){
    spritesAnimH.get("treeSpiritAttackEN")[i] = loadImage("sprites/enemies/treeSpirit/attack/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("treeSpiritMoveEN", new PImage[47]);
  for (int i = 46; i >= 0; i--){
    spritesAnimH.get("treeSpiritMoveEN")[i] = loadImage("sprites/enemies/treeSpirit/move/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("treeSpriteMoveEN", new PImage[58]);
  for (int i = 57; i >= 0; i--){
    spritesAnimH.get("treeSpriteMoveEN")[i] = loadImage("sprites/enemies/treeSprite/move/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("treeSpriteAttackEN", new PImage[50]);
  for (int i = 49; i >= 0; i--){
    spritesAnimH.get("treeSpriteAttackEN")[i] = loadImage("sprites/enemies/treeSprite/attack/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("midBugAttackEN", new PImage[42]);
  for (int i = 41; i >= 0; i--){
    spritesAnimH.get("midBugAttackEN")[i] = loadImage("sprites/enemies/midBug/attack/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("midBugMoveEN", new PImage[32]);
  for (int i = 31; i >= 0; i--){
    spritesAnimH.get("midBugMoveEN")[i] = loadImage("sprites/enemies/midBug/move/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("smolBugAttackEN", new PImage[34]);
  for (int i = 33; i >= 0; i--){
    spritesAnimH.get("smolBugAttackEN")[i] = loadImage("sprites/enemies/smolBug/attack/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("smolBugMoveEN", new PImage[24]);
  for (int i = 23; i >= 0; i--){
    spritesAnimH.get("smolBugMoveEN")[i] = loadImage("sprites/enemies/smolBug/move/" + nf(i,3) + ".png");
  } 
  spritesAnimH.put("bigBugAttackEN", new PImage[100]);
  for (int i = 99; i >= 0; i--){
    spritesAnimH.get("bigBugAttackEN")[i] = loadImage("sprites/enemies/bigBug/attack/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("bigBugMoveEN", new PImage[48]);
  for (int i = 47; i >= 0; i--){
    spritesAnimH.get("bigBugMoveEN")[i] = loadImage("sprites/enemies/bigBug/move/" + nf(i,3) + ".png");
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
  spritesAnimH.put("miscCannonFireTR",new PImage[12]);
  for (int i = 11; i >= 0; i--){
    spritesAnimH.get("miscCannonFireTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/fire" + nf(i,3) + ".png");
  }   
  spritesAnimH.put("miscCannonLoadTR",new PImage[1]);
  for (int i = 0; i >= 0; i--){
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
  spritesAnimH.put("magicMissleerFireTR",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("magicMissleerFireTR")[i] = loadImage("sprites/towers/turrets/magicMissleer/fire/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("magicMissleerLoadTR",new PImage[26]);
  for (int i = 25; i >= 0; i--){
    spritesAnimH.get("magicMissleerLoadTR")[i] = loadImage("sprites/towers/turrets/magicMissleer/load/load" + nf(i,3) + ".png");
  }  
}  
