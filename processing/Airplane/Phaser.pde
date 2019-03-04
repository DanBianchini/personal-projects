class phaser {
  float x = mouseX;
  float y = p.y - p.tiplength;
  float z = -210;
  float speed = 10;
  float len = 10;
  
  void reset() {
    x = p.x;
    y = p.y - p.tiplength;
    z = p.z;
  }
  
  void show() {
    if (y <= -250) {
     noStroke();
    }
    else {
     stroke(80); 
    }
    strokeWeight(3);
    beginShape(LINES);
    vertex(x, y, z);
    vertex(x, y + len, z);
    endShape();
    strokeWeight(1);
  }
  
  void move() {
    y -= speed;
  }
};