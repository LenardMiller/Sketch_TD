class UpgradeTower extends Button{
  PImage spriteRed;
  PImage spriteGrey;
  int id;
  UpgradeTower(float x, float y, String type, boolean active, int id){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 150);
    spriteOne = spritesAnimH.get("upgradeBT")[0]; //green out
    spriteTwo = spritesAnimH.get("upgradeBT")[1]; //green in
    spriteRed = spritesAnimH.get("upgradeBT")[2]; //red
    spriteGrey = spritesAnimH.get("upgradeBT")[3]; //grey
    sprite = spriteOne;
    actionTime = frameCount + 6;
    active = false;
    this.id = id;
  }
  @Override
  void icMain(ArrayList<Icon> icons, int i){
    if (active){ 
      Tower tower = towers.get(selection.id);
      int nextLevel = 0;
      if (id == 0){
        nextLevel = tower.nextLevelZero;
      }  
      else{
        nextLevel = tower.nextLevelOne;
      }  
      //println(id + ": " + nextLevel);
      if (tower.upgradeNames.length == nextLevel && id == 1){ //if maxLevel, grey out
        sprite = spriteGrey;  
        actionTime = frameCount + 3;
      }  
      else if (tower.upgradeNames.length/2 == nextLevel && id == 0){ //if halfLevel, grey out
        sprite = spriteGrey;  
        actionTime = frameCount + 3;
      }  
      else if (tower.upgradePrices[nextLevel] > money){ //if can't afford, red out
        sprite = spriteRed;
        actionTime = frameCount + 3;
      }  
      else{ //if neither, work fine
        hover();
      } 
      display();
    }
  } 
  void action(){
    Tower tower = towers.get(selection.id);
    int nextLevel = 0;
      if (id == 0){
        nextLevel = tower.nextLevelZero;
      }  
      else{
        nextLevel = tower.nextLevelOne;
      }  
    money -= tower.upgradePrices[nextLevel];
    tower.upgrade(id);
    actionTime = frameCount + 6;
  } 
}  
