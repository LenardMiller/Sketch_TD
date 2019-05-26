class Tower {
  String name;
  float angle;
  int delay;
  float error;
  PVector position;
  PVector size;
  int maxHp;
  int twHp;
  boolean hit;
  PImage sprite;
  int barTrans;
  int tintColor;
  String debrisType;
  int price;
  int value;
  boolean turret;
  int priority;
  Tower(float x, float y) {
    name = "null";
    position = new PVector(x, y);
    size = new PVector(120, 37);
    delay = 0;
    error = 0;
    this.maxHp = 1;
    twHp = maxHp;
    hit = false;
    sprite = spritesH.get("nullWallTW");
    barTrans = 255;
    tintColor = 255;
    debrisType = "null";
    price = 0;
    value = price;
    turret = false;
  }  
  
  void twMain(ArrayList<Tower> towers, int i){
    if (twHp <= 0){
       die();
       towers.remove(i);
    }  
    value = floor((float(twHp)/float(maxHp))*price);
    if (mousePressed && mouseX < position.x && mouseX > position.x-size.x && mouseY < position.y && mouseY > position.y-size.y && alive){ //clicked on
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
    if (twHp > 0){ //no inverted bars
      HpBar();
    }
    if (tintColor < 255){
      tintColor += 20;  
    }  
  }
  
  void collideEN(int dangerLevel){ //if it touches an enemy, animate and loose health
    twHp -= dangerLevel;
    hit = true;
    barTrans = 255;
    int num = floor(random(1,4));
    for (int i = num; i >= 0; i--){ //spray debris
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }  
  
  void die(){
    int num = floor(random(30,50)); //shower debris
    for (int i = num; i >= 0; i--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }
  
  void HpText(){ //displays the towers health
    text(twHp, position.x-size.x/2, position.y + size.y/4);
  }
  
  void HpBar(){ //displays the towers health with style
    fill(0,255,0,barTrans); 
    if (barTrans > 0 && twHp > maxHp/2){ //after hit or if below 50%
      barTrans--;
    }  
    noStroke();
    rect(position.x-size.x, position.y + size.y/4, (size.x)*(((float) twHp)/((float) maxHp)), -6);
  }  
}  
