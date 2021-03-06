class TowerTabButton extends Button {
  TowerTabButton(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 24);
    spriteOne = spritesAnimH.get("towerTabSwitchBT")[0];
    spriteTwo = spritesAnimH.get("towerTabSwitchBT")[1];
    sprite = spriteOne;
    actionTime = frameCount + 6;
  }
  @Override
  void action(){
    for (int i = 4; i <= 33; i++){ //iterates through all tower buttons and inverts active
      Icon button = icons.get(i);
      if (button.active == false){
        button.active = true;
      }
      else if (button.active == true){
        button.active = false;  
      }  
    }
    actionTime = frameCount + 6;
  }  
}  
