class TowerBuy extends Button {
  String twType;
  boolean depressed;
  int price;
  TowerBuy(float x, float y, String type, boolean active){
    super(x,y,type,active);
    price = 0;
    position = new PVector(x, y);
    size = new PVector(35, 35);
    twType = type;
    spriteLocation = "sprites/icons/buttons/towerBuy/" + twType + "/"; //still uses old system because it is only created at beginning of game
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    sprite = spriteOne;
    actionTime = millis() + 100;
    depressed = false;
    if (type == "slingshot"){
      price = 50;  
    }  
    else if (type == "crossbow"){
      price = 100;  
    } 
    else if (type == "randomCannon"){
      price = 100;  
    } 
  }
  @Override
  void icMain(ArrayList<Icon> icons, int i){
    hover();
    if (active){
      display();
    }
  }  
  void hover(){ //below is if hovered or depressed
    if (mouseX < position.x+size.x/2 && mouseX > position.x-size.x/2 && mouseY < position.y+size.y/2 && mouseY > position.y-size.y/2 && alive && active || depressed && alive){
      sprite = spriteTwo;
      fill(235);
      noStroke();
      rect(700,211,200,707);
      textAlign(CENTER); 
      fill(0);
      textFont(TFFont); //displays info about tower TODO: put more info
      if (twType == "slingshot"){
        text("Slingshot", 800, 241);
        textFont(ETFont);
        text("$50", 800, 271);
      }  
      else if (twType == "crossbow"){
        text("Crossbow", 800, 241);
        textFont(ETFont);
        text("$100", 800, 271);
      }  
      else if (twType == "randomCannon"){
        text("Random", 800, 241);
        text("Cannon", 800, 266);
        textFont(ETFont);
        text("$100", 800, 296);
      }  
      else if (twType == "wall"){
        text("Wooden", 800, 241);
        text("Wall", 800, 266);
        textFont(ETFont);
        text("$25", 800, 296);
      }  
      if (mousePressed && millis() - actionTime >= 100 && money >= price && alive){ //if pressed
        action();
      }  
      else if (mousePressed && millis() - actionTime >= 100 && money < price && alive){ //if pressed but no money
        depressed = !depressed; //invert depression
        actionTime = millis() + 100;
      }
    }  
    else{
      sprite = spriteOne;
    }  
  }  
  void action(){
    depressed = !depressed; //invert depression
    actionTime = millis() + 100;
    if (hand.held == twType){ //if already holding, stop
      hand.setHeld("null");
    }   
    else if (hand.held != twType && depressed){ //if not, do
      hand.setHeld(twType);  
    }  
  }  
}  
