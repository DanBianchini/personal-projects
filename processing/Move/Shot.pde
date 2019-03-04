class shot {
  float x = width + 100;
  float y = height + 100;
  float v = 5;
  float vx = 0;
  float vy = 0;
  
  void reset() {
   x = p.x;
   y = p.y;
   vx = v*((mouseX-p.x)/sqrt(pow(mouseX-p.x, 2)+pow(mouseY-p.y, 2)));
   vy = v*((mouseY-p.y)/sqrt(pow(mouseX-p.x, 2)+pow(mouseY-p.y, 2)));
  }
  
  void show() {
   stroke(0, 255, 0);
   strokeWeight(4);
   point(x, y);
  }
  
  void move() {
    x += vx;
    y += vy;
  }
};