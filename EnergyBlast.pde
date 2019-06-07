class EnergyBlast extends Projectile{
  boolean bigExplosion;
  EnergyBlast(float x, float y, float angle, int damage, int effectRadius, boolean bigExplosion) {
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
    this.effectRadius = effectRadius;
    trail = "energy";
    this.bigExplosion = bigExplosion;
  }
  @Override
  void collideEn(){
    if (frameCount > hitTime){
      for (int i = enemies.size()-1; i >= 0; i--){
        Enemy enemy = enemies.get(i);
        if (abs(enemy.position.x-position.x) <= (radius + enemy.radius) && abs(enemy.position.y-position.y) <= (radius + enemy.radius) && pierce > 0){ //if touching enemy, and has pierce
          enemy.collidePJ(damage,buff,i);
          if (!bigExplosion){
            int num = floor(random(10,16));
            for (int j = num; j >= 0; j--){
              particles.add(new ExplosionDebris(position.x, position.y, random(0,360), "energy", maxSpeed = random(0.5,2.5)));
            }  
            particles.add(new MediumExplosion(position.x, position.y, random(0,360)));
          }
          else{
            int num = floor(random(16,42));
            for (int j = num; j >= 0; j--){
              particles.add(new ExplosionDebris(position.x, position.y, random(0,360), "energy", maxSpeed = random(1.5,4.5)));
            }  
            particles.add(new LargeExplosion(position.x, position.y, random(0,360)));
          }  
          hitTime = frameCount + hitDelay; //little timer so no constant damage, NOT unneccissary
          pierce--;
          for (int j = enemies.size()-1; j >= 0; j--){
            Enemy erEnemy = enemies.get(j);
            if (abs(erEnemy.position.x-position.x) <= (effectRadius + erEnemy.radius) && abs(erEnemy.position.y-position.y) <= (effectRadius + erEnemy.radius)){ //if near enemy
              erEnemy.collidePJ(damage/2,buff,i);
            }
          }
        }            
        if (pierce == 0) {
          dead = true;
        }  
      }  
    }  
  } 
}  
