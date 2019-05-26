class Buff{
  int effectDelay;
  int effectTimer;
  int lifeDuration;
  int lifeTimer;
  String particle;
  int enId;
  Buff(int enId){
    effectDelay = 1000; //milliseconds
    effectTimer = millis() + effectDelay;
    lifeDuration = 10000; //milliseconds
    lifeTimer = millis() + lifeDuration;
    particle = "null";
    this.enId = enId;
  }  
  void bMain(int i){
    live(i);
    if (millis() > effectTimer){
      effect();
      effectTimer = millis() + effectDelay;
    }  
    display();
  }  
  void live(int i){ //ends if at end of lifespan
    if (millis() > lifeTimer){
      buffs.remove(i);  
    }  
  }  
  void effect(){ //prints enemies id
    print(enId + " ");   
  }  
  void display(){ //particles around enemy
    Enemy enemy = enemies.get(enId);
    int num = floor(random(0,8));
    if (num == 0){
      particles.add(new BuffPt(enemy.position.x+2.5+random((enemy.size.x/2)*-1,(enemy.size.x/2)), enemy.position.y+2.5+random((enemy.size.x/2)*-1,(enemy.size.x/2)), random(0,360), particle)); 
    }  
  }  
}  
