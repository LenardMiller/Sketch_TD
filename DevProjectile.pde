class DevProjectile extends Projectile{
  DevProjectile(float x, float y, float angle) {
    super(x, y, angle);
    position = new PVector(x, y);
    size = new PVector(7, 32);
    radius = 10;
    maxSpeed = 24;
    speed = maxSpeed;
    damage = 9999;
    pierce = 9999;
    this.angle = angle;
    sprite = spritesH.get("devPj");
  }  
  @Override
   void collideEn(){
    if (millis() > hitTime){
      for (int i = enemies.size()-1; i >= 0; i--){
        Enemy enemy = enemies.get(i);
        if (abs(enemy.position.x-position.x) <= (radius + enemy.radius) && abs(enemy.position.y-position.y) <= (radius + enemy.radius)){ //touching enemy
          enemies.remove(i); //straight up obliterates the hit enemy
          for (int j = buffs.size()-1; j >= 0; j--){
            Buff buff = buffs.get(j); //gets rid of the buffs that enemy had
            if (buff.enId == i){
              buffs.remove(j);  
            }  
          }  
          hitTime = millis() + 0; 
          pierce -= 1;
          if (pierce <= 0) {
            projectiles.remove(i);
          }  
        }  
      }  
    }  
  } 
}  
