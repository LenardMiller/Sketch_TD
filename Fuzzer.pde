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
    for (int y = 0; y < boardHeight/nSize; y++){
      for (int x = 0; x < boardWidth/nSize; x++){
        for (int i = floor(-ks/2); i <= floor(ks/2); i++){
          if (x+i < 0){
            n[i+floor(ks/2)] = nodeGrid[0][y];
          }  
          else if (x+i > boardWidth/nSize-1){
            n[i+floor(ks/2)] = nodeGrid[boardWidth/nSize-1][y];
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
    for (int y = 0; y < boardHeight/nSize; y++){
      for (int x = 0; x < boardWidth/nSize; x++){
        for (int i = floor(-ks/2); i <= floor(ks/2); i++){
          if (y+i < 0){
            n[i+floor(ks/2)] = nodeGrid[x][0];
          }  
          else if (y+i > (boardHeight/nSize)-1){
            n[i+floor(ks/2)] = nodeGrid[x][(boardHeight/nSize)-1];
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
