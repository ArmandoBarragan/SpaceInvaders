class Player{
int x;
int y;
int width;
int height;
byte lives;
boolean intangible;

Player(){
  this.x = 350;
  this.y = 760;
  this.width = 60;
  this.height = 25;
  lives = 2;
  intangible = false;
}
void show(){
  fill(255);
  stroke(255);
  if(intangible){
    fill(200, 0,0);
  }
  rect(this.x,this.y,this.width, this.height);
  
}
void move(int movement){
  this.x += movement; 
}
}
