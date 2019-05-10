class DevWall extends Tower{
  DevWall(float x, float y) {
    super(x,y);
    name = "devWall";
    position = new PVector(x,y);
    size = new PVector(120,37);
    maxHP = 9999;
    twHP = maxHP;
    hit = false;
    sprite = spritesH.get("devWallTW");
    debrisType = "devWood";
  }
  @Override
  void collideEN(int dangerLevel){ //if it touches an enemy, animate but don't loose hp
    hit = true;
    barTrans = 255;
    int num = round(random(1,3));
    for (int i = num; i >= 0; i--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }  
  void HPText(){ //displays infinity
    text("infinity", position.x-size.x/2, position.y + size.y/4);
  } 
  void HPBar(){
    fill(255,0,255,barTrans);
    if (barTrans > 0 && twHP > maxHP/2){
      barTrans--;
    }  
    noStroke();
    rect(position.x-size.x, position.y + size.y/4, (size.x)*(((float) twHP)/((float) maxHP)), -6);
  } 
}  
