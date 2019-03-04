class phaser {
  float bx = p.x;
  float bz = p.z + p.len;
  float len = 10;
  float speed = 5;
  
  void reset() {
    bz = p.z + p.len;
    bx = p.x;
  }
  
  void move() {
    bz += speed;
  }
  
  void show() {
    strokeWeight(3);
    if (bz <= 500) {
     stroke(255);
    }
    else {
     noStroke(); 
    }
   beginShape(LINES);
   vertex(bx, p.y, bz);
   vertex(bx, p.y, bz - len);
   endShape();
   strokeWeight(1);
  }
};