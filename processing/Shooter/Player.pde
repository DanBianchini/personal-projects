class Player {
  int x, y;
  int r = 10;
  float v = 4;
  boolean right, left, up, down;
    
  Player() {
    x = width/2;
    y = height/2;
    right = false;
    left = false;
    up = false;
    down = false;
  }
  
  Player(int i, int j) {
    x = i;
    y = j;
    right = false;
    left = false;
    up = false;
    down = false;
  }
  
  void show() {
    stroke(0,255,0);
    noFill();
    rectMode(CENTER);
    rect(x,y,2*r,2*r);    
  }
  
  void move() {
    if (right) {
      x += v;
    }
    if (left) {
      x -= v;
    }
    if (up) {
      y -= v;
    }
    if (down) {
      y += v;
    }
    
    //boundaries
    if (x - r < 0) { //left boundary
      x = r;
    }
    if (x + r > width) { //right boundary
      x = width - r;
    }
    if (y - r < 0) { //top boundary
      y = r;
    }
    if (y + r > height) { //bottom boundary
      y = height - r;
    }
  }
}