class RepairWall extends Button{
  PImage spriteRed;
  PImage spriteGrey;
  RepairWall(float x, float y, String type, boolean active){
    super(x,y,type,active);
    position = new PVector(x, y);
    size = new PVector(200, 150);
    spriteLocation = "sprites/icons/buttons/repairButton/";
    spriteOne = loadImage(spriteLocation + "000.png");
    spriteTwo = loadImage(spriteLocation + "001.png");
    spriteRed = loadImage(spriteLocation + "002.png");
    spriteGrey = loadImage(spriteLocation + "003.png");
    sprite = spriteOne;
    actionTime = millis() + 100;
    active = false;
  }
  @Override
  void icMain(ArrayList<Icon> icons, int i){
    if (active){ 
      Tower tower = towers.get(selection.id);
      if (tower.twHP == tower.maxHP){ //if full health, grey out
        sprite = spriteGrey;  
        actionTime = millis() + 50;
      }  
      else if (ceil(float(tower.price) - float(tower.value)) > money){ //if can't afford, red out
        sprite = spriteRed;
        actionTime = millis() + 50;
      }  
      else if (ceil(float(tower.price) - float(tower.value)) <= money && tower.twHP < tower.maxHP){ //if neither, work fine
        hover();
      } 
      display();
    }
  } 
  void action(){
    Tower tower = towers.get(selection.id);
    money -= ceil(float(tower.price) - float(tower.value));
    tower.twHP = tower.maxHP;
    //actionTime = millis() + 100;
  } 
}  