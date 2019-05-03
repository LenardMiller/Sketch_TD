class AddMoneyButton extends Button {
  AddMoneyButton(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteOne = spritesAnimH.get("addMoneyBT")[0];
    spriteTwo = spritesAnimH.get("addMoneyBT")[1];
    sprite = spriteOne;
    actionTime = millis() + 100;
  }
  @Override
  void action(){
    money += 10;
  }  
}  
