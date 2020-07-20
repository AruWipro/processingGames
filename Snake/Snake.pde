ArrayList<Integer> x = new ArrayList<Integer>(),y= new ArrayList<Integer>();
int w= 30,h=30,blocks=20,direction=2,foodx=(int)random(0,w),foody=(int)random(0,h),speed = 8;
int[] x_direction = {0,0,1,-1},y_direction={1,-1,0,0,};
boolean gameOver = false;
void setup(){
  size(600,600);
  x.add(0);
  y.add(15);
}

void draw(){
  background(0);
  fill(98, 255, 13);
  for(int i=0;i<x.size();i++){
    rect(x.get(i)*blocks,y.get(i)*blocks,blocks,blocks); //<>//
 }
 if(!gameOver){
 fill(255); // FColor
 rect(foodx*blocks,foody*blocks,blocks,blocks);
 
 textAlign(LEFT);
 textSize(25);
 fill(180);
 System.out.println("Width is"+width);  
 int level = 8 - speed ;
  text("Score :"+x.size()+"  Level :"+level,10,10,width-20,100);
 if(frameCount%speed==0){
      System.out.println("x-- "+x+" Y-- "+y);  
      x.add(0,x.get(0)+x_direction[direction]);
      y.add(0,y.get(0)+y_direction[direction]);
      System.out.println("Post X-- "+x+" Y-- "+y);  
      
      // Check if snake hits the border
      if(Math.abs(x.get(0)) >= w || Math.abs(y.get(0)) >= h || x.get(0) < 0 || y.get(0) < 0){
        System.out.println("Exception "+" -- "+x.get(0)+"---"+y.get(0));
        gameOver = true;
        
      }
      
      // Check if the snake hits itself
      for(int i =1;i<x.size();i++){ 
       if(x.get(0) == x.get(i) && y.get(0) == y.get(i)){
        System.out.print("Touch:");
          gameOver = true;
      }  
      }
      
      // Vary the speed for every 3 feed 
      if(x.get(0) == foodx && y.get(0) == foody){ //<>// //<>//
        if(x.size()%3 == 0 && speed >=1){
          speed--; 
        } 
        foodx = (int)random(0,w);
        foody = (int)random(0,h);
      }       
      else{
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
  }
}else{
        fill(227, 41, 72);
        text("GAME OVER",225,260);
        fill(255);
        textSize(15);
        int level = speed - 8;
        System.out.println("Level is"+level);
        text("Score :"+x.size(),225,280);
        
 }
}

void keyPressed(){
  int new_dir=keyCode == DOWN?0:(keyCode == UP ? 1: (keyCode == RIGHT ? 2 : (keyCode == LEFT ? 3 : -1)) );
  System.out.println("Direction is"+new_dir);
  if(new_dir != -1){
    direction = new_dir;
  }
}
