void nodeCheckObs(){
  for (int x = 0; x < nodeGrid.length; x++){
    for (int y = 0; y < nodeGrid[x].length; y++){
      nodeGrid[x][y].checkObs(false);
    }
  } 
  fuzz = new Fuzzer(9);
  for (int x = 0; x < nodeGrid.length; x++){
    for (int y = 0; y < nodeGrid[x].length; y++){
      nodeGrid[x][y].checkObs(true);
    }
  } 
  updatePath();
}  
