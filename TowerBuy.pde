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
    spriteLocation = "sprites/icons/buttons/towerBuy/" + twType + "/";
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
  void hover(){
    if (mouseX < position.x+size.x/2 && mouseX > position.x-size.x/2 && mouseY < position.y+size.y/2 && mouseY > position.y-size.y/2 && alive && active && active || depressed && alive){
      sprite = spriteTwo;
      fill(235);
      noStroke();
      rect(700,211,200,707);
      textAlign(CENTER); 
      fill(0);
      textFont(TFFont);
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
      else if (twType == "woodWall"){
        text("Wooden", 800, 241);
        text("Wall", 800, 266);
        textFont(ETFont);
        text("$25", 800, 296);
      }  
      else if (twType == "stoneWall"){
        text("Stone", 800, 241);
        text("Wall", 800, 266);
        textFont(ETFont);
        text("$75", 800, 296);
      }  
      else if (twType == "metalWall"){
        text("Metal", 800, 241);
        text("Wall", 800, 266);
        textFont(ETFont);
        text("$175", 800, 296);
      }  
      else if (twType == "crystalWall"){
        text("Crystal", 800, 241);
        text("Wall", 800, 266);
        textFont(ETFont);
        text("$400", 800, 296);
      }  
      if (mousePressed && millis() - actionTime >= 100 && money >= price && alive){
        action();
      }  
    }  
    else{
      sprite = spriteOne;
    }  
  }  
  void action(){
    depressed = !depressed;
    actionTime = millis() + 100;
    if (hand.held == twType){
      hand.setHeld("null");
    }   
    else if (hand.held != twType && depressed){
      hand.setHeld(twType);  
    }  
  }  
}  
