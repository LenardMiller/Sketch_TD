class Hand{
  String held;
  PImage heldSprite;
  PVector size;
  boolean intersecting;
  Hand(){
    held = "null";
    size = new PVector(25,25);
    intersecting = false;
  }  
  void hMain(){
    checkPlaceable();
    displayHeld();
    if (mousePressed == true && !intersecting){
      place();
    }  
  }  
  void checkPlaceable(){
    if (!((10*(ceil(mouseX/10))) <= boardWidth-(size.x) && (10*(ceil(mouseX/10))) >= (size.x) && (10*(ceil(mouseY/10))) <= boardHeight-(size.y) && (10*(ceil(mouseY/10))) >= (size.y))){
      intersecting = true;
    }  
    else{
      intersecting = false;  
    }  
    for (int i = towers.size()-1; i >= 0; i--){
      Tower tower = towers.get(i);
      float dx = (tower.position.x - tower.size.x/2) - (10*(ceil(mouseX/10)));
      float dy = (tower.position.y - tower.size.y/2) - (10*(ceil(mouseY/10)));
      if (dy < size.y + tower.size.y/2 && dy > -(tower.size.y/2) - size.y && dx < size.x + tower.size.x/2 && dx > -(tower.size.x/2) - size.x){ //if touching tower
        intersecting = true;
      }
    }  
  }  
  void displayHeld(){
    if (held != "null" && alive){
      if (intersecting){
        tint(255, 0, 0, 150);
      }  
      else{
        tint(255,150);  
      }  
      image(heldSprite,(10*(ceil(mouseX/10)))-(size.x),(10*(ceil(mouseY/10)))-(size.y));
      tint(255);
    }  
  }
  void setHeld(String setHeld){
     if (setHeld == "slingshot"){
       heldSprite = loadImage("sprites/towers/turrets/slingshot/full.png");
       size = new PVector(25,25);
       held = setHeld;
     }  
     else if (setHeld == "crossbow"){
       heldSprite = loadImage("sprites/towers/turrets/crossbow/full.png");
       size = new PVector(27,27);
       held = setHeld;
     }  
     else if (setHeld == "randomCannon"){
       heldSprite = loadImage("sprites/towers/turrets/miscCannon/full.png");
       size = new PVector(25,25);
       held = setHeld;
     }  
     else if (setHeld == "woodWall"){
       heldSprite = loadImage("sprites/towers/walls/woodWall.png");
       size = new PVector(60,18.5);
       held = setHeld;
     }  
     else if (setHeld == "null"){
       held = "null";  
     }  
  }
  void place(){
    if (held == "slingshot" && money >= 50 && alive){
      money -= 50;
      towers.add(new Slingshot((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
    }  
    else if (held == "crossbow" && money >= 100 && alive){
      money -= 100;
      towers.add(new Crossbow((10*(ceil(mouseX/10)))+(27),(10*(ceil(mouseY/10)))+(27)));
    }  
    else if (held == "randomCannon" && money >= 100 && alive){
      money -= 100;
      towers.add(new RandomCannon((10*(ceil(mouseX/10)))+(25),(10*(ceil(mouseY/10)))+(25)));
    }  
    else if (held == "woodWall" && money >= 50 && alive){
      money -= 50;
      towers.add(new WoodWall((10*(ceil(mouseX/10)))+(60),(10*(ceil(mouseY/10)))+(18.5)));
    }  
  }  
}
