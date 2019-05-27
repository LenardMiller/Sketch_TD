class Selection{ //what tower is selected
  String name;
  int id;
  Selection(){
  }  
  void sMain(){
    clickoff();
    if (name != "null"){ //don't display if nothing held
      display();
    }
  }  
  void swapSel(int id){ //switches what is selected
    this.id = id;
    Tower tower = towers.get(id);
    name = tower.name;
    sellButton.active = true;
    if (tower.turret){
      targetButton.active = true;
      repairButton.active = false; 
      upgradeButton.active = false; 
      upgradeIcon.active = false;
    }
    if (!tower.turret){
      targetButton.active = false;
      repairButton.active = true;
      upgradeButton.active = true;
      upgradeIcon.active = true;
      if (tower.nextLevel < tower.upgradeNames.length){
        upgradeIcon.sprite = tower.upgradeIcons[tower.nextLevel];
      }
      else{
        upgradeIcon.sprite = spritesAnimH.get("upgradeIC")[0];  
      }  
    }  
  }  
  void clickoff(){ //desselect, hide stuff
    if (towers.size() < id+1){
      name = "null";
      sellButton.active = false;
      targetButton.active = false;
      repairButton.active = false;
      upgradeButton.active = false;
      upgradeIcon.active = false;
    }  
    else{ 
      Tower tower = towers.get(id); //idk
      if (mousePressed && mouseX < 700 && (mouseX > tower.position.x || mouseX < tower.position.x-tower.size.x || mouseY > tower.position.y || mouseY < tower.position.y-tower.size.y) && alive){
        name = "null";
        sellButton.active = false;
        targetButton.active = false;
        repairButton.active = false;
        upgradeButton.active = false;
        upgradeIcon.active = false;
      }  
    }
  }  
  void display(){
    Tower tower = towers.get(id);
    int damage = 0;
    int speed = 0;
    int x = 0;
    String priority = "first";
    
    //bg
    fill(235);
    noStroke();
    if (tower.turret){ //different size bg so butons fit
      rect(700,210,200,600);
    }
    else{
      rect(700,210,200,345);
    }  
    
    //name and special features
    textAlign(CENTER); 
    fill(0);
    textFont(TFFont);
    if (tower.name == "slingshot"){
      text("Slingshot", 800, 241);
      damage = 10;
      speed = 12;
    }  
    else if (tower.name == "crossbow"){
      text("Crossbow", 800, 241);
      damage = 20;
      speed = 24;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Piercing",710,376 + x);
      fill(0);
    }  
    else if (tower.name == "randomCannon"){
      text("Random", 800, 241);
      text("Cannon", 800, 266);
      x = 25;
      speed = 12;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Random projectiles",710,376 + x);
      text("Poison/fire/water",710,396 + x);
      fill(0);
    }  
    else if (tower.name == "woodWall"){
      text("Wooden", 800, 241);
      text("Wall", 800, 266);
      x = 25;
    }  
    else if (tower.name == "stoneWall"){
      text("Stone", 800, 241);
      text("Wall", 800, 266);
      x = 25;
    }  
    else if (tower.name == "metalWall"){
      text("Metal", 800, 241);
      text("Wall", 800, 266);
      x = 25;
    }  
    else if (tower.name == "crystalWall"){
      text("Crystal", 800, 241);
      text("Wall", 800, 266);
      x = 25;
    }  
    else if (tower.name == "ultimateWall"){ //placeholder name?
      text("Ultimate", 800, 241);
      text("Wall", 800, 266);
      x = 25;
    } 
    else if (tower.name == "devWall"){
      text("Developer", 800, 241);
      text("Wall", 800, 266);
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Invulnerable",710,296 + 25);
      fill(0);
    }  
    
    //put box around selected
    fill(255,25);
    stroke(255);
    rect(tower.position.x-tower.size.x,tower.position.y-tower.size.y,tower.size.x,tower.size.y);
    
    //priority 
    textFont(TFFont);
    textAlign(CENTER);
    if (tower.priority == 0){
      priority = "first";
    }  
    else if (tower.priority == 1){
      priority = "last";
    }  
    else if (tower.priority == 2){
      priority = "strong";
    }  
    else if (tower.priority == 3){
      priority = "close";
    }  
    if (tower.turret){
      fill(75,45,0);
      text("Priority: " + priority, 800, 843);
    }
    
    //repair
    if (!tower.turret){
      if (tower.twHp < tower.maxHp){
        if (money >= ceil(float(tower.price) - float(tower.value))){
          fill(11,56,0);
        }
        else{
          fill(75,0,0);  
        }  
        text("$" + ceil(float(tower.price) - float(tower.value)), 800, 843);
      }
      else{
        fill(15);
      }  
      text("Repair", 800, 735);
    }  
    
    //upgrade
    if (!tower.turret){
      if (tower.nextLevel < tower.upgradeNames.length){
        if (money >= tower.upgradePrices[tower.nextLevel]){
          fill(11,56,0);
        }
        else{
          fill(75,0,0);  
        }  
        text(tower.upgradeTitles[tower.nextLevel], 800, 585);
        text("$" + tower.upgradePrices[tower.nextLevel], 800, 693);
      }
      else{
        fill(15);
        text("N/A", 800, 585);
        textFont(ETFont);
        textAlign(LEFT);
        text("No more",715,615); 
        text("upgrades",715,635);
      }  
    }  
    
    //sell
    fill(75,0,0);
    textFont(TFFont);
    textAlign(CENTER);
    text("Sell for: $" + floor(tower.value*.8), 800, 888);
    
    //health
    fill(0);
    textFont(ETFont);
    textAlign(LEFT);
    text("Health: " + tower.twHp + "/" + tower.maxHp, 710, 276 + x);
    
    //stats
    if (tower.turret){
      if (name == "randomCannon"){
        text("Damage: 6/10/22", 710, 296 + x);
        text("Low/medium acc.", 710, 356 + x);
      }
      else{
        text("Damage: " + damage, 710, 296 + x);
        if (tower.error < 1){
          text("High accuracy", 710, 356 + x);
        }  
        else if (tower.error >= 1 && tower.error <= 3){
          text("Medium accuracy", 710, 356 + x);
        }  
        else if (tower.error > 3){
          text("Low accuracy", 710, 356 + x);
        }  
      }
      if (speed < 8){
          text("Low velocity", 710, 316 + x);
        }  
        else if (speed >= 8 && speed <= 18){
          text("Medium velocity", 710, 316 + x);
        }  
        else if (speed > 18){
          text("High velocity", 710, 316 + x);
        }  
      if (tower.delay > 3500){
          text("Low firerate", 710, 336 + x);
        }  
        else if (tower.delay <= 3500 && tower.delay >= 1500){
          text("Medium firerate", 710, 336 + x);
        }  
        else if (tower.delay < 1500){
          text("High firerate", 710, 336 + x);
        }    
    }  
  }  
}  
