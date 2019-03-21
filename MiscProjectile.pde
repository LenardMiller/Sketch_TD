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
    sprites[0] = loadImage("sprites/projectiles/misc/boot.png");
    sprites[1] = loadImage("sprites/projectiles/misc/heel.png");
    sprites[2] = loadImage("sprites/projectiles/misc/pscontroller.png");
    sprites[3] = loadImage("sprites/projectiles/misc/slipper.png");
    sprites[4] = loadImage("sprites/projectiles/misc/swcontroller.png");
    sprites[5] = loadImage("sprites/projectiles/misc/xbcontroller.png");
    sprite = sprites[spriteType];
  }  
}  
