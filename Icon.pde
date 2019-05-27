class Icon{
  PVector position;
  PVector size;
  String spriteLocation;
  PImage sprite;
  boolean active;
  Icon(float x, float y, String type, boolean active){
    this.active = active;
    position = new PVector(x, y);
    size = new PVector(25, 25);
    sprite = spritesH.get(type);
  }
  void icMain(ArrayList<Icon> icons, int i){
    if (active){
      display();
    }
  }  
  void display(){
    image(sprite,position.x-size.x/2,position.y-size.y/2);
  }  
}
