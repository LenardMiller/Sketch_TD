class Enemy {
  ArrayList<TurnPoint> points;
  PVector position;
  PVector size;
  float angle;
  float radius;
  float maxSpeed;
  float speed = maxSpeed;
  float mpNegation;
  int dangerLevel;
  int twDamage;
  int maxHp;
  int enHp;
  PImage sprite;
  PImage sIdle;
  PImage[] attackFrames;
  PImage[] moveFrames;
  float moveFrame;
  int attackFrame;
  boolean attacking;
  int numAttackFrames;
  int numMoveFrames;
  int startFrame;
  int barTrans;
  int tintColor;
  String hitParticle;
  String name;
  Enemy(float x, float y) {
    points = new ArrayList<TurnPoint>();
    position = new PVector(x, y);
    size = new PVector(20,20);
    angle = 0;
    radius = 10;
    maxSpeed = 1;
    speed = maxSpeed;
    dangerLevel = 1;
    twDamage = 1;
    maxHp = 20; //Hp <---------------------------
    enHp = maxHp;
    barTrans = 0;
    tintColor = 255;
    hitParticle = "redOuch";
    name = "null";
    numAttackFrames = 1;
    numMoveFrames = 1;
    attackFrame = startFrame;
    startFrame = 0;
    loadSprites();
  }  
  
  void enMain(ArrayList<Enemy> enemies, int i){
    boolean dead = false; //if its gotten this far, it must be alive?
    swapPoints(false);
    collideTW();
    if (!attacking){
      move(i);
    }
    display();
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
  
  void move(int i){
    PVector m = PVector.fromAngle(angle);
    m.setMag(speed);
    position.add(m);
    if (points.size() != 0){
      PVector p = points.get(points.size()-1).position;
      boolean intersecting = false;
      intersecting = (position.x > p.x && position.x < p.x+nSize+size.x) && (position.y > p.y && position.y < p.y+nSize+size.y);
      if (intersecting && points.size() != 0){
        swapPoints(true);
      } 
    }
    speed = maxSpeed;
  } 
  
  void requestPath(int i){
    path.reqQ.add(new PathRequest(i,enemies.get(i)));
  }  
  
  void swapPoints(boolean remove){
    if (remove){
      points.remove(points.size()-1);  
    }  
    if (points.size() != 0){
      PVector p = points.get(points.size()-1).position;
      p = new PVector(p.x+(nSize/2),p.y+(nSize/2));
      angle = findAngle(p,position);
    }
  }  
  
  void preDisplay(){
    if (attacking){
      sprite = attackFrames[attackFrame];
      if (attackFrame < numAttackFrames-1){
        attackFrame += 1;  
      }  
      else {
        attackFrame = 0;
      }  
    }
    else{
      sprite = moveFrames[floor(moveFrame)];
      if (moveFrame < numMoveFrames-1){
        moveFrame += speed;
      }  
      else{
        moveFrame = 0;  
      }  
    }
    if (tintColor < 255){ //shift back to normal
      tintColor += 20;
    }  
  }  
  
  void display(){
    preDisplay();
    if (pathLines){
      for (int i = points.size()-1; i > 0; i--){
        points.get(i).display();  
      }
    }
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle);
    image(sprite,-size.x/2,-size.y/2);
    popMatrix();
    if (enHp > 0){
      HpBar();
    }
  }
  
  void collideTW(){ //when the enemy hits a tower
    boolean ak = false;
    for (int i = towers.size()-1; i >= 0; i--){
      Tower tower = towers.get(i);
      float dx = (tower.position.x - tower.size.x/2) - (position.x);
      float dy = (tower.position.y - tower.size.y/2) - (position.y);
      if (dy <= size.y/2 + tower.size.y/2 && dy >= -(tower.size.y/2) - size.y/2 && dx <= size.x/2 + tower.size.x/2 && dx >= -(tower.size.x/2) - size.x/2){ //if touching tower
        attacking = true;
        ak = true;
        moveFrame = 0;
        if (attackFrame == numAttackFrames-1){ //enemy only attacks when punch
          tower.collideEN(twDamage);
        }  
      }
    }
    if (!ak && attackFrame == startFrame){
      attacking = false;
      attackFrame = startFrame;
    }  
  }  
  
  void collidePJ(int damage, String pjBuff, int i){ //when the enemy hits a projectile
    enHp -= damage;
    if (pjBuff == "poison"){ //applies buffs
      if (buffs.size() > 0);{
        for (int j = buffs.size()-1; j >= 0; j--){
          Buff buff = buffs.get(j);
          if (buff.particle == "poison" && buff.enId == i){
            buffs.remove(j);  
          }  
        }  
      }
      buffs.add(new Poisoned(i));
    }
    if (pjBuff == "wet"){
      if (buffs.size() > 0);{
        for (int j = buffs.size()-1; j >= 0; j--){
          Buff buff = buffs.get(j);
          if (buff.particle == "water" && buff.enId == i){
            buffs.remove(j);  
          }  
        }  
      }
      buffs.add(new Wet(i));
    }
    if (pjBuff == "burning"){
      if (buffs.size() > 0);{
        for (int j = buffs.size()-1; j >= 0; j--){
          Buff buff = buffs.get(j);
          if (buff.particle == "fire" && buff.enId == i){
            buffs.remove(j);  
            
          }  
        }  
      } 
      buffs.add(new Burning(i));
    }
    barTrans = 255;
    tintColor = 0;
    int num = floor(random(1,3));
    for (int j = num; j >= 0; j--){ //sprays ouch
      particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), hitParticle));
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
  
  void loadSprites(){
    sIdle = spritesH.get("nullEN");
    attackFrames = spritesAnimH.get(name+"AttackEN");
    moveFrames = spritesAnimH.get(name+"MoveEN");
  }
}
class TurnPoint{ //pathfinding
  PVector position;
  TurnPoint(PVector position){
    this.position = new PVector(position.x,position.y);
  }  
  void display(){
    fill(255);
    ellipse(position.x+nSize/2,position.y+nSize/2,nSize,nSize);
  } 
} 
