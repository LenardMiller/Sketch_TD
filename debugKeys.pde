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
    nodeCheckObs();
  }
  //kill all projectiles: f
  if (keyPressed == true && key == 'f' && alive){
    projectiles = new ArrayList <Projectile>();
  }
  //spam null enemies: a
  if (keyPressed == true && key == 'a' && alive && mouseX < boardWidth){
    enemies.add(new Enemy(mouseX, mouseY));
    enemies.get(enemies.size()-1).requestPath(enemies.size()-1);
  }  
}  
