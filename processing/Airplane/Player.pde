class player {
  float narrow = 0.45;
  float x = narrow*(mouseX - width/2);
  float y = 320;
  float z = 110;
  float len = 50;
  float r = 10;
  float tiplength = 20;
  
  void move() {
    x = narrow*(mouseX - width/2);
  }
  
  void show() {
    fill(0);
    stroke(255);
    
    //body
   for (float j = y; j - y < len; j += r/2) {
    beginShape(TRIANGLE_STRIP);
    for (float theta = 0; theta <= 2*PI; theta += PI/4) {
     vertex(x + r*cos(theta), j, z + r*sin(theta));
     vertex(x + r*cos(theta), j + r/2, z + r*sin(theta));
    }
    endShape();
   }
   
   //tip
   for (float theta = 0; theta < 2*PI; theta += PI/4) {
    beginShape(TRIANGLE);
    vertex(x + r*cos(theta), y, z + r*sin(theta));
    vertex(x + r*cos(theta + PI/4), y, z + r*sin(theta + PI/4));
    vertex(x, y - tiplength, z);
    endShape();
   }
 }
  
  
};