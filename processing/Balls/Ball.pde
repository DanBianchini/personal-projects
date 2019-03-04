class ball {
  float x;
  float y;
  float vo = 10;
  float v = 0;
  
  ball(float i, float j) {
    x = i;
    y = j;
  }
  
  void show() {
    noStroke();
    fill(255);
    ellipse(x, y, rball, rball); 
  }
  
  void move() {
    if (v == 0) {
      
    }
  }
};