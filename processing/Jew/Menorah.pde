class menorah {
  float x;
  float y;
  float r = 3;
  
  menorah() {
   x = random(3*r, width-(3*r));
   y = random(3*r, height-(3*r));
  }
  
  void respawn() {
   x = random(3*r, width-(3*r));
   y = random(3*r, height-(3*r));
   menorahs++;
  }
  
  void show() {
   stroke(255, 255, 0);
   strokeWeight(1);
   line(x, y+(3*r), x, y-(3*r));
   line(x-r, y-(2*r), x+r, y-(2*r));
   line(x-r, y-r, x+r, y-r);
   line(x-r, y, x+r, y);
   line(x-r, y+(3*r), x+r, y+(3*r));
   line(x-(2*r), y-(2*r), x-r, y-r);
   line(x+(2*r), y-(2*r), x+r, y-r);
   line(x-(3*r), y-(2*r), x-r, y);
   line(x+(3*r), y-(2*r), x+r, y);
   line(x-(3*r), y-(3*r), x-(3*r), y-(2*r));
   line(x-(2*r), y-(3*r), x-(2*r), y-(2*r));
   line(x-r, y-(3*r), x-r, y-(2*r));
   line(x, y-(3*r), x, y-(2*r));
   line(x+r, y-(3*r), x+r, y-(2*r));
   line(x+(2*r), y-(3*r), x+(2*r), y-(2*r));
   line(x+(3*r), y-(3*r), x+(3*r), y-(2*r));
  }
};