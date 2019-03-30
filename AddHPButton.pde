class AddHPButton extends Button {
  AddHPButton(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteLocation = "sprites/icons/buttons/livesAdd/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    sprite = spriteOne;
    actionTime = millis() + 100;
  }
  @Override
  void action(){
    HP++;
  }  
}  
