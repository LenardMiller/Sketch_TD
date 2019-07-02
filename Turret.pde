class Turret extends Tower{
  PImage sBase;
  PImage sIdle;
  PVector ratio;
  int targetEn;
  int delayTime;
  int pjSpeed;
  int numFireFrames;
  int numLoadFrames;
  PImage[] fireFrames;
  PImage[] loadFrames;
  String spriteLocation;
  int spriteType;
  int frame;
  float loadDelay;
  float loadDelayTime;
  ArrayList<Integer> spriteArray;
  Turret(float x, float y) {
    super(x,y);
    name = "null";
    position = new PVector(x,y);
    size = new PVector(50,50);
    maxHp = 20;
    twHp = maxHp;
    hit = false;
    delay = 240;
    delayTime = delay;
    pjSpeed = 2;
    error = 0;
    numFireFrames = 1;
    numLoadFrames = 1;
    debrisType = "null";
    fireFrames = new PImage[numFireFrames];
    loadFrames = new PImage[numLoadFrames];
    spriteArray = new ArrayList<Integer>();
    spriteType = 0;
    frame = 0;
    loadDelay = 0;
    loadDelayTime = 0;
    turret = true;
    loadSprites();
    upgradeSpecial = new boolean[4];
    upgradeDamage = new int[4];
    upgradeDelay = new int[4];
    upgradePrices = new int[4];
    upgradeHealth = new int[4];
    upgradeError = new float[4];
    upgradeNames = new String[4];
    upgradeDebris = new String[4];
    upgradeTitles = new String[4];
    upgradeDescOne = new String[4];
    upgradeDescTwo = new String[4];
    upgradeDescThree = new String[4];
    upgradeIcons = new PImage[4];
    upgradeSprites = new PImage[4];
  }
  void checkTarget(){
    if (priority == 0){ //first
      aim(enTrak.firstPos,position,enTrak.firstId);
    }
    else if (priority == 1){ //last
      aim(enTrak.lastPos,position,enTrak.lastId);
    }
    else if (priority == 2){ //strong
      aim(enTrak.strongPos,position,enTrak.strongId);
    }
    else{ //first, placeholder for close
      aim(enTrak.firstPos,position,enTrak.firstId);
    }
    if (frame == 0 && spriteType == 0){ //if done animating
      spriteType = 1;
      frame = 0;
      fire();
    }
  }
  void aim(PVector target, PVector position, int id){
    Enemy enemy = enemies.get(id);
    PVector e = PVector.div(enemy.size,2);
    target = PVector.add(target,e);
    PVector d = PVector.sub(target,position); //finds distance to enemy
    PVector t = PVector.div(d,pjSpeed); //finds time to hit
    PVector newTarget = new PVector(target.x,target.y+(t.mag()*enemy.speed)); //target + how far the enemy will go in t
    target = newTarget; //leads shots
    ratio = PVector.sub(target,position);
    if (position.x == target.x){ //if on the same x
       if (position.y >= target.y){ //if below target or on same y, angle right
         angle = 0;
       }
       else if (position.y < target.y){ //if above target, angle left
         angle = PI;
       }
    }
    else if (position.y == target.y){ //if on same y
       if (position.x > target.x){ //if  right of target, angle down
         angle = 3*HALF_PI;
       }
       else if (position.x < target.x){ //if left of target, angle up
         angle = HALF_PI;
       }
    }
    else{
      if (position.x < target.x && position.y > target.y){ //if to left and below NOT WORKING
        angle = (atan(abs(ratio.x+15)/abs(ratio.y)));
      }
      else if (position.x < target.x && position.y < target.y){ //if to left and above
        angle = (atan(abs(ratio.y)/abs(ratio.x))) + HALF_PI;
      }
      else if (position.x > target.x && position.y < target.y){ //if to right and above NOT WORKING
        angle = (atan(abs(ratio.x+15)/abs(ratio.y))) + PI;
      }
      else if (position.x > target.x && position.y > target.y){ //if to right and below
        angle = (atan(abs(ratio.y)/abs(ratio.x))) + 3*HALF_PI;
      }
    }
    if (visualize){ //cool lines
      stroke(255);
      line(position.x-size.x/2,position.y-size.y/2,target.x-enemy.size.x/2,target.y-enemy.size.y/2);
      stroke(255,0,0,150);
      line(target.x-enemy.size.x/2,height,target.x-enemy.size.x/2,0);
      stroke(0,0,255,150);
      line(width,target.y-enemy.size.y/2,0,target.y-enemy.size.y/2);
    }
  }
  void fire(){
    delayTime = frameCount + delay; //waits this time before firing
    angle += radians(random(-error,error));
    projectiles.add(new Projectile(position.x-size.x/2,position.y-size.y/2, angle));
  }
  void loadSprites(){
    sBase = spritesH.get(name+"BaseTR");
    sIdle = spritesH.get(name+"IdleTR");
    fireFrames = spritesAnimH.get(name+"FireTR");
    loadFrames = spritesAnimH.get(name+"LoadTR");
  }
  void preDisplay(){
    if (tintColor < 255){
      tintColor += 20;
    }
    if (spriteType == 0){ //idle
      sprite = sIdle;
    }
    else if (spriteType == 1){ //fire
      if (frame < numFireFrames-1){ //if not done, keep going
        frame++;
        sprite = fireFrames[frame];
      }
      else { //if done, switch to load
        if (numLoadFrames > 0){
          ArrayList<Integer> oldArray = new ArrayList();
          int oldSize = numLoadFrames;
          int newSize = (delayTime - frameCount);
          spriteArray = new ArrayList<Integer>();
          for (int i = 0; i < oldSize; i++){
            oldArray.add(i);
          }  
          for (int i = 0; i < oldSize; i++){
            spriteArray.add(i);
          }  
          int count = 0;
          while (spriteArray.size() != newSize){
            count++;
            compress = new CompressArray(spriteArray.size(),newSize,count,oldArray,spriteArray);
            compress.cMain();
          }  
        }
        frame = 0;
        spriteType = 2;
        //println();
        //println(spriteArray.size()+"<-"+oldSize);
      }
    }
    else if (spriteType == 2){ //load
      frame++;
      if (frame < spriteArray.size()){
        sprite = loadFrames[spriteArray.get(frame)];
        //print(spriteArray.get(frame)+", ");
      }
      else{ //if time runs out, switch to idle
        frame = 0;
        sprite = sIdle;
        spriteType = 0;
      }
    }
    if (hit){ //change to red if under attack
        tintColor = 0;
        hit = false;
    }
    if (twHp > 0){
        HpBar();
    }
    display();
  }  
  @Override
  void twMain(ArrayList<Tower> towers, int i){ //need to check target
    if (twHp <= 0){
       die(i);
       towers.remove(i);
    }
    if (enemies.size() > 0 && alive){
      checkTarget();
    }
    if (mousePressed && mouseX < position.x && mouseX > position.x-size.x && mouseY < position.y && mouseY > position.y-size.y && alive){
      selection.swapSel(i);
    }
    preDisplay();
  }
  void display(){
   tint(255,tintColor,tintColor);
   image(sBase,position.x-size.x,position.y-size.y);
   pushMatrix();
   translate(position.x-size.x/2,position.y-size.y/2);
   rotate(angle);
   image(sprite,-size.x/2,-size.y/2);
   popMatrix();
   tint(255,255,255);
  }
  void upgrade(int id){
    int nextLevel;
    if (id == 0){
      nextLevel = nextLevelZero;
    }
    else{
      nextLevel = nextLevelOne;
    }
    damage += upgradeDamage[nextLevel];
    delay += upgradeDelay[nextLevel];
    price += upgradePrices[nextLevel];
    value += upgradePrices[nextLevel];
    maxHp += upgradeHealth[nextLevel];
    twHp += upgradeHealth[nextLevel];
    error += upgradeError[nextLevel];
    name = upgradeNames[nextLevel];
    debrisType = upgradeDebris[nextLevel];
    sprite = upgradeSprites[nextLevel];
    if (nextLevel < upgradeNames.length && id == 0){
      nextLevelZero++;
    }
    else if (nextLevel < upgradeNames.length && id == 1){
      nextLevelOne++;
    }
    if (id == 0){
      if (nextLevelZero < upgradeNames.length/2){
        upgradeIconZero.sprite = upgradeIcons[nextLevelZero];
      }
      else{
        upgradeIconZero.sprite = spritesAnimH.get("upgradeIC")[0];
      }
    }
    if (id == 1){
      if (nextLevelOne < upgradeNames.length){
        upgradeIconOne.sprite = upgradeIcons[nextLevelOne];
      }
      else{
        upgradeIconOne.sprite = spritesAnimH.get("upgradeIC")[0];
      }
    }
    int num = floor(random(30,50)); //shower debris
    for (int j = num; j >= 0; j--){
      particles.add(new Debris((position.x-size.x/2)+random((size.x/2)*-1,size.x/2), (position.y-size.y/2)+random((size.y/2)*-1,size.y/2), random(0,360), debrisType));
    }
  }
}  
