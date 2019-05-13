class Buff{
  int effectDelay;
  int effectTimer;
  int lifeDuration;
  int lifeTimer;
  String particle;
  int enId;
  Buff(int enId){
    effectDelay = 1000; //milliseconds
    effectTimer = 0;
    lifeDuration = 10 * 1000; //seconds * 1000
    lifeTimer = millis() + lifeDuration;
    particle = "null";
    this.enId = enId;
  }  
  void bMain(int i){
    live(i);
    effect();
  }  
  void live(int id){
    if (millis() > lifeTimer){
      buffs.remove(id);  
    }  
  }  
  void effect(){
    println(enId);  
  }  
}  
