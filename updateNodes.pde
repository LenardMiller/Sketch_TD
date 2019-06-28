void updateNodes(Node current){
  int x = int(current.position.x/nSize);
  int y = int((current.position.y+100)/nSize);
  if (x == 0 && y == 0){
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
  }  
  else if (x == 0 && (y > 0) && y < (gridHeight/nSize)-1){
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x+1][y-1].setOpen(current);
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
  }
  else if (x == (gridWidth/nSize)-1 && y == 0){
    nodeGrid[x][y+1].setOpen(current);
    nodeGrid[x-1][y+1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
  }  
  else if ((x > 0 && x < (gridWidth/nSize)-1) && y == 0){
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
    nodeGrid[x-1][y+1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
  }  
  else if (x == (gridWidth/nSize)-1 && y == (gridHeight/nSize)-1){
    nodeGrid[x-1][y].setOpen(current);
    nodeGrid[x-1][y-1].setOpen(current);
    nodeGrid[x][y-1].setOpen(current);
  }  
  else if (x == (gridWidth/nSize)-1 && y < (gridHeight/nSize)-1){
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x-1][y-1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
    nodeGrid[x-1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
  }
  else if (x == 0 && y == (gridHeight/nSize)-1){
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x+1][y-1].setOpen(current);
    nodeGrid[x+1][y].setOpen(current);
  }  
  else if (x < (gridWidth/nSize)-1 && y == (gridHeight/nSize)-1){
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y-1].setOpen(current);
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x-1][y-1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
  }  
  else{
    nodeGrid[x-1][y-1].setOpen(current); 
    nodeGrid[x][y-1].setOpen(current); 
    nodeGrid[x+1][y-1].setOpen(current); 
    nodeGrid[x+1][y].setOpen(current); 
    nodeGrid[x+1][y+1].setOpen(current); 
    nodeGrid[x][y+1].setOpen(current); 
    nodeGrid[x-1][y+1].setOpen(current); 
    nodeGrid[x-1][y].setOpen(current); 
  }
}  
