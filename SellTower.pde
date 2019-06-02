class SellTower extends Button {
  SellTower(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 45);
    spriteOne = spritesAnimH.get("sellTowerBT")[0];
    spriteTwo = spritesAnimH.get("sellTowerBT")[1];
    sprite = spriteOne;
    actionTime = frameCount + 6;
    active = false;
  }
  @Override
  void action(){ //kills tower and gives value
    Tower tower = towers.get(selection.id);
    money += floor(tower.value*.8);
    tower.twHp = 0; //creates particles (may need to change later)
    active = false;
    targetButton.active = false;
    repairButton.active = false;
    upgradeButtonZero.active = false;
    upgradeButtonOne.active = false;
    upgradeIconZero.active = false;
    upgradeIconOne.active = false;
    selection.name = "null";
  }  
}  
