Enemy enemy;
ArrayList<Enemy> enemies;
Tower tower;
ArrayList<Tower> towers;
Projectile projectile;
ArrayList<Projectile> projectiles;
int backRed = 25;
int redSpeed = 8;
float enSize;
float enSpeed;
int enHP;
PFont f;
PFont g;
int HP = 200;
boolean alive = true;
int money = 6000;

void setup(){
  size(700, 900);
  //creates ArrayLists
  enemies = new ArrayList<Enemy>();
  towers = new ArrayList<Tower>();
  projectiles = new ArrayList<Projectile>();
  //loads font
  f = createFont("STHeitiSC-Light", 24);
  g = createFont("STHeitiSC-Light", 12);
}

void draw(){
  //bg (TODO: put in own function)
  noStroke();
  fill(backRed,25,25);
  rect(0, 0, width, height);
  backRed -= redSpeed;
  //keys
  debugKeys();
  twSpawnKeys();
  //self explanitory
  drawObjects(enemies,projectiles,towers);
  //bg part 2 (TODO: put in own function)
  if (backRed < 25 ){
        backRed = 25;
        redSpeed = 8;
  }
  //text
  textAlign(LEFT);
  drawType(10);
}

void drawObjects(ArrayList <Enemy> enemies, ArrayList<Projectile> projectiles, ArrayList<Tower> towers){ 
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
}  

void drawType(float x) {
  fill(255);
  textFont(f);
  textAlign(LEFT); //debug related stuff
  text("enemies: " + enemies.size(), x, 30);
  text("towers: " + towers.size(), x, 60);
  text("projectiles: " + projectiles.size(), x, 90);
  text("X: " + int(mouseX) + " Y: " + int(mouseY), x, 120);
  textAlign(RIGHT); //gameplay related stuff
  text("HP: " + HP, width - x, 30);
  text("$" + money, width - x, 60);
  textFont(g);
  textAlign(CENTER);
  //enemy health, jump to enemy.HPText
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
  
  //kill all projectiles: h
  if (keyPressed == true && key == 'h' && alive){
    projectiles = new ArrayList <Projectile>();
  }
  
  //heal player: f
  if (keyPressed == true && key == 'f' && alive){
    HP += 10;
  }
  
  //give money: g
  if (keyPressed == true && key == 'g' && alive){
    money += 10;
  }
  
  //spam null enemies: a
  if (keyPressed == true && key == 'a' && alive){
    enemies.add(new Enemy(mouseX, mouseY));
  }  
}  

void twSpawnKeys(){
  //create wood wall
  if (keyPressed == true && key == 'z' && alive){
    if (money >= 15){
      stroke(139,69,19);
      fill(139,69,19,100);
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
  //create slingshot
  if (keyPressed == true && key == 'c' && alive){
    if (money >= 50){
      stroke(42,42,42);
      fill(42, 42, 42, 100);
      ellipse((10*(round(mouseX/10))), (10*(round(mouseY/10)))-25, 50, 50);
    }
    else{
      stroke(255,0,0);
      fill(255,0,0,100);
      ellipse((10*(round(mouseX/10))), (10*(round(mouseY/10)))-25, 50, 50);
    } 
  }
  //create crossbow
  if (keyPressed == true && key == 'v' && alive){
    if (money >= 100){
      stroke(55,33,9);
      fill(33, 33, 9, 100);
      ellipse((10*(round(mouseX/10))), (10*(round(mouseY/10)))-25, 50, 50);
    }
    else{
      stroke(255,0,0);
      fill(255,0,0,100);
      ellipse((10*(round(mouseX/10))), (10*(round(mouseY/10)))-27, 54, 54);
    } 
  }
}  

void keyReleased() { 
  //tower form: spawn x, spawn y
  if (key == 'z' && money >= 15 && alive){ //wood wall
    money -= 15;
    towers.add(new WoodWall(10*(round(mouseX/10))+60, 10*(round(mouseY/10))));
  }  
  if (key == 'x' && alive){ //cheaty wall
    towers.add(new DevWall(10*(round(mouseX/10))+60, 10*(round(mouseY/10))));
  }
  if (key == 'c' && money >= 50 && alive){ //slingshot
      money -= 50;
      towers.add(new Slingshot(10*(round(mouseX/10))+25, 10*(round(mouseY/10))));
  }  
  if (key == 'v' && money >= 100 && alive){ //crossbow
      money -= 100;
      towers.add(new Crossbow(10*(round(mouseX/10))+27, 10*(round(mouseY/10))+2));
  }
  //projectile form: spawn x, spawn y, target x, target y
  if (key == 'q' && alive){ //pebble
    projectiles.add(new Pebble(mouseX, mouseY, 0));
  }  
  if (key == 'w' && alive){ //bolt
    projectiles.add(new Bolt(mouseX, mouseY, 0));
  }  
    if (key == 'e' && alive){ //dev projectile
    projectiles.add(new DevProjectile(mouseX, mouseY, 0));
  }  
  //enemy form: spawn x, spawn y
  if (key == '1' && alive){ //dev enemy
    enemies.add(new DevEnemy(mouseX,mouseY));
  }  
}  
