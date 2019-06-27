void debugKeys(){
  //kill all enemies: s
  if (keyPressed == true && key == 's' && alive){
    enemies = new ArrayList <Enemy>();
    buffs = new ArrayList <Buff>();
    updatePath();
  }
  //kill all towers: d
  if (keyPressed == true && key == 'd' && alive){
    towers = new ArrayList <Tower>();
    for (int x = 0; x < nodeGrid.length; x++){
      for (int y = 0; y < nodeGrid[x].length; y++){
        nodeGrid[x][y].checkObs();
      }
    } 
    updatePath();
  }
  //kill all projectiles: f
  if (keyPressed == true && key == 'f' && alive){
    projectiles = new ArrayList <Projectile>();
  }
  //spam null enemies: a
  if (keyPressed == true && key == 'a' && alive){
    enemies.add(new Enemy(mouseX, mouseY, 0));
    for (int x = 0; x < nodeGrid.length; x++){
      for (int y = 0; y < nodeGrid[x].length; y++){
        nodeGrid[x][y].reset();
      }
    }  
    enemies.get(enemies.size()-1).requestPath(enemies.size()-1);
  }  
}  
