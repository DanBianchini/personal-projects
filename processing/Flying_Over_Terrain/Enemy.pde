class enemy {
  float big = 30;
  float x = width; //random(width/2 + big + (width*(1 - p.scale))/2, (3*width)/2 - big - (width*(1 - p.scale))/2);
  float y = -1000; //p.y + big;
  float z = 500;
  float thick = 10;
  float xspeed = 5;
  float zspeed = 0.5;
  float lri = random(1,3);
  
  void show() {
    fill(255, 0, 0);
    stroke(0);
   /*for (float i = -thick/2; i <= thick/2; i += thick) {
     beginShape();
     vertex((x - thick/2), y + i, (z + thick/2));
     vertex((x - thick/2), y + i, (z + big));
     vertex((x + big), y + i, (z + big));
     vertex((x + big), y + i, (z + big - thick));
     vertex((x + thick/2), y + i, (z + big - thick));
     vertex((x + thick/2), y + i, (z + thick/2));
     vertex((x + big), y + i, (z + thick/2));
     vertex((x + big), y + i, (z - big));
     vertex((x + big - thick), y + i, (z - big));
     vertex((x + big - thick), y + i, (z - thick/2));
     vertex((x + thick/2), y + i, (z - thick/2));
     vertex(x + thick/2, y + i, z - big);
     vertex(x - big, y + i, z - big);
     vertex(x - big, y + i, z - big + thick);
     vertex(x - thick/2, y + i, z - big + thick);
     vertex(x - thick/2, y + i, z - thick/2);
     vertex(x - big, y + i, z - thick/2);
     vertex(x - big, y + i, z + big);
     vertex(x - big + thick, y + i, z + big);
     vertex(x - big + thick, y + i, z + thick/2);
     vertex(x - thick/2, y + i, z + thick/2);
     endShape();
   }
   */
   beginShape();
   vertex(x + big, y, z + big);
   vertex(x + big, y, z - big);
   vertex(x - big, y, z - big);
   vertex(x - big, y, z + big);
   vertex(x + big, y, z + big);
   endShape();
  }
  
  void move() {    
    if (x - big <= width/2) {
     x = width/2; 
    }
    else if (x + big >= (3*width)/2) {
      x = (3*width)/2;
    }
    
    y += 1;
    
    //z -= zspeed;
  }
};