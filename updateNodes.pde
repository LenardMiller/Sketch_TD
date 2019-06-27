void updateNodes(Node current){
  int x = int(current.position.x/nSize);
  int y = int(current.position.y/nSize);
  if (x == 0 && y == 0){
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
  }  
  else if (x == 0 && (y > 0) && y < (boardHeight/nSize)-1){
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x+1][y-1].setOpen(current);
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
  }
  else if (x == (boardWidth/nSize)-1 && y == 0){
    nodeGrid[x][y+1].setOpen(current);
    nodeGrid[x-1][y+1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
  }  
  else if ((x > 0 && x < (boardWidth/nSize)-1) && y == 0){
    nodeGrid[x+1][y].setOpen(current);
    nodeGrid[x+1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
    nodeGrid[x-1][y+1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
  }  
  else if (x == (boardWidth/nSize)-1 && y == (boardHeight/nSize)-1){
    nodeGrid[x-1][y].setOpen(current);
    nodeGrid[x-1][y-1].setOpen(current);
    nodeGrid[x][y-1].setOpen(current);
  }  
  else if (x == (boardWidth/nSize)-1 && y < (boardHeight/nSize)-1){
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x-1][y-1].setOpen(current);
    nodeGrid[x-1][y].setOpen(current);
    nodeGrid[x-1][y+1].setOpen(current);
    nodeGrid[x][y+1].setOpen(current);
  }
  else if (x == 0 && y == (boardHeight/nSize)-1){
    nodeGrid[x][y-1].setOpen(current);
    nodeGrid[x+1][y-1].setOpen(current);
    nodeGrid[x+1][y].setOpen(current);
  }  
  else if (x < (boardWidth/nSize)-1 && y == (boardHeight/nSize)-1){
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
