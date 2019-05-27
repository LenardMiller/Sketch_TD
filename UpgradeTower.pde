class UpgradeTower extends Button{
  PImage spriteRed;
  PImage spriteGrey;
  UpgradeTower(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 150);
    spriteOne = spritesAnimH.get("upgradeBT")[0]; //green out
    spriteTwo = spritesAnimH.get("upgradeBT")[1]; //green in
    spriteRed = spritesAnimH.get("upgradeBT")[2]; //red
    spriteGrey = spritesAnimH.get("upgradeBT")[3]; //grey
    sprite = spriteOne;
    actionTime = millis() + 100;
    active = false;
  }
  @Override
  void icMain(ArrayList<Icon> icons, int i){
    if (active){ 
      Tower tower = towers.get(selection.id);
      if (tower.upgradeNames.length == tower.nextLevel){ //if maxLevel, grey out
        sprite = spriteGrey;  
        actionTime = millis() + 50;
      }  
      else if (tower.upgradePrices[tower.nextLevel] > money){ //if can't afford, red out
        sprite = spriteRed;
        actionTime = millis() + 50;
      }  
      else{ //if neither, work fine
        hover();
      } 
      display();
    }
  } 
  void action(){
    Tower tower = towers.get(selection.id);
    money -= tower.upgradePrices[tower.nextLevel];
    tower.upgrade();
    actionTime = millis() + 100;
  } 
}  
