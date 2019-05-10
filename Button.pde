class Button extends Icon {
  int actionTime;
  PImage spriteOne;
  PImage spriteTwo;
  Button(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteOne = spritesAnimH.get("nullBT")[0];
    spriteTwo = spritesAnimH.get("nullBT")[1];
    sprite = spriteOne;
    actionTime = millis() + 100;
  }
  void hover(){
    if (mouseX < position.x+size.x/2 && mouseX > position.x-size.x/2 && mouseY < position.y+size.y/2 && mouseY > position.y-size.y/2 && alive){
      sprite = spriteTwo;
      if (mousePressed && millis() - actionTime >= 100 && alive){
        action();
      }  
    }  
    else{
      sprite = spriteOne;
    }  
  }  
  void action(){
    println("Boink!");
    actionTime = millis() + 100;
  }  
  @Override
  void icMain(ArrayList<Icon> icons, int i){
    if (active){
      hover();
      display();
    }
  }  
  void display(){
    image(sprite,position.x-size.x/2,position.y-size.y/2);
  }  
}  
