class plane {
  float x = mouseX + width/2;
  float y = 450;
  float z = -600;
  float len = 20;
  float h = 50;
  float scale = 0.45;

  plane() {
   fill(80);
   stroke(0);
  }
  
  void show() {
   fill(80);
   stroke(0);
   rotateX(PI/3);
      
   //right side
   beginShape();
   vertex(x + len/2, y, z - len/2);
   vertex(x, y, z + len);
   vertex(x, y + 0.25*h, z - 0.1*len);
   //vertex(x, y + h, z);
   vertex(x + len/2, y, z - len/2);
   endShape();
   
   //left side
   beginShape();
   vertex(x - len/2, y, z - len/2);
   vertex(x, y, z + len);
   vertex(x, y + 0.25*h, z - 0.1*len);
   //vertex(x, y + h, z);
   vertex(x - len/2, y, z - len/2);
   endShape();
   
   //back side
   beginShape();
   vertex(x + len/2, y, z - len/2);
   vertex(x - len/2, y, z - len/2);
   vertex(x, y + 0.25*h, z - 0.1*len);
   endShape();
  }
  
  void move() {
   x = scale*mouseX + width/2 + (width*(1 - scale))/2;
   if (x <= width/2) {
    x = width/2; 
   }
   else if (x >= (3*width)/2) {
    x = (3*width)/2;
   }
  }
};