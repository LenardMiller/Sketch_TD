class AddHPButton extends Button {
  AddHPButton(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteOne = spritesAnimH.get("addLivesBT")[0];
    spriteTwo = spritesAnimH.get("addLivesBT")[1];
    sprite = spriteOne;
    actionTime = millis() + 100;
  }
  @Override
  void action(){
    HP++;
  }  
}  
