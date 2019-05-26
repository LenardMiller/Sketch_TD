void keyReleased() { 
  //tower form: spawn x, spawn y
  if (key == 'l' && alive){ //cheaty wall
    towers.add(new DevWall(10*(round(mouseX/10))+60, 10*(round(mouseY/10))));
  }
  //projectile form: spawn x, spawn y, angle
  if (key == 'q' && alive){ //pebble
    projectiles.add(new Pebble(mouseX, mouseY, 0));
  }  
  if (key == 'w' && alive){ //bolt
    projectiles.add(new Bolt(mouseX, mouseY, 0));
  }  
  if (key == 'e' && alive){ //dev projectile
    projectiles.add(new DevProjectile(mouseX, mouseY, 0));
  }  
  if (key == 'r' && alive){ //misc projectile
    projectiles.add(new MiscProjectile(mouseX, mouseY, 0, round(random(0,5))));
  } 
  if (key == 't' && alive){ //acid
    projectiles.add(new Acid(mouseX, mouseY, 0));
  } 
  if (key == 'y' && alive){ //urchin
    projectiles.add(new Urchin(mouseX, mouseY, 0));
  } 
  if (key == 'u' && alive){ //waterball
    projectiles.add(new Waterball(mouseX, mouseY, 0));
  } 
  //enemy form: spawn x, spawn y
  if (key == '1' && alive){ //dev enemy
    enemies.add(new DevEnemy(mouseX,mouseY));
  }  
  if (key == '0' && alive){ //null enemy
    enemies.add(new Enemy(mouseX,mouseY));
  }  
  //buff form: enemy id
  if (key == '?' && alive){ //null buff
    buffs.add(new Buff(int(random(0,enemies.size()))));
  }  
  if (key == ',' && alive){ //poison
    buffs.add(new Poisoned(int(random(0,enemies.size()))));
  }  
  if (key == '.' && alive){ //wet
    buffs.add(new Wet(int(random(0,enemies.size()))));
  }  
  if (key == '/' && alive){ //burning
    buffs.add(new Burning(int(random(0,enemies.size()))));
  }  
}  
