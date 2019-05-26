void drawObjects(ArrayList <Enemy> enemies, ArrayList<Projectile> projectiles, ArrayList<Tower> towers, ArrayList<Particle> particles, ArrayList<Buff> buffs){ 
  //enemy tracker, jumps to entMain
  enTrak.entMain(enemies);
  //towers, jumps to twMain
  for (int i = towers.size()-1; i >= 0; i--){
    Tower tower = towers.get(i);
    tower.twMain(towers, i);
  }
  //enemies, jumps to enMain
  for (int i = enemies.size()-1; i >= 0; i--){
    Enemy enemy = enemies.get(i);
    enemy.enMain(enemies, i);
  }   
  if (enemies.size() == 0){
    buffs = new ArrayList <Buff>();
  }  
  //projectiles, jumps to pjMain
  for (int i = projectiles.size()-1; i >= 0; i--){
    Projectile projectile = projectiles.get(i);
    projectile.pjMain(projectiles, i);
  }  
  //particles, jumps to paMain
  for (int i = particles.size()-1; i >= 0; i--){
    Particle particle = particles.get(i);
    particle.ptMain(particles, i);
  }  
  //buffs, jumps to bMain
  for (int i = buffs.size()-1; i >= 0; i--){
    Buff buff = buffs.get(i);
    buff.bMain(i);
  }  
  //currently held, jumps to hMain
  hand.hMain();
}  
