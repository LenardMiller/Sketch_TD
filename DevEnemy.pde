class DevEnemy extends Enemy{
  DevEnemy(float x, float y) {
    super(x,y);
    size = new PVector(40,40);
    radius = 20;
    maxSpeed = 0.5;
    speed = maxSpeed;
    dangerLevel = 9999;
    maxHp = 9999;
    enHp = maxHp;
    hitTime = 0;
    barTrans = 0;
    sprite = spritesH.get("devEn");
    hitParticle = "pinkOuch";
  }  
  @Override
  void enMain(ArrayList<Enemy> enemies, int i){
    boolean dead = false;
    enHp = maxHp;
    move(i);
    display();
    collideTW();
    swapPoints(false);
    if (position.y - size.y > boardHeight){ //if enemy crosses edge of screen, enExit
      enExit(); 
      dead = true;
    }  
    if (enHp <= 0){ //if health is 0, die
      money += dangerLevel;
      dead = true;
    }  
    if (dead){
      int num = round(random(3,5));
      for (int j = num; j >= 0; j--){
        particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "greyPuff"));
      }
      enemies.remove(i);
    }  
  }  
  void hit(){
    barTrans = 255;
    tintColor = 0;
    int num = round(random(1,3));
    for (int i = num; i >= 0; i--){ //pink splatter
      particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "pinkOuch"));
    }
  } 
  void display(){ //hpBar behaves like that of towers
    if (tintColor < 255){
      tintColor += 20;
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
  void enExit(){ //enemy leave
    if ((redSpeed - dangerLevel) > 1){ //red fast if room
      redSpeed -= dangerLevel;
    }
    else if (redSpeed > 1){ //red slow if room, else don't red
      redSpeed--;
    }
    Hp = 0;
    backRed = 255; //reset red
    alive = false;
    redSpeed = 0;
  } 
  void HpText(){ //displays "unlimited"
    text("unlimited", position.x, position.y + size.y/2 + 12);
  }  
  void HpBar(){
    fill(255,0,255,barTrans);
    if (barTrans > 0 && enHp > maxHp/2){
      barTrans--;
    }
    noStroke();
    rect(position.x-size.x, position.y+size.y/2 + 12, (2*size.x)*(((float) enHp)/((float) maxHp)), 6);
  }  
}  
