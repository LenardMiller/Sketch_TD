void spawnKeys(){
  //create cheaty wall
  if (keyPressed == true && key == 'l' && alive){
    if (money >= 0){
      stroke(102,153,204);
      fill(102, 153, 204, 100);
      rect((10*(round(mouseX/10)))-60, (10*(round(mouseY/10)))-37, 120, 37);
    }
    else{
      stroke(255,0,0);
      fill(255,0,0,100);
      rect((10*(round(mouseX/10)))-60, (10*(round(mouseY/10)))-37, 120, 37);
    }  
  }
  //particle form: spawn x, spawn y, angle
  if (keyPressed == true && key == 'z' && alive){ //hurt
    int num = round(random(0,2));
    String type = "redOuch";
    if (num == 0){
      type = "redOuch";
    } 
    else if (num == 1){
      type = "greenOuch";
    } 
    else if (num == 2){
      type = "pinkOuch";
    } 
    particles.add(new Ouch(mouseX, mouseY, random(0,360), type));
  } 
  if (keyPressed == true && key == 'x' && alive){ //die
    particles.add(new Ouch(mouseX, mouseY, random(0,360), "greyPuff"));
  }  
  if (keyPressed == true && key == 'c' && alive){ //debris
    int num = round(random(0,4));
    String type = "null";
    if (num == 0){
      type = "wood";
    } 
    else if (num == 1){
      type = "stone";
    } 
    else if (num == 2){
      type = "metal";
    } 
    else if (num == 3){
      type = "crystal";
    } 
    else if (num == 4){
      type = "devWood";
    } 
    particles.add(new Debris(mouseX, mouseY, random(0,360), type));
  }  
  if (keyPressed == true && key == 'v' && alive){ //buff
    int num = floor(random(0,3.9));
    String type = "poison";
    if (num == 0){
      type = "poison";
    } 
    else if (num == 1){
      type = "water";
    } 
    else if (num == 2){
      type = "fire";
    } 
    else if (num == 3){
      type = "energy";
    } 
    particles.add(new BuffPt(mouseX, mouseY, random(0,360), type));
  } 
  if (keyPressed == true && key == 'b' && alive){ //medium explosion
    particles.add(new MediumExplosion(mouseX, mouseY, random(0,360)));
  } 
  if (keyPressed == true && key == 'n' && alive){ //large explosion
    particles.add(new LargeExplosion(mouseX, mouseY, random(0,360)));
  } 
}  
