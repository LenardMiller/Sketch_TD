class Enemy {
  PVector position;
  PVector size;
  float radius;
  float maxSpeed;
  float speed = maxSpeed;
  int dangerLevel;
  int maxHp;
  int enHp;
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
    maxHp = 20; //Hp <---------------------------
    enHp = maxHp;
    hitTime = 0;
    sprite = spritesH.get("nullEn");
    barTrans = 0;
    tintColor = 255;
  }  
  
  void enMain(ArrayList<Enemy> enemies, int i){
    boolean dead = false; //if its gotten this far, it must be alive?
    move();
    display();
    collideTW();
    if (position.y - size.y > boardHeight){ //if enemy crosses edge of screen, enExit
      enExit(); 
      dead = true;
    }  
    if (enHp <= 0){ //if health is 0, die
      money += dangerLevel;
      dead = true;
    }  
    if (dead){
      die(i);
    }  
  }
  
  void die(int i){
    int num = floor(random(2,5));
    for (int j = num; j >= 0; j--){ //creates death particles
      particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "greyPuff"));
    }
    for (int j = buffs.size()-1; j >= 0; j--){ //deals with buffs
      Buff buff = buffs.get(j);
      if (buff.enId == i){ //if attached, remove
        buffs.remove(j);  
      }  
      else if (buff.enId > i){ //shift ids to compensate for enemy removal 
        buff.enId -= 1;
      }
    }  
    enemies.remove(i);
  }  
  
  void move(){ //self explanitory
    position.y += speed;
    speed = maxSpeed;
  }  
  
  void display(){
    if (tintColor < 255){ //shift back to normal
      tintColor += 20;
    }  
    tint(255,tintColor,tintColor);
    image(sprite,position.x-size.x/2,position.y-size.y/2);
    tint(255,255,255);
    if (enHp > 0){
      HpBar();
    }
  }
  
  void collideTW(){ //when the enemy hits a tower
    for (int i = towers.size()-1; i >= 0; i--){
      Tower tower = towers.get(i);
      float dx = (tower.position.x - tower.size.x/2) - (position.x);
      float dy = (tower.position.y - tower.size.y/2) - (position.y);
      if (dy <= size.y/2 + tower.size.y/2 && dy >= -(tower.size.y/2) - size.y/2 && dx <= size.x/2 + tower.size.x/2 && dx >= -(tower.size.x/2) - size.x/2){ //if touching tower
        speed = 0;
        if (frameCount > hitTime){ //enemy only attacks every second
          hitTime = frameCount + 60;
          tower.collideEN(dangerLevel);
        }  
      }
    }  
  }  
  
  void collidePJ(int damage, String pjBuff, int i){ //when the enemy hits a projectile
    enHp -= damage;
    if (pjBuff == "poison"){ //applies buffs
      if (buffs.size() > 0);{
        for (int j = buffs.size()-1; j >= 0; j--){
          Buff buff = buffs.get(j);
          if (buff.particle == "poison" && buff.enId == i){
            buffs.remove(i);  
          }  
        }  
      }
      buffs.add(new Poisoned(i));
    }
    if (pjBuff == "wet"){
      if (buffs.size() > 0);{
        for (int j = buffs.size()-1; j >= 0; j--){
          Buff buff = buffs.get(j);
          if (buff.particle == "wet" && buff.enId == i){
            buffs.remove(i);  
          }  
        }  
      }
      buffs.add(new Wet(i));
    }
    if (pjBuff == "burning"){
      if (buffs.size() > 0);{
        for (int j = buffs.size()-1; j >= 0; j--){
          Buff buff = buffs.get(j);
          if (buff.particle == "burning" && buff.enId == i){
            buffs.remove(i);  
          }  
        }  
      } 
      buffs.add(new Burning(i));
    }
    barTrans = 255;
    tintColor = 0;
    int num = floor(random(2,5));
    for (int j = num; j >= 0; j--){ //sprays ouch
      particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "redOuch"));
    }
  }  
  
  void enExit(){ //enemy leave
    if ((redSpeed - dangerLevel) > 1){ //red fast if room
      redSpeed -= dangerLevel;
    }
    else if (redSpeed > 1){ //red slow if room, else don't red
      redSpeed--;
    }
    backRed = 255; //reset red
    Hp -= (dangerLevel);
    if (Hp <= 0){ //player dies
      Hp = 0;
      alive = false;
      redSpeed = 0;
    }
  } 
  
  void HpText(){ //displays the enemies health
    text(enHp, position.x, position.y + size.y/2 + 12);
  }  
  
  void HpBar(){ //pretty simple
    fill(255,0,0,barTrans);
    noStroke();
    rect(position.x-size.x, position.y+size.y/2 + 12, (2*size.x)*(((float) enHp)/((float) maxHp)), 6);
  }  
}
