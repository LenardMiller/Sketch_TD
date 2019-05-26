class EnemyTracker{ //keeps track of first last and strongest enemies, I cannot believe this works
  int firstId;
  PVector firstPos;
  int lastId;
  PVector lastPos;
  int strongId;
  int strength;
  PVector strongPos;
  EnemyTracker(){
    firstId = -1; //set to -1 so not associated with any enemy
    firstPos = new PVector(0,-boardHeight);
    lastId = -1;
    lastPos = new PVector(0,2*boardHeight);
    strongId = -1;
    strength = -1;
  }
  void entMain(ArrayList <Enemy> enemies){
    if (enemies.size() > 0){
      trakFirst(enemies);
      trakLast(enemies);
      trakStrong(enemies);
      //debugDisplay(); //points out positions
    }  
  }
  void trakFirst(ArrayList <Enemy> enemies){
    firstPos = new PVector(0,-boardHeight);
    for (int i = enemies.size()-1; i >= 0; i--){ //chooses an enemy to attack
      Enemy enemy = enemies.get(i);
      if (enemy.position.y > firstPos.y){ //if the enemy is closer to the exit than the current target
        firstPos = new PVector(enemy.position.x,enemy.position.y);
        firstId = i;
      }
    }  
  }  
  void trakLast(ArrayList <Enemy> enemies){
    lastPos = new PVector(0,2*boardHeight);
    for (int i = enemies.size()-1; i >= 0; i--){ //chooses an enemy to attack
      Enemy enemy = enemies.get(i);
      if (enemy.position.y < lastPos.y){ //if the enemy is further from the exit than the current target
        lastPos = new PVector(enemy.position.x,enemy.position.y);
        lastId = i;
      }
    } 
  }  
  void trakStrong(ArrayList <Enemy> enemies){
    strength = -1;
    for (int i = enemies.size()-1; i >= 0; i--){ //chooses an enemy to attack
      Enemy enemy = enemies.get(i);
      if (enemy.dangerLevel > strength || (enemy.dangerLevel == strength && enemy.position.y > strongPos.y)){ //if the enemy is more dangerous than the current target, or same strenght but closer to exit
        strongPos = new PVector(enemy.position.x,enemy.position.y);
        strength = enemy.dangerLevel;
        strongId = i;
      }
    } 
  }
  void debugDisplay(){ //debug boxes
    //first
    Enemy first = enemies.get(firstId);
    stroke(0,255,0);
    fill(0,255,0,100);
    rect(firstPos.x-first.size.x/2,firstPos.y-first.size.y/2,first.size.x,first.size.y);
    //last
    Enemy last = enemies.get(lastId);
    stroke(0,0,255);
    fill(0,0,255,100);
    rect(lastPos.x-last.size.x/2,lastPos.y-last.size.y/2,last.size.x,last.size.y);
    //strong
    Enemy strong = enemies.get(strongId);
    stroke(255,0,0);
    fill(255,0,0,100);
    rect(strongPos.x-strong.size.x/2,strongPos.y-strong.size.y/2,strong.size.x,strong.size.y);
  }  
}  
