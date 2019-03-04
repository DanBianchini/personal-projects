float edge = 200;
float r = edge*sin((2*PI)/5);

void setup() {
 size(600, 600, P3D);
 
}
float a = 0;
void draw() {
 a += 0.01;
 background(0);
 translate(width/2, height/2);
 rotateY(a);
 stroke(255);
 strokeWeight(3);
 fill(100);
  //bottom
  for (float theta = 0; theta < 2*PI; theta += (2*PI)/5) {
   beginShape(TRIANGLE);
   vertex(0, r, 0);
   vertex(r*cos(theta), (edge*sin(PI/3))/2,  r*sin(theta));
   vertex(r*cos(theta+((2*PI)/5)), (edge*sin(PI/3))/2, r*sin(theta+((2*PI)/5)));
   endShape();
  }
  
  //top
  for (float theta = PI; theta < 3*PI; theta += (2*PI)/5) {
   beginShape(TRIANGLE);
   vertex(0, -r, 0);
   vertex(r*cos(theta), -(edge*sin(PI/3))/2,  r*sin(theta));
   vertex(r*cos(theta+((2*PI)/5)), -(edge*sin(PI/3))/2, r*sin(theta+((2*PI)/5)));
   endShape();
  }
  
  //middle bottom
  for (float theta = PI; theta < 3*PI; theta += (2*PI)/5) {
   beginShape(TRIANGLE);
   vertex(r*cos(theta), -(edge*sin(PI/3))/2,  r*sin(theta));
   vertex(r*cos(theta+((2*PI)/5)), -(edge*sin(PI/3))/2, r*sin(theta+((2*PI)/5)));
   vertex(r*cos(theta + PI/5), (edge*sin(PI/3))/2, r*sin(theta + PI/5));
   endShape();
  }
  
  //middle top
  for(float theta = 0; theta < 2*PI; theta += (2*PI)/5) {
   beginShape(TRIANGLE);
   vertex(r*cos(theta), (edge*sin(PI/3))/2,  r*sin(theta));
   vertex(r*cos(theta+((2*PI)/5)), (edge*sin(PI/3))/2, r*sin(theta+((2*PI)/5)));
   vertex(r*cos(theta + PI/5), -(edge*sin(PI/3))/2, r*sin(theta + PI/5));
   endShape();
  }
}