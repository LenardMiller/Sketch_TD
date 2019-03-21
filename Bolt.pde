class Bolt extends Projectile{
  Bolt(float x, float y, float angle) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(7, 32);
    radius = 10;
    maxSpeed = 24;
    speed = maxSpeed;
    damage = 20;
    pierce = 3;
    this.angle = angle;
    sprite = loadImage("sprites/projectiles/bolt.png");
  }  
}  
