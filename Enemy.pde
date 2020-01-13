class Enemy{
int moves;
int direction;
int x;
int y;
int width;
int row;
boolean dead;
//float rojo;
//float azul;
//float verde;

Enemy(int x, int y, int row){
  this.x = x;
  this.y = y;
  this.width = 40;
  this.row = row;
  //this.azul = random(300);
  //this.rojo = random(300);
  //this.verde = random(300);
  moves = 0;
  direction = 50;
  dead = false;
}

void show(){
  //fill(rojo, verde, azul);
  //stroke(rojo, verde, azul);
  if(!dead){
  fill(100);
  stroke(100);
  ellipse(this.x,this.y,this.width, this.width);
  }
}

void move(){
  if(!dead){
  if(moves!=3){
      moves ++;
      x+=direction;
    }
    else{
      y += 50;
      moves = 0;
      direction *= (-1);
    }
  }
  }
}
