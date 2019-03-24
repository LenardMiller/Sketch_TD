class TowerPortrait extends Icon{
  PImage[] portraits;
  TowerPortrait(float x, float y, String type){
    super(x,y,type);
    position = new PVector(x, y);
    size = new PVector(25, 25);
    active = false;
    portraits = new PImage[31];
    loadSprites();
  }
  void loadSprites(){
    for (int i = 0; i <= 30; i++) {
      portraits[i] = loadImage("sprites/icons/towerPortraits/" + nf(i, 3) + ".png");
    }  
  }
}
