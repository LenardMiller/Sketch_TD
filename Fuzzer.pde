class Fuzzer{
  int ks;
  float mp; 
  Node[] n;
  Fuzzer(int ks){
    this.ks = ks;
    n = new Node[ks];
    mp = 0;
    fuzz();
  }
  void fuzz(){
    leftRight();
    topBottom();
  }  
  void leftRight(){
    for (int y = 0; y < gridHeight/nSize; y++){
      for (int x = 0; x < gridWidth/nSize; x++){
        for (int i = floor(-ks/2); i <= floor(ks/2); i++){
          if (x+i < 0){
            n[i+floor(ks/2)] = nodeGrid[0][y];
          }  
          else if (x+i > gridWidth/nSize-1){
            n[i+floor(ks/2)] = nodeGrid[gridWidth/nSize-1][y];
          }  
          else{
            n[i+floor(ks/2)] = nodeGrid[x+i][y];
          }  
        }
        for (int i = 0; i < ks; i++){
          mp += n[i].mp/ks;
        }  
        nodeGrid[x][y].mp = mp;
        mp = 0;
      }  
    }
  }  
  void topBottom(){
    for (int y = 0; y < gridHeight/nSize; y++){
      for (int x = 0; x < gridWidth/nSize; x++){
        for (int i = floor(-ks/2); i <= floor(ks/2); i++){
          if (y+i < 0){
            n[i+floor(ks/2)] = nodeGrid[x][0];
          }  
          else if (y+i > (gridHeight/nSize)-1){
            n[i+floor(ks/2)] = nodeGrid[x][(gridHeight/nSize)-1];
          }  
          else{
            n[i+floor(ks/2)] = nodeGrid[x][y+i];
          }  
        }
        for (int i = 0; i < ks; i++){
          mp += n[i].mp/ks;
        }  
        nodeGrid[x][y].mp = mp;
        mp = 0;
      }  
    }
  } 
}  
