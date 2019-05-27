class Wall extends Tower{
  Wall(float x, float y) {
    super(x,y);
    name = "woodWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHp = 50;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("woodWallTW");
    debrisType = "wood";
    price = 25;
    value = price;
    nextLevel = 0;
    upgradePrices = new int[4];
    upgradeHealth = new int[4];
    upgradeNames = new String[4];
    upgradeDebris = new String[4];
    upgradeTitles = new String[4];
    upgradeIcons = new PImage[4];
    upgradeSprites = new PImage[4];
    setUpgrades();
  }
  @Override
  void setUpgrades(){
    //price
    upgradePrices[0] = 50;
    upgradePrices[1] = 100;
    upgradePrices[2] = 225;
    upgradePrices[3] = 500;
    //heath
    upgradeHealth[0] = 75;
    upgradeHealth[1] = 125;
    upgradeHealth[2] = 250;
    upgradeHealth[3] = 500;
    //names
    upgradeNames[0] = "stoneWall";
    upgradeNames[1] = "metalWall";
    upgradeNames[2] = "crystalWall";
    upgradeNames[3] = "ultimateWall";
    //debris
    upgradeDebris[0] = "stone";
    upgradeDebris[1] = "metal";
    upgradeDebris[2] = "crystal";
    upgradeDebris[3] = "devWood";
    //titles
    upgradeTitles[0] = "Stone";
    upgradeTitles[1] = "Metal";
    upgradeTitles[2] = "Crystal";
    upgradeTitles[3] = "Ultimate";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[1];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[2];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[3];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[4];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
    upgradeSprites[2] = spritesH.get("crystalWallTW");
    upgradeSprites[3] = spritesH.get("ultimateWallTW");
  }  
}  
