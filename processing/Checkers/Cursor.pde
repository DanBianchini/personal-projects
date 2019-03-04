class cursor {
  float x = mouseX;
  float z = mouseY - width;
  float tall = 60;
  float r = 30;
  
  void show() {
    stroke(0);
    fill(0, 0, 255);
   for (float theta = 0; theta < 2*PI; theta += PI/2) {
    beginShape();
    vertex(x + r*cos(theta), height - tall, z - r*sin(theta));
    vertex(x + r*cos(theta + (PI/2)), height - tall, z - r*sin(theta + (PI/2)));
    vertex(x, height, z);
    vertex(x + r*cos(theta), height - tall, z - r*sin(theta));
    endShape();
   }
   
   beginShape();
   vertex(x + r, height - tall, z);
   vertex(x, height - tall, z + r);
   vertex(x - r, height - tall, z);
   vertex(x, height - tall, z - r);
   vertex(x + r, height - tall, z);  
   endShape();
  }
  
  void move() {
   x = mouseX;
   z = mouseY - width;
  }
};