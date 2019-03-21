class Enemy {
  PVector position;
  PVector size;
  float radius;
  float maxSpeed;
  float speed = maxSpeed;
  int dangerLevel;
  int maxHP;
  int enHP;
  int hitTime;
  PImage sprite;
  int barTrans;
  int tintColor;
  
  Enemy(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(20,20);
    radius = 10;
    maxSpeed = 2.5;
    speed = maxSpeed;
    dangerLevel = 1;
    maxHP = 100;
    enHP = maxHP;
    hitTime = 0;
    sprite = loadImage("sprites/enemies/null20x20.png");
    barTrans = 0;
    tintColor = 255;
  }  
  
  void enMain(ArrayList<Enemy> enemies, int i){
    boolean dead = false;
    move();
    display();
    collideTW();
    if (position.y - size.y > height){ //if enemy crosses edge of screen, enExit
      enExit(); 
      dead = true;
    }  
    if (enHP <= 0){ //if health is 0, die
      money += dangerLevel;
      dead = true;
    }  
    if (dead){
      enemies.remove(i);
    }  
  }  
  
  void move(){ //self explanitory
    position.y += speed;
    speed = maxSpeed;
  }  
  
  void display(){
    if (tintColor < 255){
      tintColor += 20;
    }  
    tint(255,tintColor,tintColor);
    image(sprite,position.x-size.x/2,position.y-size.y/2);
    tint(255,255,255);
    if (enHP > 0){
      HPBar();
    }   
  }
  
  void collideTW(){ //when the enemy hits a tower
    for (int i = towers.size()-1; i >= 0; i--){
      Tower tower = towers.get(i);
      float dx = (tower.position.x - tower.size.x/2) - (position.x);
      float dy = (tower.position.y - tower.size.y/2) - (position.y);
      if (dy <= size.y/2 + tower.size.y/2 && dy >= -(tower.size.y/2) - size.y/2 && dx <= size.x/2 + tower.size.x/2 && dx >= -(tower.size.x/2) - size.x/2){ //if touching tower
        speed = 0;
        if (millis() > hitTime){
          hitTime = millis() + 1000;
          tower.collideEN(dangerLevel);
        }  
      }
    }  
  }  
  
  void collidePJ(int damage){ //when the enemy hits a projectile
    enHP -= damage;
    tintColor = 0;
    barTrans = 255;
  }  
  
  void enExit(){ //enemy leave
    if ((redSpeed - dangerLevel) > 1){ //red fast if room
      redSpeed -= dangerLevel;
    }
    else if (redSpeed > 1){ //red slow if room, else don't red
      redSpeed -= 1;
    }
    backRed = 255; //reset red
    HP -= (dangerLevel);
    if (HP <= 0){ //player dies
      HP = 0;
      alive = false;
      redSpeed = 0;
    }
  } 
  
  void HPText(){ //displays the enemies health
    text(enHP, position.x, position.y + size.y/2 + 12);
  }  
  
  void HPBar(){
    fill(255,0,0,barTrans);
    noStroke();
    rect(position.x-size.x, position.y+size.y/2 + 12, (2*size.x)*(((float) enHP)/((float) maxHP)), 6);
  }  
}
