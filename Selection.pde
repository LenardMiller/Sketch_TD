class Selection{
  String name;
  int id;
  Selection(){
  }  
  void sMain(){
    clickoff();
    if (name != "null"){
      display();
    }
  }  
  void swapSel(int twid){
    id = twid;
    Tower tower = towers.get(id);
    name = tower.name;
  }  
  void clickoff(){
    if (towers.size() < id+1){
      name = "null";
    }  
    else{
      Tower tower = towers.get(id);
      if (mousePressed && mouseX < 700 && (mouseX > tower.position.x || mouseX < tower.position.x-tower.size.x || mouseY > tower.position.y || mouseY < tower.position.y-tower.size.y) && alive){
        name = "null";
      }  
    }
  }  
  void display(){ //<>//
    Tower tower = towers.get(id);
    boolean turret = false;
    int damage = 0;
    int speed = 0;
    int x = 0;
    fill(235);
    noStroke();
    rect(700,211,200,707);
    textAlign(CENTER); 
    fill(0);
    textFont(TFFont);
    if (tower.name == "slingshot"){
      text("Slingshot", 800, 241);
      turret = true;
      damage = 10;
      speed = 12;
    }  
    else if (tower.name == "crossbow"){
      text("Crossbow", 800, 241);
      turret = true;
      damage = 20;
      speed = 24;
    }  
    else if (tower.name == "randomCannon"){
      text("Random", 800, 241);
      text("Cannon", 800, 266);
      x = 25;
      turret = true;
      speed = 12;
    }  
    else if (tower.name == "devWall"){
      text("Developer", 800, 241);
      text("Wall", 800, 266);
      x = 25;
      turret = false;
    }  
    else if (tower.name == "woodWall"){
      text("Wooden", 800, 241);
      text("Wall", 800, 266);
      x = 25;
      turret = false;
    }  
    textFont(ETFont);
    textAlign(LEFT);
    text("Health: " + tower.twHP + "/" + tower.maxHP, 710, 266 + x);
    if (turret){
      if (name == "randomCannon"){
        text("Damage: 6/10/10/22", 710, 286 + x);
        text("Error: 5/2/2/2°", 710, 346 + x);
      }
      else{
        text("Damage: " + damage, 710, 286 + x);
        text("Error: " + (int) tower.error + "°", 710, 346 + x);
      }
      text("Projectile Speed: " + speed, 710, 306 + x);
      text("Delay: " + ((float) round(((float) tower.delay/1000)*10))/10 + "s", 710, 326 + x);
    }  
  }  
}  
