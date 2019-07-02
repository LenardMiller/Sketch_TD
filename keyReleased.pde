void keyReleased() { 
  //tower form: spawn x, spawn y
  if (key == 'l' && alive){ //cheaty wall
    towers.add(new DevWall(10*(round(mouseX/10))+60, 10*(round(mouseY/10))));
    nodeCheckObs();
  }
  //projectile form: spawn x, spawn y, angle
  if (key == 'q' && alive){ //pebble
    projectiles.add(new Pebble(mouseX, mouseY, 0, 10));
  }  
  if (key == 'w' && alive){ //bolt
    projectiles.add(new Bolt(mouseX, mouseY, 0, 20, 2));
  }  
  if (key == 'e' && alive){ //dev projectile
    projectiles.add(new DevProjectile(mouseX, mouseY, 0));
  }  
  if (key == 'r' && alive){ //misc projectile
    projectiles.add(new MiscProjectile(mouseX, mouseY, 0, round(random(0,5)),6));
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
  if (key == 'i' && alive){ //energy blast
    projectiles.add(new EnergyBlast(mouseX, mouseY, 0, 20, 15, false));
  } 
  if (key == 'o' && alive){ //magic missle
    projectiles.add(new MagicMissle(mouseX, mouseY, 0, 5, 0));
  } 
  //enemy form: spawn x, spawn y
  if (key == '1' && alive && mouseX < boardWidth){ //dev enemy
    enemies.add(new DevEnemy(mouseX,mouseY,0));
    for (int x = 0; x < nodeGrid.length; x++){
      for (int y = 0; y < nodeGrid[x].length; y++){
        nodeGrid[x][y].reset();
      }
    }  
    enemies.get(enemies.size()-1).requestPath(enemies.size()-1);
  }  
  if (key == '0' && alive && mouseX < boardWidth){ //null enemy
    enemies.add(new Enemy(mouseX,mouseY,0));
    for (int x = 0; x < nodeGrid.length; x++){
      for (int y = 0; y < nodeGrid[x].length; y++){
        nodeGrid[x][y].reset();
      }
    }  
    enemies.get(enemies.size()-1).requestPath(enemies.size()-1);
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
