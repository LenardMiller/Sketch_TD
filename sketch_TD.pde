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
  //ArrayList<Integer> buffEffectTimers;
  //ArrayList<Integer> buffTimers;
  //ArrayList<Integer> buffDurations;
  //ArrayList<String> buffs;
  Enemy(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(20,20);
    radius = 10;
    maxSpeed = 2.5;
    speed = maxSpeed;
    dangerLevel = 1;
    maxHP = 100; //HP <---------------------------
    enHP = maxHP;
    hitTime = 0;
    sprite = spritesH.get("nullEn");
    barTrans = 0;
    tintColor = 255;
    //buffEffectTimers = new ArrayList<Integer>();
    //buffTimers = new ArrayList<Integer>();
    //buffDurations = new ArrayList<Integer>();
    //buffs = new ArrayList<String>();
  }  
  
  void enMain(ArrayList<Enemy> enemies, int i){
    boolean dead = false;
    move();
    //buff(buffs);
    display();
    collideTW();
    if (position.y - size.y > boardHeight){ //if enemy crosses edge of screen, enExit
      enExit(); 
      dead = true;
    }  
    if (enHP <= 0){ //if health is 0, die
      money += dangerLevel;
      dead = true;
    }  
    if (dead){
      int num = round(random(3,5));
      for (int j = num; j >= 0; j--){
        particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "greyPuff"));
      }
      for (int j = 0; j < buffs.size()-1; j++){
        Buff buff = buffs.get(j);
        if (buff.enId == i){
          buffs.remove(j);  
        }  
        if (buff.enId > i){
          buff.enId -= 1;
        }
      }  
      enemies.remove(i);
    }  
  }  
  
  void move(){ //self explanitory
    position.y += speed;
    speed = maxSpeed;
  }  
  
  //void buff(ArrayList<String> buffs){
  //  for (int i = buffs.size()-1; i >= 0; i--){
  //    if (buffs.get(i) == "poison"){
  //      int num = round(random(0,8));
  //      if (num == 0){
  //        particles.add(new BuffPt(position.x+2.5+random((size.x/2)*-1,(size.x/2)), position.y+2.5+random((size.x/2)*-1,(size.x/2)), random(0,360), "poison")); 
  //      }
  //      if (millis() - buffEffectTimers.get(i) >= 1000){
  //        tintColor = 0;
  //        barTrans = 255;
  //        enHP -= 3;
  //        num = round(random(1,3));
  //        for (int j = num; j >= 0; j--){
  //          particles.add(new Ouch(position.x+2.5+random((size.x/2)*-1,(size.x/2)), position.y+2.5+random((size.x/2)*-1,(size.x/2)), random(0,360), "greenOuch"));
  //        }
  //        buffEffectTimers.set(i,millis() + 1000);
  //      }
  //    }  
  //    if (buffs.get(i) == "burning"){
  //      int num = round(random(0,4));
  //      if (num == 0){
  //        particles.add(new BuffPt(position.x+2.5+random((size.x/2)*-1,(size.x/2)), position.y+2.5+random((size.x/2)*-1,(size.x/2)), random(0,360), "fire")); 
  //      }
  //      if (millis() - buffEffectTimers.get(i) >= 200){
  //        if (tintColor > 100){
  //          tintColor = 100;  
  //        }  
  //        barTrans = 255;
  //        enHP--;
  //        num = round(random(0,3));
  //        if (num == 0){
  //          particles.add(new Ouch(position.x+2.5+random((size.x/2)*-1,(size.x/2)), position.y+2.5+random((size.x/2)*-1,(size.x/2)), random(0,360), "redOuch"));
  //        }  
  //        buffEffectTimers.set(i,millis() + 200);
  //      }
  //    }  
  //    if (buffs.get(i) == "wet"){
  //      int num = round(random(0,8));
  //      if (num == 0){
  //        particles.add(new BuffPt(position.x+2.5+random((size.x/2)*-1,(size.x/2)), position.y+2.5+random((size.x/2)*-1,(size.x/2)), random(0,360), "water")); 
  //      }
  //    }  
  //    if (millis() - buffTimers.get(i) >= buffDurations.get(i)){
  //      buffs.remove(i);
  //      buffEffectTimers.remove(i);
  //      buffTimers.remove(i);
  //      buffDurations.remove(i);
  //    }   
  //  }  
  //}  
  
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
  
  void hit(){
    barTrans = 255;
    tintColor = 0;
    int num = round(random(1,3));
    for (int i = num; i >= 0; i--){
      particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "redOuch"));
    }
  }  
  
  void collidePJ(int damage, String pjBuff){ //when the enemy hits a projectile
    enHP -= damage;
    //boolean hasPoison = false;
    //boolean hasWet = false;
    //boolean hasBurning = false;
    //for (int i = buffs.size()-1; i >= 0; i--){
    //  if (buffs.get(i) == "poison"){
    //    hasPoison = true;
    //  }
    //  if (buffs.get(i) == "wet"){
    //    hasWet = true;
    //  }
    //  if (buffs.get(i) == "burning"){
    //    hasBurning = true;
    //  }
    //}  
    //if (pjBuff == "poison" && !hasPoison){
    //  buffs.add(pjBuff);
    //  buffDurations.add(10000);
    //  buffEffectTimers.add(millis() + 1000);
    //  buffTimers.add(millis() + 10000);
    //}  
    //if (pjBuff == "wet" && !hasWet){
    //  if (hasBurning){
    //    for (int j = buffs.size()-1; j >= 0; j--){
    //      if (buffs.get(j) == "burning"){
    //         buffs.remove(j); 
    //      }  
    //    }
    //  }  
    //  buffs.add(pjBuff);
    //  buffDurations.add(2500);
    //  buffEffectTimers.add(millis() + 1000);
    //  buffTimers.add(millis() + 2500);
    //}  
    //if (pjBuff == "burning" && !hasBurning && !hasWet){
    //  buffs.add(pjBuff);
    //  int num = round(random(2500,15000));
    //  buffDurations.add(num);
    //  buffEffectTimers.add(millis() + 200);
    //  buffTimers.add(millis() + num);
    //}  
    hit();
  }  
  
  void enExit(){ //enemy leave
    if ((redSpeed - dangerLevel) > 1){ //red fast if room
      redSpeed -= dangerLevel;
    }
    else if (redSpeed > 1){ //red slow if room, else don't red
      redSpeed--;
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
