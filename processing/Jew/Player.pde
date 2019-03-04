class player {
  float x = width/2;
  float y = height/2;
  float xv = 0;
  float yv = 0;
  float r = 12;
  
  void show() {
    stroke(255, 255, 0);
    strokeWeight(1);
    line(x, y+r, x+r*cos(PI/6), y-r*sin(PI/6));
    line(x+r*cos(PI/6), y-r*sin(PI/6), x-r*cos(PI/6), y-r*sin(PI/6));
    line(x-r*cos(PI/6), y-r*sin(PI/6), x, y+r);
    line(x, y-r, x+r*cos(PI/6), y+r*sin(PI/6));
    line(x+r*cos(PI/6), y+r*sin(PI/6), x-r*cos(PI/6), y+r*sin(PI/6));
    line(x-r*cos(PI/6), y+r*sin(PI/6), x, y-r);
  }
  
  void move() {
   x += xv;
   y += yv;
   if (x <= r*cos(PI/6)) {
    x = r*cos(PI/6); 
   }
   else if (x >= width-r*cos(PI/6)) {
    x = width-r*cos(PI/6); 
   }
   if (y <= r) {
     y = r;
   }
   else if (y >= width-r) {
     y = width-r;
   }
  }
};