class DevEnemy extends Enemy{
  DevEnemy(float x, float y) {
    super(x,y);
    size = new PVector(40,40);
    radius = 20;
    maxSpeed = 1;
    speed = maxSpeed;
    dangerLevel = 9999;
    maxHP = 9999;
    enHP = maxHP;
    hitTime = 0;
    barTrans = 0;
    sprite = loadImage("sprites/enemies/devEnemy.png");
  }  
  @Override
  void enMain(ArrayList<Enemy> enemies, int i){
    boolean dead = false;
    enHP = maxHP;
    move();
    buff(buffs);
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
      enemies.remove(i);
    }  
  }  
  void hit(){
    barTrans = 255;
    tintColor = 0;
    int num = round(random(1,3));
    for (int i = num; i >= 0; i--){
      particles.add(new Ouch(position.x+random((size.x/2)*-1,size.x/2), position.y+random((size.y/2)*-1,size.y/2), random(0,360), "pinkOuch"));
    }
  } 

  void display(){
    if (tintColor < 255){
      tintColor += 20;
    }  
    tint(255,tintColor,255);
    image(sprite,position.x-size.x/2,position.y-size.y/2);
    tint(255,255,255);
    if (enHP > 0){
      HPBar();
    }
  }
  void enExit(){ //enemy leave
    if ((redSpeed - dangerLevel) > 1){ //red fast if room
      redSpeed -= dangerLevel;
    }
    else if (redSpeed > 1){ //red slow if room, else don't red
      redSpeed--;
    }
    HP = 0;
    backRed = 255; //reset red
    alive = false;
    redSpeed = 0;
  } 
  void HPText(){ //displays "unlimited"
    text("unlimited", position.x, position.y + size.y/2 + 12);
  }  
  void HPBar(){
    fill(255,0,255,barTrans);
    if (barTrans > 0 && enHP > maxHP/2){
      barTrans--;
    }
    noStroke();
    rect(position.x-size.x, position.y+size.y/2 + 12, (2*size.x)*(((float) enHP)/((float) maxHP)), 6);
  }  
}  
