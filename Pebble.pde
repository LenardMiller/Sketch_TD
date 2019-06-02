class Pebble extends Projectile{
  Pebble(float x, float y, float angle, int damage) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 10);
    radius = 5;
    maxSpeed = 12;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 1;
    this.angle = angle;
    sprite = spritesH.get("pebblePj");
  }  
}  
