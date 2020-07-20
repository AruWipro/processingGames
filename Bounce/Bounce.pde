float x_pos,y_pos;
int xSpeed = 3;
int ySpeed = 3;
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
void setup(){
  size(600,300);
  fill(255);
  //frameRate(30);
  ellipseMode(RADIUS);
   x_pos = width/2;
  y_pos = height/2;
}

void draw(){
  fill(0);
  background(255);
 System.out.println("XPos::"+x_pos+"YPos:"+y_pos+" Width:"+width+ " height: "+height);
  x_pos = x_pos+(xdirection*xSpeed);
  y_pos = y_pos+(ydirection*ySpeed);
  
  noStroke();
  
  if(x_pos >= width || x_pos < 0){
    xdirection *=-1;
  }
  
  if(y_pos >= height || y_pos < 0){
    ydirection *= -1;
  }
  ellipse(x_pos,y_pos,40,40);
}
