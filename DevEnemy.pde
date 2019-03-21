class DevEnemy extends Enemy{
  DevEnemy(float x, float y) {
    super(x,y);
    size = new PVector(40,40);
    radius = 10;
    maxSpeed = 1;
    speed = maxSpeed;
    dangerLevel = 9999;
    maxHP = 9999;
    enHP = maxHP;
    hitTime = 0;
    sprite = loadImage("sprites/enemies/devEnemy.png");
  }  
  @Override
  void collidePJ(int damage){ //when the enemy hits a projectile, do nothing
    barTrans = 255;
    tintColor = 0;
  }  
  void enExit(){ //enemy leave
    if ((redSpeed - dangerLevel) > 1){ //red fast if room
      redSpeed -= dangerLevel;
    }
    else if (redSpeed > 1){ //red slow if room, else don't red
      redSpeed -= 1;
    }
    HP = 0;
    backRed = 255; //reset red
    alive = false;
    redSpeed = 0;
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
  void HPBar(){
    fill(255,0,255,barTrans);
    if (barTrans > 0 && enHP > maxHP/2){
      barTrans -= 1;
    } 
    noStroke();
    rect(position.x-size.x, position.y+size.y/2 + 12, (2*size.x)*(enHP/maxHP), 6);
  }  
  void HPText(){ //displays "unlimited"
    text("unlimited", position.x, position.y + size.y/2 + 12);
  }  
}  
