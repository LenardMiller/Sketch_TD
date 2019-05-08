import java.util.Map;

Enemy enemy;
ArrayList<Enemy> enemies;
EnemyTracker enTrak;
Tower tower;
ArrayList<Tower> towers;
Projectile projectile;
ArrayList<Projectile> projectiles;
Particle particle;
ArrayList<Particle> particles;
Icon icon;
ArrayList<Icon> icons;
Icon towerTabButton;
Icon sellButton;
Icon targetButton;
Icon repairButton;
Hand hand;
Selection selection;
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
//images
HashMap<String,PImage> spritesH = new HashMap<String,PImage>();
HashMap<String,PImage[]> spritesAnimH = new HashMap<String,PImage[]>();

void settings(){
  size(900, 900);
}  

void setup(){
  //creates ArrayLists
  enemies = new ArrayList<Enemy>();
  enTrak = new EnemyTracker();
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
  loadSprites();
  loadSpritesAnim();
  gui();
}

void loadSprites(){
  spritesH.put("devEn",loadImage("sprites/enemies/dev.png"));
  spritesH.put("nullEn",loadImage("sprites/enemies/null.png"));
  spritesH.put("livesIc",loadImage("sprites/icons/lives.png"));
  spritesH.put("moneyIc",loadImage("sprites/icons/money.png"));
  spritesH.put("nullIc",loadImage("sprites/icons/null.png"));
  spritesH.put("crystalPt",loadImage("sprites/particles/debris/crystal.png"));
  spritesH.put("devWoodPt",loadImage("sprites/particles/debris/devWood.png"));
  spritesH.put("metalPt",loadImage("sprites/particles/debris/metal.png"));
  spritesH.put("stonePt",loadImage("sprites/particles/debris/stone.png"));
  spritesH.put("woodPt",loadImage("sprites/particles/debris/wood.png"));
  spritesH.put("nullPt",loadImage("sprites/particles/null/null.png"));
  spritesH.put("acidPj",loadImage("sprites/projectiles/acid.png"));
  spritesH.put("boltPj",loadImage("sprites/projectiles/bolt.png"));
  spritesH.put("devPj",loadImage("sprites/projectiles/dev.png"));
  spritesH.put("nullPj",loadImage("sprites/projectiles/null.png"));
  spritesH.put("pebblePj",loadImage("sprites/projectiles/pebble.png"));
  spritesH.put("urchinPj",loadImage("sprites/projectiles/urchin.png"));
  spritesH.put("waterballPj",loadImage("sprites/projectiles/waterball.png"));
  spritesH.put("crossbowBaseTR",loadImage("sprites/towers/turrets/crossbow/base.png"));
  spritesH.put("crossbowFullTR",loadImage("sprites/towers/turrets/crossbow/full.png"));
  spritesH.put("crossbowIdleTR",loadImage("sprites/towers/turrets/crossbow/idle.png"));
  spritesH.put("miscCannonBaseTR",loadImage("sprites/towers/turrets/miscCannon/base.png"));
  spritesH.put("miscCannonFullTR",loadImage("sprites/towers/turrets/miscCannon/full.png"));
  spritesH.put("miscCannonIdleTR",loadImage("sprites/towers/turrets/miscCannon/idle.png"));
  spritesH.put("slingshotBaseTR",loadImage("sprites/towers/turrets/slingshot/base.png"));
  spritesH.put("slingshotFullTR",loadImage("sprites/towers/turrets/slingshot/full.png"));
  spritesH.put("slingshotIdleTR",loadImage("sprites/towers/turrets/slingshot/idle.png"));
  spritesH.put("crystalWallTW",loadImage("sprites/towers/walls/crystal.png"));
  spritesH.put("devWallTW",loadImage("sprites/towers/walls/dev.png"));
  spritesH.put("metalWallTW",loadImage("sprites/towers/walls/metal.png"));
  spritesH.put("nullWallTW",loadImage("sprites/towers/walls/null.png"));
  spritesH.put("stoneWallTW",loadImage("sprites/towers/walls/stone.png"));
  spritesH.put("woodWallTW",loadImage("sprites/towers/walls/wood.png"));
  spritesH.put("slingshotFullTR",loadImage("sprites/towers/turrets/slingshot/full.png"));
  spritesH.put("slingshotIdleTR",loadImage("sprites/towers/turrets/slingshot/idle.png"));
  spritesH.put("slingshotBaseTR",loadImage("sprites/towers/turrets/slingshot/base.png"));
  spritesH.put("crossbowFullTR",loadImage("sprites/towers/turrets/crossbow/full.png"));
  spritesH.put("crossbowIdleTR",loadImage("sprites/towers/turrets/crossbow/idle.png"));
  spritesH.put("crossbowBaseTR",loadImage("sprites/towers/turrets/crossbow/base.png"));
  spritesH.put("randomCannonFullTR",loadImage("sprites/towers/turrets/miscCannon/full.png"));
  spritesH.put("randomCannonIdleTR",loadImage("sprites/towers/turrets/miscCannon/idle.png"));
  spritesH.put("randomCannonBaseTR",loadImage("sprites/towers/turrets/miscCannon/base.png"));
}  

void loadSpritesAnim(){
  spritesAnimH.put("livesAddBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("livesAddBT")[i] = loadImage("sprites/icons/buttons/livesAdd/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("moneyAddBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("moneyAddBT")[i] = loadImage("sprites/icons/buttons/moneyAdd/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("nullBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("nullBT")[i] = loadImage("sprites/icons/buttons/null/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("repairBT",new PImage[4]);
  for (int i = 3; i >= 0; i--){
    spritesAnimH.get("repairBT")[i] = loadImage("sprites/icons/buttons/repairButton/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("sellTowerBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("sellTowerBT")[i] = loadImage("sprites/icons/buttons/sellTower/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("targetPriorityBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("targetPriorityBT")[i] = loadImage("sprites/icons/buttons/targetPriority/" + nf(i,3) + ".png");
  }  
  //spritesAnimH.put("towerBuyBT",new PImage[2]);
  //for (int i = 1; i >= 0; i--){
  //  spritesAnimH.get("towerBuyBT")[i] = loadImage("sprites/icons/buttons/towerBuy/" + nf(i,3) + ".png");
  //}  
  spritesAnimH.put("towerTabSwitchBT",new PImage[2]);
  for (int i = 1; i >= 0; i--){
    spritesAnimH.get("towerTabSwitchBT")[i] = loadImage("sprites/icons/buttons/towerTabSwitch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("fireBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("fireBuffPT")[i] = loadImage("sprites/particles/buff/fire/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("poisonBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("poisonBuffPT")[i] = loadImage("sprites/particles/buff/poison/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("waterBuffPT",new PImage[8]);
  for (int i = 7; i >= 0; i--){
    spritesAnimH.get("waterBuffPT")[i] = loadImage("sprites/particles/buff/water/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("greenOuchEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("greenOuchEnemyPT")[i] = loadImage("sprites/particles/enemy/greenOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("greyPuffEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("greyPuffEnemyPT")[i] = loadImage("sprites/particles/enemy/greyPuff/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("pinkOuchEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("pinkOuchEnemyPT")[i] = loadImage("sprites/particles/enemy/pinkOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("redOuchEnemyPT",new PImage[11]);
  for (int i = 10; i >= 0; i--){
    spritesAnimH.get("redOuchEnemyPT")[i] = loadImage("sprites/particles/enemy/redOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("miscPJ",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("miscPJ")[i] = loadImage("sprites/particles/enemy/greenOuch/" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("slingshotFireTR",new PImage[34]);
  for (int i = 33; i >= 0; i--){
    spritesAnimH.get("slingshotFireTR")[i] = loadImage("sprites/towers/turrets/slingshot/fire/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("slingshotLoadTR",new PImage[59]);
  for (int i = 58; i >= 0; i--){
    spritesAnimH.get("slingshotLoadTR")[i] = loadImage("sprites/towers/turrets/slingshot/load/load" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("crossbowFireTR",new PImage[13]);
  for (int i = 12; i >= 0; i--){
    spritesAnimH.get("crossbowFireTR")[i] = loadImage("sprites/towers/turrets/crossbow/fire/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("crossbowLoadTR",new PImage[81]);
  for (int i = 58; i >= 0; i--){
    spritesAnimH.get("crossbowLoadTR")[i] = loadImage("sprites/towers/turrets/crossbow/load/load" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("randomCannonFireAcidTR",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("randomCannonFireAcidTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/acid/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("randomCannonFireMiscTR",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("randomCannonFireMiscTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/misc/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("randomCannonFireUrchinTR",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("randomCannonFireUrchinTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/urchin/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("randomCannonFireWaterTR",new PImage[6]);
  for (int i = 5; i >= 0; i--){
    spritesAnimH.get("randomCannonFireWaterTR")[i] = loadImage("sprites/towers/turrets/miscCannon/fire/water/fire" + nf(i,3) + ".png");
  }  
  spritesAnimH.put("randomCannonLoadTR",new PImage[34]);
  for (int i = 33; i >= 0; i--){
    spritesAnimH.get("randomCannonLoadTR")[i] = loadImage("sprites/towers/turrets/miscCannon/load/load" + nf(i,3) + ".png");
  }  
}  

void gui(){ //gui icons & buttons
  //add money & add lives buttons
  icons.add(new AddHPButton(boardWidth + 22.5,17.5,"null",true));
  icons.add(new AddMoneyButton(boardWidth + 22.5,47.5,"null",true));
  //money and lives icons
  icons.add(new Icon(boardWidth + 57.5, 17.5,"livesIc",true));
  icons.add(new Icon(boardWidth + 57.5, 47.5,"moneyIc",true));
  //buy tower buttons tab 1 (4-18)
  icons.add(new TowerBuy(boardWidth + 21.5, 87,"slingshot",false)); //row 1
  icons.add(new TowerBuy(boardWidth + 60.5, 87,"crossbow",false));
  icons.add(new TowerBuy(boardWidth + 101.5, 87,"randomCannon",false));
  icons.add(new TowerBuy(boardWidth + 140.5, 87,"null",false)); //placeholders
  icons.add(new TowerBuy(boardWidth + 179.5, 87,"null",false));
  icons.add(new TowerBuy(boardWidth + 21.5, 127,"null",false)); //row 2
  icons.add(new TowerBuy(boardWidth + 60.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 101.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 140.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 179.5, 127,"null",false));
  icons.add(new TowerBuy(boardWidth + 21.5, 167,"null",false)); //row 3
  icons.add(new TowerBuy(boardWidth + 60.5, 167,"null",false));
  icons.add(new TowerBuy(boardWidth + 101.5, 167,"null",false));
  icons.add(new TowerBuy(boardWidth + 140.5, 167,"null",false));
  icons.add(new TowerBuy(boardWidth + 179.5, 167,"null",false));
  //buy tower buttons tab 2 (19-33)
  icons.add(new TowerBuy(boardWidth + 21.5, 87,"woodWall",true)); //row 1
  icons.add(new TowerBuy(boardWidth + 60.5, 87,"stoneWall",true));
  icons.add(new TowerBuy(boardWidth + 101.5, 87,"metalWall",true)); 
  icons.add(new TowerBuy(boardWidth + 140.5, 87,"crystalWall",true)); 
  icons.add(new TowerBuy(boardWidth + 179.5, 87,"null",true)); //placeholders
  icons.add(new TowerBuy(boardWidth + 21.5, 127,"null",true)); //row 2
  icons.add(new TowerBuy(boardWidth + 60.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 101.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 140.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 179.5, 127,"null",true));
  icons.add(new TowerBuy(boardWidth + 21.5, 167,"null",true)); //row 3
  icons.add(new TowerBuy(boardWidth + 60.5, 167,"null",true));
  icons.add(new TowerBuy(boardWidth + 101.5, 167,"null",true));
  icons.add(new TowerBuy(boardWidth + 140.5, 167,"null",true));
  icons.add(new TowerBuy(boardWidth + 179.5, 167,"null",true));
  //switch tower tab button
  towerTabButton = new TowerTabButton(800,198,"null",true);
  //sell tower button
  sellButton = new SellTower(800,877.5,"null",false);
  //target priority button
  targetButton = new TargetPriority(800,832.5,"null",false);
  //repair wall button
  repairButton = new RepairWall(800,780,"null",false);
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
  if (towers.size() == 0){ //force deactivation if no towers
    sellButton.active = false;  
    targetButton.active = false;
    repairButton.active = false;
  }  
  //switch tower tab button, jumps to ucMain
  towerTabButton.icMain(icons, 0);
  //sell button, jumps to icMain
  sellButton.icMain(icons, 0);
  //target priority button, jumps to icMain
  targetButton.icMain(icons, 0);
  //repair wall button, jumps to icMain
  repairButton.icMain(icons, 0);
  //currently selected, jumps to sMain
  if (towers.size() != 0){
    selection.sMain();
  }
  //icons, jumps to icMain
  for (int i = icons.size()-1; i >= 0; i--){
    Icon icon = icons.get(i);
    icon.icMain(icons, i);
  }
}  

void drawObjects(ArrayList <Enemy> enemies, ArrayList<Projectile> projectiles, ArrayList<Tower> towers, ArrayList<Particle> particles){ 
  //enemy tracker, jumps to entMain
  enTrak.entMain(enemies);
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
  text("X: " + int(mouseX) + " Y: " + int(mouseY), x, boardHeight-x);
  //gameplay related stuff
  //fill(255,0,0); //red
  //text("HP", boardWidth + (x*2) + 25, 30); //replaced with heart icon
  //fill(255,225,0); //orangish-yellow
  //text("$", boardWidth + (x*2) + 25, 60); //replaced with $ icon
  textAlign(RIGHT); 
  text(round(frameRate) + " fps", boardWidth - x, 30);
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
  //create cheaty wall
  if (keyPressed == true && key == 'l' && alive){
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
  if (keyPressed == true && key == 'z' && alive){ //hurt
    int num = round(random(0,2));
    String type = "redOuch";
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
  if (keyPressed == true && key == 'x' && alive){ //die
    particles.add(new Ouch(mouseX, mouseY, random(0,360), "greyPuff"));
  }  
  if (keyPressed == true && key == 'c' && alive){ //debris
    int num = round(random(0,4));
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
      type = "crystal";
    } 
    else if (num == 4){
      type = "devWood";
    } 
    particles.add(new Debris(mouseX, mouseY, random(0,360), type));
  }  
  if (keyPressed == true && key == 'v' && alive){ //buff
    int num = round(random(0,2));
    String type = "poison";
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
  if (key == 'l' && alive){ //cheaty wall
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
  if (key == '0' && alive){ //null enemy
    enemies.add(new Enemy(mouseX,mouseY));
  }  
}  
