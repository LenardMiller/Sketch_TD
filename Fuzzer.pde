class Fuzzer{
  int ks;
  float mp; 
  float[] mps;
  Fuzzer(int ks){
    this.ks = ks;
    mp = 0;
    fuzz();
  }
  void fuzz(){
    leftRight();
    topBottom();
  }  
  void leftRight(){
    for (int y = 0; y < gridHeight/nSize; y++){
      mps = new float[gridWidth/nSize];
      for (int x = 0; x < mps.length; x++){
        mps[x] = nodeGrid[x][y].mp;
      }  
      mp = mps[0];
      for (int i = 1; i <= floor(ks/2); i++){
        mp += mps[0];
        mp += mps[i];
      }
      nodeGrid[0][y].mp = mp/ks;
      for (int x = 1; x < gridWidth/nSize; x++){
        if (x - floor(ks/2) <= 0){
          mp -= mps[0];
        }  
        else{
          mp -= mps[x-ceil(float(ks)/2)];  
        }  
        if (x + floor(ks/2) >= gridWidth/nSize){
          mp += mps[mps.length-1];
        }  
        else{
          mp += mps[x+floor(ks/2)]; 
        } 
        nodeGrid[x][y].mp = mp/ks;
      }  
    }  
  }  
  void topBottom(){
    for (int x = 0; x < gridWidth/nSize; x++){
      mps = new float[gridHeight/nSize];
      for (int y = 0; y < mps.length; y++){
        mps[y] = nodeGrid[x][y].mp;
      }  
      mp = mps[0];
      for (int i = 1; i <= floor(ks/2); i++){
        mp += mps[0];
        mp += mps[i];
      }
      nodeGrid[x][0].mp = mp/ks;
      for (int y = 1; y < gridHeight/nSize; y++){
        if (y - floor(ks/2) <= 0){
          mp -= mps[0];
        }  
        else{
          mp -= mps[y-ceil(float(ks)/2)];  
        }  
        if (y + floor(ks/2) >= gridHeight/nSize){
          mp += mps[mps.length-1];
        }  
        else{
          mp += mps[y+floor(ks/2)]; 
        }  
        nodeGrid[x][y].mp = mp/ks;
      } 
    }  
  } 
}  
