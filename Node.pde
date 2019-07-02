class Node{
  Node parent;
  ItemNode openItem;
  PVector position;
  float mp;
  float g;
  float h;
  float f;
  int tint;
  boolean s;
  boolean e;
  boolean o;
  boolean c;
  boolean nt;
  Node(PVector position){
    this.position = position;
  }  
  void setNotEnd(int x, int y){
    if (e){
      e = false; //<>// //<>// //<>//
      int index = numEnd+1;
      PVector p = new PVector(x*nSize,y*nSize);
      for (int i = 0; i < numEnd; i++){
        if (end[i].position.x == p.x && end[i].position.y == p.y){
          end[i] = end[i+1];
          index = i;
        }  
        if (i > index && i < numEnd-1){
          end[i] = end[i+1];
        }  
        if (i == numEnd-1){
          end[i] = null;  
        }  
      }  
      numEnd--;
      updatePath();
    }
  }  
  void setStart(int x, int y){
    if (start != null){
      start.s = false;
    }
    start = nodeGrid[x][y+10];
    s = true;
  }  
  void setEnd(int x, int y){
    if (!e){
      end[numEnd] = nodeGrid[x][y];
      numEnd++;
      e = true;
    }
  }  
  void setOpen(Node parentNew){
    if (!(s||o||c||nt)){
      if(!e){
      }  
      o = true;
      findGHF();
    }
    if (parentNew.c || parentNew.s){
      if ((o||c) && parent == null){
        parent = parentNew;
        findGHF();
        openNodes.addItem(new ItemNode(nodeGrid[int(position.x/nSize)][int(position.y/nSize)+10]));
      }  
      if ((o||c) && parentNew.g < parent.g){ //these have to be split in two because parent might be null
        parent = parentNew;
        findGHF();
        openNodes.addItem(new ItemNode(nodeGrid[int(position.x/nSize)][int(position.y/nSize)+10]));
      } 
    }  
  }  
  void setClose(){
    c = true;
    o = false;
    if (e){
      path.done = true;
      if (path.index != -1 && enemies.size() > path.index){
        enemies.get(path.index).points.add(new TurnPoint(position));
        enemies.get(path.index).points.add(new TurnPoint(parent.position));
      }  
      parent.setDone();
    }
    else{
      updateNodes(nodeGrid[int(position.x/nSize)][int(position.y/nSize)+10]);
    }  
    findGHF();
  }  
  void setDone(){
    if (!s){
      if (path.index != -1 && enemies.size() > path.index){
        enemies.get(path.index).points.add(new TurnPoint(position));
      }  
      parent.setDone();
    }  
  }  
  void checkObs(boolean addMode){
    if (!addMode){
      mp = 0;
    }
    for (int i = 0; i < towers.size(); i++){
      boolean intersecting = false;
      PVector op = towers.get(i).position;
      PVector os = towers.get(i).size;
      intersecting = (position.x > op.x-os.x-10 && position.x < op.x+nSize+10) && (position.y > op.y-os.y-10 && position.y < op.y+nSize+10);
      if (intersecting){
        mp += towers.get(i).twHp;
      }  
    }  
  }  
  void findGHF(){
    if (e){
      h = 0;
    }  
    else{
      if (numEnd > 0){
        HeapFloat endH = new HeapFloat(numEnd);
        for (int i = 0; i < numEnd; i++){
          end[i].findGHF();
          PVector d = PVector.sub(position,end[i].position);
          h = sqrt(sq(d.x)+sq(d.y));
          endH.addItem(new ItemFloat(h));
        }
      h = endH.removeFirstItem().value;
      }  
    }  
    if (s){
      g = 0;
    }  
    else{
      PVector d;
      if (parent != null){
        d = PVector.sub(position,parent.position);
        g = sqrt(sq(d.x)+sq(d.y));
        float mpn = mp;
        g += mpn;
        g += parent.g;
      }
    }
    f = g + h;
  }
  void reset(){
    o = false;
    c = false;
    if(!s){
      f = 0;
      h = 0;
      g = 0;
    }
    openNodes = new HeapNode(int(sq(1000/nSize)));
    parent = null;
  }  
}  
