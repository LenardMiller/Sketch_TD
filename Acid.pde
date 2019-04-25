class Acid extends Projectile{ 
  Acid(float x, float y, float angle) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(15, 15);
    radius = 7.5;
    maxSpeed = 12; //default: 12
    speed = maxSpeed;
    damage = 10;
    pierce = 1;
    this.angle = angle;
    angleTwo = angle;
    angularVelocity = 20; //degrees mode
    sprite = spritesH.get("acidPj");
    isTrail = true;
    trail = "poison";
    buff = "poison";
  }  
}  
