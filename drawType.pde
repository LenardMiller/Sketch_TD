void drawType(float x) {
  fill(255);
  textFont(TFFont);
  textAlign(LEFT); 
  //debug related stuff
  text("enemies: " + enemies.size(), x, 30);
  text("towers: " + towers.size(), x, 60);
  text("projectiles: " + projectiles.size(), x, 90);
  text("particles: " + particles.size(), x, 120);
  text("X: " + int(mouseX) + " Y: " + int(mouseY), x, boardHeight-x);
  //gameplay related stuff
  //fill(255,0,0); //red
  //text("Hp", boardWidth + (x*2) + 25, 30); //replaced with heart icon
  //fill(255,225,0); //orangish-yellow
  //text("$", boardWidth + (x*2) + 25, 60); //replaced with $ icon
  textAlign(RIGHT); 
  text(round(frameRate) + " fps", boardWidth - x, 30);
  fill(0);
  text(Hp, width - x, 30);
  text(nfc(money), width - x, 60);
  if (!alive){
    textAlign(CENTER);
    textFont(FEFont);
    fill(75,0,0);
    text("Game Over", width/2, height/2);
  }  
  //textFont(TWFont); //replaced with healthbars
  //fill(255);
  //textAlign(CENTER);
  ////enemy health, jump to enemy.HpText
  //for (int i = enemies.size()-1; i >= 0; i--){
  //  Enemy enemy = enemies.get(i);
  //  enemy.HpText();
  //}
  ////tower health, jump to tower.HpText
  //for (int i = towers.size()-1; i >= 0; i--) {
  //  Tower tower = towers.get(i);
  //  tower.HpText();
  //}  
}  
