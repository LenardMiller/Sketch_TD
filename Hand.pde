class Hand{ //what is selected, eg: slingshot
  String held;
  PImage heldSprite;
  PVector size;
  PVector offset;
  boolean implaceable;
  int price;
  Hand(){
    held = "null";
    size = new PVector(25,25);
    offset = new PVector(0,0);
    implaceable = false;
  }  
  void hMain(){
    checkPlaceable();
    displayHeld();
    if (mousePressed == true && !implaceable){
      place();
    }  
  }  
  void checkPlaceable(){ //the following checks if on screen
    if (!((10*(ceil(mouseX/10))) <= boardWidth-(size.x) && (10*(ceil(mouseX/10))) >= (size.x) && (10*(ceil(mouseY/10))) <= boardHeight-(size.y) && (10*(ceil(mouseY/10))) >= (size.y))){
      implaceable = true;
    }  
    else{
      implaceable = false;  
    }  
    for (int i = towers.size()-1; i >= 0; i--){ //checks if too near tower
      Tower tower = towers.get(i);
      float dx = (tower.position.x - tower.size.x/2) - (10*(ceil(mouseX/10)));
      float dy = (tower.position.y - tower.size.y/2) - (10*(ceil(mouseY/10)));
      if (dy < size.y + tower.size.y/2 && dy > -(tower.size.y/2) - size.y && dx < size.x + tower.size.x/2 && dx > -(tower.size.x/2) - size.x){ //if touching tower
        implaceable = true;
      }
    }
    if (price > money){ //check if enough money
      implaceable = true;  
    }  
  }  
  void displayHeld(){ //shows whats held at ~1/2 opacity
    if (held != "null" && alive){
      if (implaceable){ //red if implacable
        tint(255, 0, 0, 150);
      }  
      else{ 
        tint(255,150);  
      }  
      image(heldSprite,(10*(ceil(mouseX/10)))-(size.x)-offset.x,(10*(ceil(mouseY/10)))-(size.y)-offset.y);
      tint(255);
    }  
  }
  void setHeld(String setHeld){ //swaps whats held
     if (setHeld == "slingshot"){
       heldSprite = spritesH.get("slingshotFullTR");
       size = new PVector(25,25);
       offset = new PVector(0,0);
       held = setHeld;
       price = 50;
     }  
     else if (setHeld == "crossbow"){
       heldSprite = spritesH.get("crossbowFullTR");
       size = new PVector(25,25);
       offset = new PVector(2,2);
       held = setHeld;
       price = 100;
     }  
     else if (setHeld == "miscCannon"){
       heldSprite = spritesH.get("miscCannonFullTR");
       size = new PVector(25,25);
       offset = new PVector(0,0);
       held = setHeld;
       price = 100;
     }  
     else if (setHeld == "energyBlaster"){
       heldSprite = spritesH.get("energyBlasterFullTR");
       size = new PVector(25,25);
       offset = new PVector(11,11);
       held = setHeld;
       price = 150;
     }  
     else if (setHeld == "magicMissleer"){
       heldSprite = spritesH.get("magicMissleerFullTR");
       size = new PVector(25,25);
       offset = new PVector(0,0);
       held = setHeld;
       price = 150;
     }  
     else if (setHeld == "wall"){
       heldSprite = spritesH.get("woodWallTW"); 
       size = new PVector(60,18.5);
       offset = new PVector(0,0);
       held = setHeld;
       price = 25;
     }
     else if (setHeld == "null"){
       held = "null";  
     }  
  }
  void place(){ //puts down tower and subtracts price
    if (held == "slingshot" && alive){
      money -= 50;
      towers.add(new Slingshot((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
      nodeCheckObs();
    }  
    else if (held == "crossbow" && alive){
      money -= 100;
      towers.add(new Crossbow((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
      nodeCheckObs();
    }  
    else if (held == "miscCannon" && alive){
      money -= 100;
      towers.add(new RandomCannon((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
      nodeCheckObs();
    }  
    else if (held == "energyBlaster" && alive){
      money -= 150;
      towers.add(new EnergyBlaster((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
      nodeCheckObs();
    }  
    else if (held == "magicMissleer" && alive){
      money -= 150;
      towers.add(new MagicMissleer((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
      nodeCheckObs();
    }
    else if (held == "wall" && alive){
      money -= 25;
      towers.add(new Wall((10*(ceil(mouseX/10)))+(60),(10*(ceil(mouseY/10)))+(18.5)));
      nodeCheckObs();
    }  
    held = "null";
  }  
}
