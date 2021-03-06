class RepairWall extends Button{
  PImage spriteRed;
  PImage spriteGrey;
  RepairWall(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 150);
    spriteOne = spritesAnimH.get("repairBT")[0]; //green out
    spriteTwo = spritesAnimH.get("repairBT")[1]; //green in
    spriteRed = spritesAnimH.get("repairBT")[2]; //red
    spriteGrey = spritesAnimH.get("repairBT")[3]; //grey
    sprite = spriteOne;
    actionTime = frameCount + 6;
    active = false;
  }
  @Override
  void icMain(ArrayList<Icon> icons, int i){
    if (active){ 
      Tower tower = towers.get(selection.id);
      if (tower.twHp == tower.maxHp){ //if full health, grey out
        sprite = spriteGrey;  
        actionTime = frameCount + 3;
      }  
      else if (ceil(float(tower.price) - float(tower.value)) > money){ //if can't afford, red out
        sprite = spriteRed;
        actionTime = frameCount + 3;
      }  
      else if (ceil(float(tower.price) - float(tower.value)) <= money && tower.twHp < tower.maxHp){ //if neither, work fine
        hover();
      } 
      display();
    }
  } 
  void action(){
    Tower tower = towers.get(selection.id);
    money -= ceil(float(tower.price) - float(tower.value));
    tower.twHp = tower.maxHp;
    //actionTime = frameCount + 6;
  } 
}  
