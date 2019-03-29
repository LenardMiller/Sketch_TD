class TargetPriority extends Button {
  TargetPriority(float x, float y, String type){
    super(x,y,type);
    position = new PVector(x, y);
    size = new PVector(200, 45);
    spriteLocation = "sprites/icons/buttons/targetPriority/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    sprite = spriteOne;
    actionTime = millis() + 100;
    active = false;
  }
  @Override
  void action(){
    Tower tower = towers.get(selection.id);
    if (tower.priority < 2){
      tower.priority += 1;
    }
    else{
      tower.priority = 0;
    }  
    actionTime = millis() + 100;
  }  
}  
