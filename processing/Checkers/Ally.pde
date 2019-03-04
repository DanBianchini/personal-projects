class ally {
 float x;
 float z;
 float tall = 15;
 float r = width/16;
 boolean kinged = false;
 float rcrown = 40;
 float hcrown = 20;
 
 ally(float i, float k) {
   x = i;
   z = k;
 }
 
 void show() {
  stroke(0);
  fill(255, 0, 0);
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
 
 void showcrown() {
   stroke(0);
   fill(255, 230, 0);
   beginShape(TRIANGLE_STRIP);
   for (float theta = 0; theta <= 2*PI; theta += PI/8) {
    vertex(x + rcrown*cos(theta + (PI/16)), height - tall, z - rcrown*sin(theta + (PI/16)));
    vertex(x + rcrown*cos(theta), height - tall - (hcrown/2), z - rcrown*sin(theta));
   }
   endShape();
   
   for (float theta = 0; theta < 2*PI; theta += PI/8) {
     beginShape();
     vertex(x + rcrown*cos(theta), height - tall - (hcrown/2), z - r*sin(theta));
     vertex(x + rcrown*cos(theta + (PI/8)), height - tall - (hcrown/2), z - rcrown*sin(theta +(PI/8)));
     vertex(x + rcrown*cos(theta + (PI/16)), height - tall - hcrown, z - rcrown*sin(theta + (PI/16)));
     vertex(x + rcrown*cos(theta), height - tall - (hcrown/2), z - rcrown*sin(theta));
     endShape();
   }
 }
};