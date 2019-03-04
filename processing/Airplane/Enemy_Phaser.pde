class ephaser {
  float x = e.x;
  float y = e.y + e.tiplength;
  float z = -210;
  float speed = 7;
  float len = 10;
  
  void reset() {
    x = e.x;
    y = e.y + e.tiplength;
    z = e.z;
  }
  
  void show() {
    stroke(255, 0, 0); 
    strokeWeight(3);
    beginShape(LINES);
    vertex(x, y, z);
    vertex(x, y - len, z);
    endShape();
    strokeWeight(1);
  }
  
  void move() {
    y += speed;
  }
};