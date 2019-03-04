class obstacle {
  float r = 20;
  float leeway = 100;
  float h = 10 * int(random(leeway/10+2, height/10-2));
  float x = width + r +((width +(2*r))/instances)*count;
  float y = height;
  float speed = 2;
  float accel = 0.0005;
  
  obstacle() {
   fill(255);
   stroke(0);
   for (float j = height; j > 0; j -= 10) { 
    beginShape(TRIANGLE_STRIP);
    if (j > h || j < h - leeway) {
      for (float i = 0; i < 2*PI; i += PI/8) {
        vertex(x + (r*cos(i)), j, r*sin(i));
        vertex(x + (r*cos(i+(PI/8))), j-10, r*sin(i+(PI/8)));
      }
    }
    endShape();
   } 
  }
  
  void move() {
    if (x <= -r) {
     x = width + r;
     h = 10 * int(random(8, 38));
    }
    else {
     x -= speed;
    }
    speed += accel;
  }
  
  void show() {
    fill(255);
    stroke(0);
    for (float j = height; j > 0; j -= 10) { 
    beginShape(TRIANGLE_STRIP);
    if (j > h || j < h - leeway) {
      for (float i = 0; i < 2*PI; i += PI/8) {
        vertex(x + (r*cos(i)), j, r*sin(i));
        vertex(x + (r*cos(i+(PI/8))), j-10, r*sin(i+(PI/8)));
      }
    }
    endShape();
   }
  }
};