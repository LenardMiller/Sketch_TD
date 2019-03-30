class SellTower extends Button {
  SellTower(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 45);
    spriteLocation = "sprites/icons/buttons/sellTower/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
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
    towerPortrait.active = false;
    selection.name = "null";
  }  
}  
