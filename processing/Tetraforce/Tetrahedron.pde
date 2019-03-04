class tetrahedron {
  float x;
  float y;
  float z;
  
  tetrahedron(float xc, float yc, float zc) {
    x = xc;
    y = yc;
    z = zc;
  }
  
  void show() {
   for (float theta = 0; theta < 2*PI; theta += 2*PI/3) {
    beginShape(TRIANGLE);
    vertex(x+r*cos(theta), y+r*sin(theta), z-r*cos(PI/3));
    vertex(x+r*cos(theta+2*PI/3), y+r*sin(theta+2*PI/3), z-r*cos(PI/3));
    vertex(x, y, z+r);
    endShape();
   }
   beginShape(TRIANGLE);
   for (float theta = 0; theta < 2*PI; theta += 2*PI/3) {
    vertex(x+r*cos(theta), y+r*sin(theta), z-r*cos(PI/3));
   }
   endShape();
  }
};