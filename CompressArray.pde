class CompressArray{
  int oldSize;
  int newSize;
  int factor;
  float period;
  int count;
  int changed;
  int metaCount;
  ArrayList<Integer> fullArray;
  ArrayList<Integer> compArray;
  CompressArray(int oldSize, int newSize, int metaCount, ArrayList<Integer> fullArray, ArrayList<Integer> compArray){
    this.fullArray = fullArray;
    this.compArray = compArray;
    this.oldSize = oldSize;
    this.newSize = newSize;
    factor = newSize-oldSize;
    period = (newSize/abs(float(factor)))-1;
    count = 0;
    changed = 0;
    this.metaCount = metaCount; 
  }  
  void cMain(){
    if (factor < 0){
      for (int i = 0; i < oldSize; i++){
        if (count > ceil(period)){
          compArray.remove(i-changed);
          changed++;
          count = -1;
        }  
        count++;
      }  
    }  
    else if (factor > 0){
      for (int i = 0; i <= newSize-1; i++){
        if (count >= ceil(period)){
          if (compArray.size() < (metaCount+1)*fullArray.size()){
            if (i != 0 && i < compArray.size()+1){
              compArray.add(i,compArray.get(i-1));
            }  
          }
          count = -1;
        }  
        count++;
      }  
    }  
  }   
}  
