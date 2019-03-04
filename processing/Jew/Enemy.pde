class enemy {
  float x;
  float y;
  float r = 8;
  float v = 1.2;
  float a = 0.001;
  float theta = random(2*PI);
  
  enemy() {
   int choice = int(random(3));
   if (choice == 0) {
    x = width+r+3;
    y = random(height);
   }
   else if (choice == 1) {
     y = height+r+3;
     x = random(width);
   }
   else if (choice == 2) {
     x = -r-3;
     y = random(height);
   }
   else {
     y = -r-3;
     x = random(width);
   }
  }
  
  void show() {
    stroke(255, 0, 0);
    strokeWeight(2);
    line(x, y+r, x, y-r);
    line(x-r, y, x+r, y);
    line(x-r, y+r, x, y+r);
    line(x-r, y-r, x-r, y);
    line(x+r, y+r, x+r, y);
    line(x+r, y-r, x, y-r);
  }
  
  void move() {
    x += v*((p.x-x)/sqrt(pow(p.x-x, 2)+pow(p.y-y, 2)));
    y += v*((p.y-y)/sqrt(pow(p.x-x, 2)+pow(p.y-y, 2)));
    v += a;
  }
  
  void fire() {
    
  }
  
  void die() {
   kills++;
   v = 1.2;
   int choice = int(random(3));
   if (choice == 0) {
    x = width+r+3;
    y = random(height);
   }
   else if (choice == 1) {
     y = height+r+3;
     x = random(width);
   }
   else if (choice == 2) {
     x = -r-3;
     y = random(height);
   }
   else {
     y = -r-3;
     x = random(width);
   }
  }
};