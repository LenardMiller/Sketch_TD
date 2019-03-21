class Pebble extends Projectile{
  Pebble(float x, float y, float angle) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 10);
    radius = 5;
    maxSpeed = 12;
    speed = maxSpeed;
    damage = 10;
    pierce = 1;
    error = 5;
    this.angle = angle;
    sprite = loadImage("sprites/projectiles/pebble.png");
  }  
}  
