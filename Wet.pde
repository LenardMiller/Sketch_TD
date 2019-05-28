class Wet extends Buff{
  Wet(int enId){
    super(enId);
    effectDelay = 6; //frames
    lifeDuration = 600;
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
