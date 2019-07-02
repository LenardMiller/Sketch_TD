void updatePath(){
  for (int x = 0; x < nodeGrid.length; x++){
    for (int y = 0; y < nodeGrid[x].length; y++){
      nodeGrid[x][y].reset();
    }
  }  
  if (enemies.size() > 0){
    for (int i = enemies.size()-1; i >= 0; i--){
      boolean d = false;
      for (int j = path.reqQ.size()-1; j >= 0; j--){
        if (enemies.get(i) == path.reqQ.get(j).e){
          d = true;  
        }  
      }
      if (!d && enemies.get(i).speed != 0){
        enemies.get(i).requestPath(i);
      }
    }  
  }
  else{
    start.setStart(int(start.position.x/nSize),int(start.position.y/nSize));
    start.findGHF();
    updateNodes(start);
    path.done = false;
    path.find(0,-1);
  }
}  
