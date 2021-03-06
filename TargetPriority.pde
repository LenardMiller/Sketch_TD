class TargetPriority extends Button {
  TargetPriority(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 45);
    spriteLocation = "sprites/icons/buttons/targetPriority/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    sprite = spriteOne;
    actionTime = frameCount + 6;
  }
  @Override
  void action(){
    Tower tower = towers.get(selection.id); //switch selected tower's priority
    if (tower.priority < 2){
      tower.priority += 1;
    }
    else{ //roll over
      tower.priority = 0;
    }  
    actionTime = frameCount + 6;
  }  
}  
