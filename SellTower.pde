class SellTower extends Button {
  SellTower(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 45);
    spriteOne = spritesAnimH.get("sellTowerBT")[0];
    spriteTwo = spritesAnimH.get("sellTowerBT")[1];
    sprite = spriteOne;
    actionTime = millis() + 100;
    active = false;
  }
  @Override
  void action(){
    Tower tower = towers.get(selection.id);
    money += tower.value;
    tower.twHP = 0;
    active = false;
    targetButton.active = false;
    repairButton.active = false;
    selection.name = "null";
  }  
}  
