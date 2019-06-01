class Tower {
  String name;
  float angle;
  int delay;
  float error;
  PVector position;
  PVector size;
  int maxHp;
  int twHp;
  int damage;
  boolean hit;
  PImage sprite;
  int barTrans;
  int tintColor;
  String debrisType;
  int price;
  int value;
  boolean turret;
  boolean visualize;
  int priority;
  int nextLevel;
  boolean[] upgradeSpecial;
  int[] upgradePrices;
  int[] upgradeHealth;
  int[] upgradeDamage;
  int[] upgradeDelay;
  float[] upgradeError;
  String[] upgradeNames;
  String[] upgradeDebris;
  String[] upgradeTitles;
  String[] upgradeDescOne;
  String[] upgradeDescTwo;
  String[] upgradeDescThree;
  PImage[] upgradeIcons;
  PImage[] upgradeSprites;
  Tower(float x, float y) {
    name = "null";
    position = new PVector(x, y);
    size = new PVector(120, 37);
    delay = 0;
    error = 0;
    this.maxHp = 1;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("nullWallTW");
    barTrans = 255;
    tintColor = 255;
    debrisType = "null";
    price = 0;
    value = price;
    turret = false;
    visualize = false;
    nextLevel = 0;
    upgradeSpecial = new boolean[4];
    upgradeDamage = new int[4];
    upgradeDelay = new int[4];
    upgradePrices = new int[4];
    upgradeHealth = new int[4];
    upgradeError = new float[4];
    upgradeNames = new String[4];
    upgradeDescOne = new String[4];
    upgradeDescTwo = new String[4];
    upgradeDescThree = new String[4];
    upgradeDebris = new String[4];
    upgradeTitles = new String[4];
    upgradeIcons = new PImage[4];
    upgradeSprites = new PImage[4];
    setUpgrades();
  }  
  void setUpgrades(){
    //special
    upgradeSpecial[0] = false;
    upgradeSpecial[1] = false;
    upgradeSpecial[2] = false;
    upgradeSpecial[3] = false;
    //damage
    upgradeDamage[0] = 0;
    upgradeDamage[1] = 0;
    upgradeDamage[2] = 0;
    upgradeDamage[3] = 0;
    //delay (firerate)
    upgradeDelay[0] = 0;
    upgradeDelay[1] = 0;
    upgradeDelay[2] = 0;
    upgradeDelay[3] = 0;
    //price
    upgradePrices[0] = 50;
    upgradePrices[1] = 100;
    upgradePrices[2] = 225;
    upgradePrices[3] = 500;
    //heath
    upgradeHealth[0] = 75;
    upgradeHealth[1] = 125;
    upgradeHealth[2] = 250;
    upgradeHealth[3] = 500;
    //error (accuracy)
    upgradeError[0] = 0;
    upgradeError[1] = 0;
    upgradeError[2] = 0;
    upgradeError[3] = 0;
    //names
    upgradeNames[0] = "stoneWall";
    upgradeNames[1] = "metalWall";
    upgradeNames[2] = "crystalWall";
    upgradeNames[3] = "ultimateWall";
    //debris
    upgradeDebris[0] = "stone";
    upgradeDebris[1] = "metal";
    upgradeDebris[2] = "crystal";
    upgradeDebris[3] = "dev";
    //titles
    upgradeTitles[0] = "stone";
    upgradeTitles[1] = "metal";
    upgradeTitles[2] = "crystal";
    upgradeTitles[3] = "ultimate";
    //desc line one
    upgradeDescOne[0] = "+75 HP";
    upgradeDescOne[1] = "+100 HP";
    upgradeDescOne[2] = "+225 HP";
    upgradeDescOne[3] = "+500 HP";
    //desc line two
    upgradeDescTwo[0] = "";
    upgradeDescTwo[1] = "";
    upgradeDescTwo[2] = "";
    upgradeDescTwo[3] = "";
    //desc line three
    upgradeDescThree[0] = "";
    upgradeDescThree[1] = "";
    upgradeDescThree[2] = "";
    upgradeDescThree[3] = "";
    //icons
    upgradeIcons[0] = spritesAnimH.get("upgradeIC")[1];
    upgradeIcons[1] = spritesAnimH.get("upgradeIC")[2];
    upgradeIcons[2] = spritesAnimH.get("upgradeIC")[3];
    upgradeIcons[3] = spritesAnimH.get("upgradeIC")[4];
    //sprites
    upgradeSprites[0] = spritesH.get("stoneWallTW");
    upgradeSprites[1] = spritesH.get("metalWallTW");
    upgradeSprites[2] = spritesH.get("crystalWallTW");
    upgradeSprites[3] = spritesH.get("ultimateWallTW");
  }  
  void twMain(ArrayList<Tower> towers, int i){
    if (twHp <= 0){
       die(i);
       towers.remove(i);
    }  
    value = floor((float(twHp)/float(maxHp))*price);
    if (mousePressed && mouseX < position.x && mouseX > position.x-size.x && mouseY < position.y && mouseY > position.y-size.y && alive){ //clicked on
      selection.swapSel(i);
    }
    display();
  }  
  void display(){;   
    if (hit){ //change to red if under attack
      tintColor = 0;
      hit = false;
    } 
    tint(255,tintColor,tintColor);
    image(sprite,position.x-size.x,position.y-size.y);
    tint(255);
    if (twHp > 0){ //no inverted bars
      HpBar();
    }
    if (tintColor < 255){
      tintColor += 20;  
    }  
  }
  
  void collideEN(int dangerLevel){ //if it touches an enemy, animate and loose health
    twHp -= dangerLevel;
    hit = true;
    barTrans = 255;
    int num = floor(random(1,4));
    for (int i = num; i >= 0; i--){ //spray debris
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }  
  
  void upgrade(){
    price += upgradePrices[nextLevel];
    maxHp += upgradeHealth[nextLevel];
    twHp += upgradeHealth[nextLevel];
    name = upgradeNames[nextLevel];
    debrisType = upgradeDebris[nextLevel];
    sprite = upgradeSprites[nextLevel];
    if (nextLevel < upgradeNames.length){
      nextLevel++;
    }
    if (nextLevel < upgradeNames.length){
      upgradeIcon.sprite = upgradeIcons[nextLevel];
    }
    else{
      upgradeIcon.sprite = spritesAnimH.get("upgradeIC")[0]; 
    }  
    int num = floor(random(30,50)); //shower debris
    for (int j = num; j >= 0; j--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }  
  
  void die(int i){
    int num = floor(random(30,50)); //shower debris
    for (int j = num; j >= 0; j--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
    if (selection.id > i){
      selection.id--;
    }
    if (selection.id == i){
      selection.id = 0;
    }  
  }
  
  void HpText(){ //displays the towers health
    text(twHp, position.x-size.x/2, position.y + size.y/4);
  }
  
  void HpBar(){ //displays the towers health with style
    fill(0,255,0,barTrans); 
    if (barTrans > 0 && twHp > maxHp/2){ //after hit or if below 50%
      barTrans--;
    }  
    noStroke();
    rect(position.x-size.x, position.y + size.y/4, (size.x)*(((float) twHp)/((float) maxHp)), -6);
  }  
}  
