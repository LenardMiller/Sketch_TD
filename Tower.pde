class Tower {
  PVector position;
  PVector size;
  int protectionLevel;
  int maxHP;
  int twHP;
  boolean hit;
  PImage sprite;
  PImage spriteHit;
  int barTrans;
  int tintColor;
  
  Tower(float x, float y) {
    position = new PVector(x, y);
    size = new PVector(120, 37);
    this.maxHP = 1;
    twHP = maxHP;
    hit = false;
    sprite = loadImage("sprites/towers/walls/null120x37.png");
    spriteHit = sprite;
    barTrans = 255;
    tintColor = 255;
  }  
  
  void twMain(ArrayList<Tower> towers, int i){
    if (twHP <= 0){
       die();
       towers.remove(i);
    }  
    display();
  }  
  
  void display(){;   
  if (hit){ //change to red if under attack
      tintColor = 0;
      hit = false;
    }  
    if (tintColor < 255){
      tintColor += 20;  
    }  
    tint(255,tintColor,tintColor);
    image(sprite,position.x-size.x,position.y-size.y);
    tint(255);
    if (twHP > 0){
      HPBar();
    }
  }
  
  void collideEN(int dangerLevel){ //if it touches an enemy, animate and loose health
    twHP -= dangerLevel;
    hit = true;
    barTrans = 255;
  }  
  
  void die(){ //left blank so stuff can happen later
    
  }
  
  void HPText(){ //displays the towers health
    text(twHP, position.x-size.x/2, position.y + size.y/4);
  }
  
  void HPBar(){
    fill(0,255,0,barTrans);
    if (barTrans > 0 && twHP > maxHP/2){
      barTrans -= 1;
    }  
    noStroke();
    rect(position.x-size.x, position.y + size.y/4, (size.x)*(((float) twHP)/((float) maxHP)), -6);
  }  
}  
