class EnergyBlast extends Projectile{
  EnergyBlast(float x, float y, float angle, int damage) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 18);
    radius = 14;
    maxSpeed = 16;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 1;
    this.angle = angle;
    sprite = spritesH.get("energyPj");
    isTrail = true;
    trail = "energy";
  }  
}  
