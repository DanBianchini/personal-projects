class enemy {
  float x;
  float y = -100;
  float z = p.z;
  float r = 20;
  float len = 50;
  float border = 150;
  float speed = 0;
  float tiplength = 20;
  float g = 0.0005;
  float fall = 0;
  
  enemy() {
   //x = random(-width/2 - border, width/2 + border);
   x = 0;
  }
  
  void move() {
    speed += 0.007; 
    x = map(noise(speed), 0, 1, -width/2 + border, width/2 - border);
  }
  
  void show() {
   fill(255, 0, 0);
   stroke(0);
   
   //cylinder
   for (float j = y; y - j < len; j -= r/2) {
   beginShape(TRIANGLE_STRIP);
     for (float theta = 0; theta <= 2*PI; theta += PI/4) {
      vertex(x + r*cos(theta), j, z + r*sin(theta));
      vertex(x + r*cos(theta), j - r/2, z + r*sin(theta));
     }
     endShape();
   }
   
   //tip
   beginShape(TRIANGLES);
   for (float theta = 0; theta <= 2*PI; theta += PI/4) {
    vertex(x + r*cos(theta), y, z + r*sin(theta));
    vertex(x + r*cos(theta + PI/4), y, z + r*sin(theta + PI/4));
    vertex(x, y + tiplength, z);
   }
   endShape();
  }
  
  void hit() {
   z -= fall;
   fall += g;   
  }
};