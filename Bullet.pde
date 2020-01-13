class Bullet{
  float x;
  int y;
  int speed;
  int ancho;
  int largo;
  int side;
  
  Bullet(int x, int y, int side){
    this.y = y;
    this.x = x;
    this.speed = 6;
    this.ancho = 5;
    this.largo = 15;
    this.side = side;
  }
  
  void show(){
    fill(255);
    stroke(255);
    rect(x,y,ancho,largo);
    if(side ==1){
    y-=speed;
    }
    else if (side ==0){
      y+=speed;
    }
  }
  boolean enemyCollide(Enemy[] enemies){
    for(int i = 0; i < enemies.length; i++){
      if (enemies[i].x <= this.x && this.x <= enemies[i].x+enemies[i].width &&
      enemies[i].y <= this.y && this.y <=enemies[i].y + enemies[i].width && side ==1){
        enemies[i].dead = true;
        return true;
      }
    }
    return false;
  }
}
