class Burning extends Buff{
  Burning(int enId){
    super(enId);
    effectDelay = 200; //milliseconds
    lifeDuration = round(random(2500,15000)); //milliseconds
    particle = "fire";
    this.enId = enId;
  }    
  @Override
  void effect(){ //small damage fast
    Enemy enemy = enemies.get(enId);
    if (enemy.tintColor > 100){
      enemy.tintColor = 100;  
    }  
    enemy.barTrans = 255;
    enemy.enHp--;
    int num = floor(random(0,2));
    if (num == 0){ //small red splatter
      particles.add(new Ouch(enemy.position.x+2.5+random((enemy.size.x/2)*-1,(enemy.size.x/2)), enemy.position.y+2.5+random((enemy.size.x/2)*-1,(enemy.size.x/2)), random(0,360), "redOuch"));
    }  
  }  
}  
