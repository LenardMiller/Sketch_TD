class MiscProjectile extends Projectile{
  PImage[] sprites = new PImage[6];
  int spriteType;
  MiscProjectile(float x, float y, float angle, int spriteType) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(10, 10);
    radius = 5;
    maxSpeed = 12;
    speed = maxSpeed;
    damage = 6;
    pierce = 1;
    this.angle = angle;
    angleTwo = angle;
    angularVelocity = 15; //degrees mode
    this.spriteType = spriteType;
    sprites = spritesAnimH.get("miscPJ");
    sprite = sprites[spriteType];
  }  
}  
