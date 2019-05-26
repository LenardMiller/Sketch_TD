class Wet extends Buff{
  Wet(int enId){
    super(enId);
    effectDelay = 100; //milliseconds
    lifeDuration = 10 * 1000; //seconds * 1000    
    particle = "water";
    this.enId = enId;
  }    
  @Override
  void effect(){ //removes fire
    for (int i = buffs.size()-1; i >= 0; i--){
      Buff buff = buffs.get(i);
      if (buff.particle == "fire" && buff.enId == enId){
        buffs.remove(i);  
      }  
    }  
  }  
}  
