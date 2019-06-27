class AStar{
  ArrayList<PathRequest> reqQ;
  float mpNegation;
  int index;
  boolean done;
  AStar(){
    reqQ = new ArrayList<PathRequest>();
    mpNegation = 0;
  }
  void find(float mpNegation, int index){
    this.mpNegation = mpNegation;
    this.index = index;
    while (openNodes.currentCount > 0 && !done){
      Node current = openNodes.removeFirstItem().node;
      current.setClose();
    }
  }
  
}
class PathRequest{
  int i;
  Enemy e;
  PathRequest(int i, Enemy e){
    this.i = i;
    this.e = e;
  }  
  void getPath(){
    for (int x = 0; x < nodeGrid.length; x++){
      for (int y = 0; y < nodeGrid[x].length; y++){
        nodeGrid[x][y].reset();
      }
    }  
    e.points = new ArrayList<TurnPoint>();
    nodeGrid[round((e.position.x-(e.size.x/2))/nSize)][round((e.position.y-(e.size.y/2))/nSize)].setStart(round((e.position.x-(e.size.x/2))/nSize),round((e.position.y-(e.size.y/2))/nSize));
    start.findGHF();
    updateNodes(start);
    path.done = false;
    path.find(e.mpNegation, i);
    e.swapPoints(false);
  }
}  
