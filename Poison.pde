class Poison extends Buff{
  Poison(int enId){
    super(enId);
    effectDelay = 1000; //milliseconds
    lifeDuration = 10 * 1000; //seconds * 1000
    particle = "poison";
    this.enId = enId;
  }    
}  
