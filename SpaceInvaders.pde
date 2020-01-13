Player player;
Enemy[] enemies;
Bullet[] bullets;

int contador;
int pivote;
int cBullets;
int deathMoment;

void setup(){
  player = new Player();
  enemies = new Enemy[18];
  bullets = new Bullet[50];
  contador = 0;
  cBullets = 0;
  deathMoment = 0;
  
  size(860, 800);
  background(50);
  textSize(30);
  
  for(int i = 0; i < 18; i++){
    if(i < 9){
      enemies[i] = new Enemy((i)*80+30, 20, 0);
    }
    else{
      enemies[i] = new Enemy((17-i)*80 +30, 70, 1);
    }
  }
}


void draw(){
  background(50);
  player.show();
  if(millis()<5000){
    text("Left and right arrow to move, space bar to shoot", 80, 200);
  }
   
  if(keyPressed && keyCode == 39){
    player.move(5);
  }
  else if (keyPressed && keyCode == 37){
    player.move(-5);
  }
   
  enemyFire();
  for(int i = 0; i < 18; i++){
      enemies[i].show();
      contador++;
  }
  if(contador%140==0){
    for(int i = 0; i < 18; i++){
      if(!enemies[i].dead){
        enemies[i].move();
      }
      contador=0;
  }
 }
 if(player.intangible && deathMoment != 80){
   deathMoment++;
 }
 else if (player.intangible && deathMoment == 80){
   deathMoment = 0;
   player.intangible = false;
 }
}

void keyPressed(){
  if (keyCode == 32){
    bullets[cBullets] = new Bullet(player.x + 25, player.y, 1);
    cBullets++;
    if (cBullets == 49){
      cBullets = 0;
    }
  }
}

void enemyFire(){
 float chance;
 for (int i = 0; i < enemies.length; i++){
   chance = (int)random(0, 200);
   if (chance == 0.0 && bullets[bullets.length - 1] == null && !enemies[i].dead){
     bullets[cBullets++] = new Bullet(enemies[i].x, enemies[i].y, 0);
     if(cBullets == 49){
       cBullets = 0;
     } 
   }
   else if(chance == 0.0 && !enemies[i].dead){
     bullets[cBullets] =  new Bullet(enemies[i].x, enemies[i].y, 0);
   }
 }
 
 for(int i = 0; i < bullets.length; i++){
   try{
   if (bullets[i].x >= player.x && bullets[i].x <= player.x+player.width 
   && bullets[i].y >= player.y && bullets[i].y <= player.y + player.height 
   && bullets != null && bullets[i].side == 0 && !player.intangible){
     bullets[i] = null;
     if (player.lives-- == 0){
       gameOver();
     }
     player.x = 350;
     player.y = 760;
     player.intangible = true;
   }
   
   if(bullets[i] != null){
     bullets[i].show();  
     if(bullets[i].enemyCollide(enemies)){
       bullets[i] = null; 
     }
   }
   
   } 
   catch(NullPointerException e){}  
 }
}
void gameOver(){
  text("Game Over UwU", 300, 200);
  noLoop();  
}
