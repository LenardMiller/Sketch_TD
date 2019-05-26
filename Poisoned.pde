class Poisoned extends Buff{
  Poisoned(int enId){
    super(enId);
    effectDelay = 1000; //milliseconds
    lifeDuration = 10 * 1000; //seconds * 1000
    particle = "poison";
    this.enId = enId;
  }    
  @Override
  void effect(){
    Enemy enemy = enemies.get(enId);
    enemy.tintColor = 0;
    enemy.barTrans = 255;
    enemy.enHP -= 3;
    int num = ceil(random(0,3));
    for (int j = num; j >= 0; j--){
      particles.add(new Ouch(enemy.position.x+2.5+random((enemy.size.x/2)*-1,(enemy.size.x/2)), enemy.position.y+2.5+random((enemy.size.x/2)*-1,(enemy.size.x/2)), random(0,360), "greenOuch"));
    }
  }  
}  
