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
    for (int i = towers.size()-1; i >= 0; i--){
      Tower tower = towers.get(i);
      tower.visualize = false;
    }
    this.id = id;
    Tower tower = towers.get(id);
    name = tower.name;
    sellButton.active = true;
    upgradeButtonOne.active = true;
    upgradeIconOne.active = true;
    if (tower.turret){
      targetButton.active = true;
      repairButton.active = false;
      tower.visualize = true;
      upgradeButtonZero.active = true;
      upgradeButtonOne.position.y = 735;
      upgradeButtonZero.position.y = 585;
      upgradeIconZero.active = true;
      upgradeIconZero.position.y = 565;
      upgradeIconOne.position.y = 715;
      if (tower.nextLevelZero < tower.upgradeNames.length/2){
        upgradeIconZero.sprite = tower.upgradeIcons[tower.nextLevelZero];
      }
      else{
        upgradeIconZero.sprite = spritesAnimH.get("upgradeIC")[0];
      }
      if (tower.nextLevelOne < tower.upgradeNames.length){
        upgradeIconOne.sprite = tower.upgradeIcons[tower.nextLevelOne];
      }
      else{
        upgradeIconOne.sprite = spritesAnimH.get("upgradeIC")[0];
      }
    }
    if (tower.name == "magicMissleer" || tower.name == "magicMissleerFour"){
      targetButton.active = false;  
      upgradeButtonOne.position.y += 45;
      upgradeButtonZero.position.y += 45;
      upgradeIconZero.position.y += 45;
      upgradeIconOne.position.y += 45;
    }  
    if (!tower.turret){
      targetButton.active = false;
      repairButton.active = true;
      upgradeButtonZero.active = false;
      upgradeButtonOne.position.y = 630;
      upgradeIconZero.active = false;
      upgradeIconOne.position.y = 610;
      if (tower.nextLevelOne < tower.upgradeNames.length){
        upgradeIconOne.sprite = tower.upgradeIcons[tower.nextLevelOne];
      }
      else{
        upgradeIconOne.sprite = spritesAnimH.get("upgradeIC")[0];
      }
    }
  }
  void clickoff(){ //desselect, hide stuff
    Tower tower = towers.get(id);
    if (towers.size() < id+1){
      name = "null";
      sellButton.active = false;
      targetButton.active = false;
      repairButton.active = false;
      upgradeButtonZero.active = false;
      upgradeButtonOne.active = false;
      upgradeIconZero.active = false;
      upgradeIconOne.active = false;
      tower.visualize = false;
    }
    else{
      //idk
      if (mousePressed && mouseX < 700 && (mouseX > tower.position.x || mouseX < tower.position.x-tower.size.x || mouseY > tower.position.y || mouseY < tower.position.y-tower.size.y) && alive){
        name = "null";
        sellButton.active = false;
        targetButton.active = false;
        repairButton.active = false;
        upgradeButtonZero.active = false;
        upgradeButtonOne.active = false;
        upgradeIconZero.active = false;
        upgradeIconOne.active = false;
        tower.visualize = false;
      }
    }
  }
  void display(){
    Tower tower = towers.get(id);
    int speed = 0;
    int x = 0;
    String priority = "first";

    //bg
    fill(235);
    noStroke();
    if (tower.turret){ //different size bg so buttons fit
      rect(700,210,200,300);
    }
    if (tower.name == "magicMissleer" || tower.name == "magicMissleerFour"){
      rect(700,210,200,345);
    }  
    if (!tower.turret){
      rect(700,210,200,345);
    }

    //name and special features
    textAlign(CENTER);
    fill(0);
    textFont(TFFont);
    if (tower.name == "slingshot"){
      text("Slingshot", 800, 241);
      speed = 12;
    }
    else if (tower.name == "crossbow"){
      text("Crossbow", 800, 241);
      speed = 24;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Piercing",710,376 + x);
      fill(0);
    }
    else if (tower.name == "miscCannon"){
      text("Random", 800, 241);
      text("Cannon", 800, 266);
      x = 25;
      speed = 12;
      textFont(ETFont);
      textAlign(LEFT);
      fill(0);
    }
    if (tower.name == "energyBlaster"){
      text("Energy Blaster", 800, 241);
      speed = 16;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Splash damage",710,376 + x);
      fill(0);
    }
    if (tower.name == "magicMissleer"){
      text("Magic Missileer", 800, 241);
      speed = 5;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Three homing missiles",710,376 + x);
      text("First, last and strong",710,396 + x);
    }
    if (tower.name == "magicMissleerFour"){
      text("Magic Missileer", 800, 241);
      speed = 5;
      textFont(ETFont);
      textAlign(LEFT);
      fill(100,0,200);
      text("Four homing missiles",710,376 + x);
      text("First, last, strong",710,396 + x);
      text("and random",710,416 + x);
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
      text("Titanium", 800, 241);
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
    if (tower.turret && tower.name != "magicMissleer" && tower.name != "magicMissleerFour"){
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

    //upgrade Zero
    int y = 0;
    if (tower.turret){ //only display if turret
      if (tower.turret){
        y = -45;
      }
      if (tower.name == "magicMissleer" || tower.name == "magicMissleerFour"){
        y += 45;  
      }  
      if (tower.nextLevelZero < tower.upgradeNames.length/2){
        if (money >= tower.upgradePrices[tower.nextLevelZero]){
          fill(11,56,0);
        }
        else{
          fill(75,0,0);
        }
        textFont(TFFont);
        text(tower.upgradeTitles[tower.nextLevelZero], 800, 585+y);
        text("$" + tower.upgradePrices[tower.nextLevelZero], 800, 693+y);
        textFont(ETFont);
        textAlign(LEFT);
        text(tower.upgradeDescOne[tower.nextLevelZero],715,615+y);
        text(tower.upgradeDescTwo[tower.nextLevelZero],715,635+y);
        text(tower.upgradeDescThree[tower.nextLevelZero],715,655+y);
      }
      else{
        fill(15);
        textFont(TFFont);
        text("N/A", 800, 585+y);
        textFont(ETFont);
        textAlign(LEFT);
        text("No more",715,615+y);
        text("upgrades",715,635+y);
      }
    }
    //upgrade One
    y = 0;
    if (tower.turret){
      y = 105;
    }
    if (tower.name == "magicMissleer" || tower.name == "magicMissleerFour"){
      y += 45;  
    }  
    if (tower.nextLevelOne < tower.upgradeNames.length){
      if (money >= tower.upgradePrices[tower.nextLevelOne]){
        fill(11,56,0);
      }
      else{
        fill(75,0,0);
      }
      textFont(TFFont);
      textAlign(CENTER);
      text(tower.upgradeTitles[tower.nextLevelOne], 800, 585+y);
      text("$" + tower.upgradePrices[tower.nextLevelOne], 800, 693+y);
      textFont(ETFont);
      textAlign(LEFT);
      text(tower.upgradeDescOne[tower.nextLevelOne],715,615+y);
      text(tower.upgradeDescTwo[tower.nextLevelOne],715,635+y);
      text(tower.upgradeDescThree[tower.nextLevelOne],715,655+y);
    }
    else{
      fill(15);
      textFont(TFFont);
      text("N/A", 800, 585+y);
      textFont(ETFont);
      textAlign(LEFT);
      text("No more",715,615+y);
      text("upgrades",715,635+y);
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
      //damage
      text("Damage: " + tower.damage, 710, 296 + x);
      //firerate (delay)
      text("Load time: " + float(round(float(tower.delay)/6))/10 + "s", 710, 316 + x);
      //accuracy (error)
      if (tower.error == 0){
        text("Perfect accuracy", 710, 336 + x);
      }  
      else if (tower.error > 0 && tower.error < 1){
        text("High accuracy", 710, 336 + x);
      }
      else if (tower.error >= 1 && tower.error <= 3){
        text("Medium accuracy", 710, 336 + x);
      }
      else if (tower.error > 3){
        text("Low accuracy", 710, 336 + x);
      }
      //velocity
      if (speed < 8){
        text("Low velocity", 710, 356 + x);
      }
      else if (speed >= 8 && speed <= 18){
        text("Medium velocity", 710, 356 + x);
      }
      else if (speed > 18){
        text("High velocity", 710, 356 + x);
      }
    }
  }
}  
