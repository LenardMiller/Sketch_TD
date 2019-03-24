Enemy enemy;
ArrayList<Enemy> enemies;
Tower tower;
ArrayList<Tower> towers;
Projectile projectile;
ArrayList<Projectile> projectiles;
Particle particle;
ArrayList<Particle> particles;
Icon icon;
ArrayList<Icon> icons;
Icon sellButton;
Hand hand;
Selection selection;
TowerPortrait towerPortrait;
int backRed = 25;
int redSpeed = 8;
float enSize;
float enSpeed;
int enHP;
PFont FEFont;
PFont TFFont;
PFont ETFont;
PFont TWFont;
int HP = 200;
boolean alive = true;
int money = 6000;
int boardWidth = 700;
int boardHeight = 900;

void setup(){
  size(900, 900);
  //creates ArrayLists
  enemies = new ArrayList<Enemy>();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
  particles = new ArrayList<Particle>();
  icons = new ArrayList<Icon>();
  hand = new Hand();
  selection = new Selection();
  //loads font (default STHeitiSC-Light)
  FEFont = createFont("STHeitiSC-Light", 48);
  TFFont = createFont("STHeitiSC-Light", 24);
  ETFont = createFont("STHeitiSC-Light", 18);
  TWFont = createFont("STHeitiSC-Light", 12);
  gui();
}

void gui(){ //gui icons & buttons
  //add money & add lives buttons
  icons.add(new AddHPButton(boardWidth + 22.5,17.5,"null"));
  icons.add(new AddMoneyButton(boardWidth + 22.5,47.5,"null"));
  //money and lives icons
  icons.add(new Icon(boardWidth + 57.5, 17.5,"lives"));
  icons.add(new Icon(boardWidth + 57.5, 47.5,"money"));
  //buy tower buttons
  icons.add(new TowerBuy(boardWidth + 21.5, 87,"slingshot")); //row 1
  icons.add(new TowerBuy(boardWidth + 60.5, 87,"crossbow"));
  icons.add(new TowerBuy(boardWidth + 101.5, 87,"randomCannon"));
  icons.add(new TowerBuy(boardWidth + 140.5, 87,"null")); //placeholders
  icons.add(new TowerBuy(boardWidth + 179.5, 87,"null"));
  icons.add(new TowerBuy(boardWidth + 21.5, 127,"null")); //row 2
  icons.add(new TowerBuy(boardWidth + 60.5, 127,"null"));
  icons.add(new TowerBuy(boardWidth + 101.5, 127,"null"));
  icons.add(new TowerBuy(boardWidth + 140.5, 127,"null"));
  icons.add(new TowerBuy(boardWidth + 179.5, 127,"null"));
  icons.add(new TowerBuy(boardWidth + 21.5, 167,"null")); //row 3
  icons.add(new TowerBuy(boardWidth + 60.5, 167,"null"));
  icons.add(new TowerBuy(boardWidth + 101.5, 167,"null"));
  icons.add(new TowerBuy(boardWidth + 140.5, 167,"null"));
  icons.add(new TowerBuy(boardWidth + 179.5, 167,"null"));
  //tower portrait
  towerPortrait = new TowerPortrait(722.5,263,"null");
  //sell tower button
  sellButton = new SellTower(800,877.5,"null");
}  

void draw(){
  //bg
  noStroke();
  fill(backRed,25,25);
  rect(0, 0, boardWidth, boardHeight);
  backRed -= redSpeed;
  //keys
  debugKeys();
  spawnKeys();
  //self explanitory
  drawObjects(enemies,projectiles,towers,particles);
  //bg part 2: red (TODO: put in own function)
  if (backRed < 25 ){
        backRed = 25;
        redSpeed = 8;
  }
  //bg part 3: gui
  noStroke();
  fill(200);
  rect(boardWidth, 0, boardWidth + 250, boardHeight);
  drawGuiObjects(towers,icons);
  //text
  textAlign(LEFT);
  drawType(10);
}

void drawGuiObjects(ArrayList<Tower> towers, ArrayList<Icon> icons){
  //sell button, jump to icMain
  if (towers.size() == 0){
    sellButton.active = false;  
    towerPortrait.active = false;
  }  
  sellButton.icMain(icons, 0);
  //currently selected, jumps to sMain
  if (towers.size() != 0){
    selection.sMain();
  }
  //tower protrait
  towerPortrait.icMain(icons, 0);
  //icons, jumps to icMain
  for (int i = icons.size()-1; i >= 0; i--){
    Icon icon = icons.get(i);
    icon.icMain(icons, i);
  }
}  

void drawObjects(ArrayList <Enemy> enemies, ArrayList<Projectile> projectiles, ArrayList<Tower> towers, ArrayList<Particle> particles){ 
  //towers, jumps to twMain
  for (int i = towers.size()-1; i >= 0; i--){
    Tower tower = towers.get(i);
    tower.twMain(towers, i);
  }
  //enemies, jumps to enMain
  for (int i = enemies.size()-1; i >= 0; i--){
    Enemy enemy = enemies.get(i);
    enemy.enMain(enemies, i);
  }   
  //projectiles, jumps to pjMain
  for (int i = projectiles.size()-1; i >= 0; i--){
    Projectile projectile = projectiles.get(i);
    projectile.pjMain(projectiles, i);
  }  
  //particles, jumps to paMain
  for (int i = particles.size()-1; i >= 0; i--){
    Particle particle = particles.get(i);
    particle.ptMain(particles, i);
  }  
  //currently held, jumps to hMain
  hand.hMain();
}  

void drawType(float x) {
  fill(255);
  textFont(TFFont);
  textAlign(LEFT); 
  //debug related stuff
  text("enemies: " + enemies.size(), x, 30);
  text("towers: " + towers.size(), x, 60);
  text("projectiles: " + projectiles.size(), x, 90);
  text("particles: " + particles.size(), x, 120);
  text("icons: " + icons.size(), x, 150);
  text("X: " + int(mouseX) + " Y: " + int(mouseY), x, boardHeight-x);
  //gameplay related stuff
  //fill(255,0,0); //red
  //text("HP", boardWidth + (x*2) + 25, 30); //replaced with heart icon
  //fill(255,225,0); //orangish-yellow
  //text("$", boardWidth + (x*2) + 25, 60); //replaced with $ icon
  textAlign(RIGHT); 
  fill(0);
  text(HP, width - x, 30);
  text(nfc(money), width - x, 60);
  if (!alive){
    textAlign(CENTER);
    textFont(FEFont);
    fill(75,0,0);
    text("Game Over", width/2, height/2);
  }  
  //textFont(TWFont); //replaced with healthbars
  //fill(255);
  //textAlign(CENTER);
  ////enemy health, jump to enemy.HPText
  //for (int i = enemies.size()-1; i >= 0; i--){
  //  Enemy enemy = enemies.get(i);
  //  enemy.HPText();
  //}
  ////tower health, jump to tower.HPText
  //for (int i = towers.size()-1; i >= 0; i--) {
  //  Tower tower = towers.get(i);
  //  tower.HPText();
  //}  
}  

void debugKeys(){
  //kill all enemies: s
  if (keyPressed == true && key == 's' && alive){
    enemies = new ArrayList <Enemy>();
  }
  
  //kill all towers: d
  if (keyPressed == true && key == 'd' && alive){
    towers = new ArrayList <Tower>();
  }
  
  //kill all projectiles: f
  if (keyPressed == true && key == 'f' && alive){
    projectiles = new ArrayList <Projectile>();
  }
  
  //spam null enemies: a
  if (keyPressed == true && key == 'a' && alive){
    enemies.add(new Enemy(mouseX, mouseY));
  }  
}  

void spawnKeys(){
  //create wood wall
  if (keyPressed == true && key == 'z' && alive){
    if (money >= 50){
      stroke(153,102,51);
      fill(153,102,51,100);
      rect((10*(round(mouseX/10)))-60, (10*(round(mouseY/10)))-37, 120, 37);
    }
    else{
      stroke(255,0,0);
      fill(255,0,0,100);
      rect((10*(round(mouseX/10)))-60, (10*(round(mouseY/10)))-37, 120, 37);
    }  
  }
  //create cheaty wall
  if (keyPressed == true && key == 'x' && alive){
    if (money >= 0){
      stroke(102,153,204);
      fill(102, 153, 204, 100);
      rect((10*(round(mouseX/10)))-60, (10*(round(mouseY/10)))-37, 120, 37);
    }
    else{
      stroke(255,0,0);
      fill(255,0,0,100);
      rect((10*(round(mouseX/10)))-60, (10*(round(mouseY/10)))-37, 120, 37);
    }  
  }
  //particle form: spawn x, spawn y, angle
  if (keyPressed == true && key == 'c' && alive){ //hurt
    int num = round(random(0,2));
    String type = "null";
    if (num == 0){
      type = "redOuch";
    } 
    else if (num == 1){
      type = "greenOuch";
    } 
    else if (num == 2){
      type = "pinkOuch";
    } 
    particles.add(new Ouch(mouseX, mouseY, random(0,360), type));
  } 
  if (keyPressed == true && key == 'v' && alive){ //die
    particles.add(new Ouch(mouseX, mouseY, random(0,360), "greyPuff"));
  }  
  if (keyPressed == true && key == 'b' && alive){ //debris
    int num = round(random(0,3));
    String type = "null";
    if (num == 0){
      type = "wood";
    } 
    else if (num == 1){
      type = "stone";
    } 
    else if (num == 2){
      type = "metal";
    } 
    else if (num == 3){
      type = "devWood";
    } 
    particles.add(new Debris(mouseX, mouseY, random(0,360), type));
  }  
  if (keyPressed == true && key == 'n' && alive){ //buff
    int num = round(random(0,2));
    String type = "null";
    if (num == 0){
      type = "poison";
    } 
    else if (num == 1){
      type = "water";
    } 
    else if (num == 2){
      type = "fire";
    } 
    particles.add(new BuffPt(mouseX, mouseY, random(0,360), type));
  } 
}  

void keyReleased() { 
  //tower form: spawn x, spawn y
  if (key == 'z' && money >= 50 && alive){ //wood wall
    money -= 50;
    towers.add(new WoodWall(10*(round(mouseX/10))+60, 10*(round(mouseY/10))));
  }  
  if (key == 'x' && alive){ //cheaty wall
    towers.add(new DevWall(10*(round(mouseX/10))+60, 10*(round(mouseY/10))));
  }
  //projectile form: spawn x, spawn y, angle
  if (key == 'q' && alive){ //pebble
    projectiles.add(new Pebble(mouseX, mouseY, 0));
  }  
  if (key == 'w' && alive){ //bolt
    projectiles.add(new Bolt(mouseX, mouseY, 0));
  }  
  if (key == 'e' && alive){ //dev projectile
    projectiles.add(new DevProjectile(mouseX, mouseY, 0));
  }  
  if (key == 'r' && alive){ //misc projectile
    projectiles.add(new MiscProjectile(mouseX, mouseY, 0, round(random(0,5))));
  } 
  if (key == 't' && alive){ //acid
    projectiles.add(new Acid(mouseX, mouseY, 0));
  } 
  if (key == 'y' && alive){ //urchin
    projectiles.add(new Urchin(mouseX, mouseY, 0));
  } 
  if (key == 'u' && alive){ //waterball
    projectiles.add(new Waterball(mouseX, mouseY, 0));
  } 
  //enemy form: spawn x, spawn y
  if (key == '1' && alive){ //dev enemy
    enemies.add(new DevEnemy(mouseX,mouseY));
  }  
}  
