class AddMoneyButton extends Button {
  AddMoneyButton(float x, float y, String type){
    super(x,y,type);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteLocation = "sprites/icons/buttons/moneyAdd/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    sprite = spriteOne;
    actionTime = millis() + 100;
  }
  @Override
  void action(){
    money += 10;
  }  
}  
