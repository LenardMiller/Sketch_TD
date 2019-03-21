class Icon{
  PVector position;
  PVector size;
  String spriteLocation;
  PImage sprite;
  Icon(float x, float y, String type){
    position = new PVector(x, y);
    size = new PVector(25, 25);
    spriteLocation = "sprites/icons/" + type + "/";
    sprite = loadImage(spriteLocation + "000.png");
  }
  void icMain(ArrayList<Icon> icons, int i){
    display();
  }  
  void display(){
    image(sprite,position.x-size.x/2,position.y-size.y/2);
  }  
}
