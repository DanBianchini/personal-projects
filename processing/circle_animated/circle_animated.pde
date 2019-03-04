/*
 * Author: Dan Bianchini
 * Pledge: I pledge my honor that I have abided by the Stevens Honor System.
*/

void setup() {
  size(600,400);
  fill(0,0,255);
}

final int r = 25;
int x = r, y = r;
int speed = 5;
int vx = speed;
int vy = 0;

void draw() {
  background(0);
  ellipse(x,y,2*r,2*r);
  x += vx;
  y += vy;
  
  //position corrections
  if (x < r)
    x = r;
  else if (x > width-r)
    x = width-r;
  if (y < r)
    y = r;
  else if (y > height-r)
    y = height-r;
  
  
  //ball is in the top left corner
  if (x <= r && y <= r) {
    vx = speed;
    vy = 0;
  }
  
  //ball is in the top right corner
  else if (x >= width-r && y <= r) {
    vx = 0;
    vy = speed;
  }
  
  //ball is in the bottom right corner
  else if (x >= width-r && y >= height-r) {
    vx = -speed;
    vy = 0;
  }
  
  //ball is in the bottom left corner
  else if (x <= r && y >= height-r) {
    vx = 0;
    vy = -speed;
  }
}