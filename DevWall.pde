class DevWall extends Tower{
  DevWall(float x, float y) {
    super(x,y);
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 9999;
    twHP = maxHP;
    hit = false;
    sprite = loadImage("sprites/towers/walls/devWall.png");
    spriteHit = loadImage("sprites/towers/walls/devWallHit.png");
  }
  @Override
  void collideEN(int dangerLevel){ //if it touches an enemy, animate but don't loose hp
    hit = true;
    barTrans = 255;
  }  
  void HPBar(){
    fill(255,0,255,barTrans);
    if (barTrans > 0 && twHP > maxHP/2){
      barTrans -= 1;
    }  
    noStroke();
    rect(position.x-size.x, position.y + size.y/4, (size.x)*(((float) twHP)/((float) maxHP)), -6);
  } 
  void HPText(){ //displays infinity
    text("infinity", position.x-size.x/2, position.y + size.y/4);
  } 
}  
