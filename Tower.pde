class Tower {
  String name;
  float angle;
  int delay;
  float error;
  PVector position;
  PVector size;
  int maxHP;
  int twHP;
  boolean hit;
  PImage sprite;
  PImage spriteHit;
  int barTrans;
  int tintColor;
  String debrisType;
  Tower(float x, float y) {
    name = "null";
    position = new PVector(x, y);
    size = new PVector(120, 37);
    delay = 0;
    error = 0;
    this.maxHP = 1;
    twHP = maxHP;
    hit = false;
    sprite = loadImage("sprites/towers/walls/null120x37.png");
    spriteHit = sprite;
    barTrans = 255;
    tintColor = 255;
    debrisType = "null";
  }  
  
  void twMain(ArrayList<Tower> towers, int i){
    if (twHP <= 0){
       die();
       towers.remove(i);
    }  
    if (mousePressed && mouseX < position.x && mouseX > position.x-size.x && mouseY < position.y && mouseY > position.y-size.y && alive){
      selection.swapSel(i);
    }
    display();
  }  
  void display(){;   
    if (hit){ //change to red if under attack
      tintColor = 0;
      hit = false;
    } 
    tint(255,tintColor,tintColor);
    image(sprite,position.x-size.x,position.y-size.y);
    tint(255);
    if (twHP > 0){
      HPBar();
    }
    if (tintColor < 255){
      tintColor += 20;  
    }  
  }
  
  void collideEN(int dangerLevel){ //if it touches an enemy, animate and loose health
    twHP -= dangerLevel;
    hit = true;
    barTrans = 255;
    int num = round(random(1,3));
    for (int i = num; i >= 0; i--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }  
  
  void die(){
    int num = round(random(30,50));
    for (int i = num; i >= 0; i--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }
  
  void HPText(){ //displays the towers health
    text(twHP, position.x-size.x/2, position.y + size.y/4);
  }
  
  void HPBar(){
    fill(0,255,0,barTrans);
    if (barTrans > 0 && twHP > maxHP/2){
      barTrans--;
    }  
    noStroke();
    rect(position.x-size.x, position.y + size.y/4, (size.x)*(((float) twHP)/((float) maxHP)), -6);
  }  
}  
