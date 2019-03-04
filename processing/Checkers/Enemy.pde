class enemy {
  float x;
 float z;
 float tall = 15;
 float r = width/16;
 
 enemy(float i, float k) {
   x = i;
   z = k;
 }
 
 void show() {
  stroke(255);
  fill(0);
  for (int i = 0; i < 2; i++) {
   beginShape();
   for (float theta = 0; theta <= 2*PI; theta += PI/8) {
    vertex(x + r*cos(theta + ((PI*i)/16)), height - (tall*i), z - r*sin(theta + ((PI*i)/16)));
   }
   endShape();
  }
  beginShape(TRIANGLE_STRIP);
  for (float theta = 0; theta < 2*PI; theta += PI/8) {
   vertex(x + r*cos(theta), height, z - r*sin(theta));
   vertex(x + r*cos(theta + (PI/16)), height - tall, z - r*sin(theta + (PI/16)));
  }
  endShape();
 }
};