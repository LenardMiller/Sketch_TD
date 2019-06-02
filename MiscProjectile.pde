class MiscProjectile extends Projectile{
  PImage[] sprites = new PImage[6]; //alternate sprites, passed in
  int spriteType;
  MiscProjectile(float x, float y, float angle, int spriteType, int damage) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 10);
    radius = 5;
    maxSpeed = 12;
    speed = maxSpeed;
    this.damage = damage;
    pierce = 1;
    this.angle = angle;
    angleTwo = angle;
    angularVelocity = 15; //degrees mode
    this.spriteType = spriteType;
    sprites = spritesAnimH.get("miscPJ");
    sprite = sprites[spriteType];
  }
}
