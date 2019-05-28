class AddHPButton extends Button {
  AddHPButton(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteOne = spritesAnimH.get("livesAddBT")[0];
    spriteTwo = spritesAnimH.get("livesAddBT")[1];
    sprite = spriteOne;
    actionTime = frameCount + 6;
  }
  @Override
  void action(){ //give lives
    Hp++;
  }  
}  
