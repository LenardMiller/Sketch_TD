class Hand{ //what is selected, eg: slingshot
  String held;
  PImage heldSprite;
  PVector size;
  boolean implaceable;
  int price;
  Hand(){
    held = "null";
    size = new PVector(25,25);
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
      image(heldSprite,(10*(ceil(mouseX/10)))-(size.x),(10*(ceil(mouseY/10)))-(size.y));
      tint(255);
    }  
  }
  void setHeld(String setHeld){ //swaps whats held
     if (setHeld == "slingshot"){
       heldSprite = spritesH.get("slingshotFullTR");
       size = new PVector(25,25);
       held = setHeld;
       price = 50;
     }  
     else if (setHeld == "crossbow"){
       heldSprite = spritesH.get("crossbowFullTR");
       size = new PVector(27,27);
       held = setHeld;
       price = 100;
     }  
     else if (setHeld == "randomCannon"){
       heldSprite = spritesH.get("randomCannonFullTR");
       size = new PVector(25,25);
       held = setHeld;
       price = 100;
     }  
     else if (setHeld == "woodWall"){
       heldSprite = spritesH.get("woodWallTW"); 
       size = new PVector(60,18.5);
       held = setHeld;
       price = 25;
     }  
     else if (setHeld == "stoneWall"){
       heldSprite = spritesH.get("stoneWallTW");
       size = new PVector(60,18.5);
       held = setHeld;
       price = 75;
     }  
     else if (setHeld == "metalWall"){
       heldSprite = spritesH.get("metalWallTW");
       size = new PVector(60,18.5);
       held = setHeld;
       price = 175;
     }  
     else if (setHeld == "crystalWall"){
       heldSprite = spritesH.get("crystalWallTW");
       size = new PVector(60,18.5);
       held = setHeld;
       price = 400;
     }  
     else if (setHeld == "null"){
       held = "null";  
     }  
  }
  void place(){ //puts down tower and subtracts price
    if (held == "slingshot" && alive){
      money -= 50;
      towers.add(new Slingshot((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
    }  
    else if (held == "crossbow" && alive){
      money -= 100;
      towers.add(new Crossbow((10*(ceil(mouseX/10)))+(27),(10*(ceil(mouseY/10)))+(27)));
    }  
    else if (held == "randomCannon" && alive){
      money -= 100;
      towers.add(new RandomCannon((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
    }  
    else if (held == "woodWall" && alive){
      money -= 25;
      towers.add(new WoodWall((10*(ceil(mouseX/10)))+(60),(10*(ceil(mouseY/10)))+(18.5)));
    }  
    else if (held == "stoneWall" && alive){
      money -= 75;
      towers.add(new StoneWall((10*(ceil(mouseX/10)))+(60),(10*(ceil(mouseY/10)))+(18.5)));
    }  
    else if (held == "metalWall" && alive){
      money -= 175;
      towers.add(new MetalWall((10*(ceil(mouseX/10)))+(60),(10*(ceil(mouseY/10)))+(18.5)));
    }  
    else if (held == "crystalWall" && alive){
      money -= 400;
      towers.add(new CrystalWall((10*(ceil(mouseX/10)))+(60),(10*(ceil(mouseY/10)))+(18.5)));
    }
    held = "null";
  }  
}
