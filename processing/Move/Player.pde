class player {
  float x = width/2;
  float y = height/2;
  float xv = 0;
  float yv = 0;
  
  void show() {
    stroke(255);
    strokeWeight(6);
    point(x, y);
  }
  
  void move() {
   x += xv;
   y += yv;
  }
};