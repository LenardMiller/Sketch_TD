class Bolt extends Projectile{
  Bolt(float x, float y, float angle, int damage) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(7, 32);
    radius = 10;
    maxSpeed = 24;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 3;
    this.angle = angle;
    sprite = spritesH.get("boltPj");
  }  
}  
