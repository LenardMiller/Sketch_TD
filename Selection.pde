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
    sellButton.active = true;
    towerPortrait.active = true;
  }  
  void clickoff(){
    if (towers.size() < id+1){
      name = "null";
      sellButton.active = false;
      towerPortrait.active = false;
    }  
    else{
      Tower tower = towers.get(id);
      if (mousePressed && mouseX < 700 && (mouseX > tower.position.x || mouseX < tower.position.x-tower.size.x || mouseY > tower.position.y || mouseY < tower.position.y-tower.size.y) && alive){
        name = "null";
        sellButton.active = false;
        towerPortrait.active = false;
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
    rect(700,211,200,644);
    textAlign(CENTER); 
    fill(0);
    textFont(TFFont);
    if (tower.name == "slingshot"){
      text("Slingshot", 800, 241);
      turret = true;
      damage = 10;
      speed = 12;
      towerPortrait.sprite = towerPortrait.portraits[0];
    }  
    else if (tower.name == "crossbow"){
      text("Crossbow", 800, 241);
      turret = true;
      damage = 20;
      speed = 24;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Piercing",710,526 + x);
      fill(0);
      towerPortrait.sprite = towerPortrait.portraits[1];
    }  
    else if (tower.name == "randomCannon"){
      text("Random", 800, 241);
      text("Cannon", 800, 266);
      x = 25;
      turret = true;
      speed = 12;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Random projectiles",710,526 + x);
      text("Poison/fire/water",710,546 + x);
      fill(0);
      towerPortrait.sprite = towerPortrait.portraits[2];
    }  
    else if (tower.name == "woodWall"){
      text("Wooden", 800, 241);
      text("Wall", 800, 266);
      x = 25;
      turret = false;
      towerPortrait.sprite = towerPortrait.portraits[15];
    }  
    else if (tower.name == "devWall"){
      text("Developer", 800, 241);
      text("Wall", 800, 266);
      x = 25;
      turret = false;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Invulnerable",710,446 + x);
      fill(0);
      towerPortrait.sprite = towerPortrait.portraits[30];
    }  
    if (x == 25){
      towerPortrait.position.y = 288;
    }  
    else{
      towerPortrait.position.y = 263;
    }  
    fill(255,25);
    stroke(255);
    rect(tower.position.x-tower.size.x,tower.position.y-tower.size.y,tower.size.x,tower.size.y);
    fill(75,0,0);
    textFont(TFFont);
    textAlign(CENTER);
    text("sell for: $" + tower.value, 800, 888);
    fill(0);
    textFont(ETFont);
    textAlign(LEFT);
    text("Health: " + tower.twHP + "/" + tower.maxHP, 710, 426 + x);
    if (turret){
      if (name == "randomCannon"){
        text("Damage: 6/10/22", 710, 446 + x);
        text("Low/medium acc.", 710, 506 + x);
      }
      else{
        text("Damage: " + damage, 710, 446 + x);
        if (tower.error < 1){
          text("High accuracy", 710, 506 + x);
        }  
        else if (tower.error >= 1 && tower.error <= 3){
          text("Medium accuracy", 710, 506 + x);
        }  
        else if (tower.error > 3){
          text("Low accuracy", 710, 506 + x);
        }  
      }
      if (speed < 8){
          text("Low velocity", 710, 466 + x);
        }  
        else if (speed >= 8 && speed <= 18){
          text("Medium velocity", 710, 466 + x);
        }  
        else if (speed > 18){
          text("High velocity", 710, 466 + x);
        }  
      if (tower.delay > 3500){
          text("Low firerate", 710, 486 + x);
        }  
        else if (tower.delay <= 3500 && tower.delay >= 1500){
          text("Medium firerate", 710, 486 + x);
        }  
        else if (tower.delay < 1500){
          text("High firerate", 710, 486 + x);
        }    
    }  
  }  
}  
