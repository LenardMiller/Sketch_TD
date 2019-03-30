class TowerTabButton extends Button {
  TowerTabButton(float x, float y, String type){
    super(x,y,type);
    position = new PVector(x, y);
    size = new PVector(200, 24);
    spriteLocation = "sprites/icons/buttons/towerTabSwitch/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    sprite = spriteOne;
    actionTime = millis() + 100;
    active = true;
  }
  //@Override
  //void action(){
  //  Tower tower = towers.get(selection.id);
  //  money += tower.value;
  //  tower.twHP = 0;
  //  active = false;
  //  towerPortrait.active = false;
  //  selection.name = "null";
  //}  
}  
