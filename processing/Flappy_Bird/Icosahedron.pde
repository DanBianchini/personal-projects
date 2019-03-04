class icosahedron {
  float edge = 10;
  float r = edge*sin((2*PI)/5);

  void show() {
    //bottom
    for (float angle = 0; angle < 2*PI; angle += (2*PI)/5) {
     beginShape(TRIANGLE);
     vertex(x, y + r, 0);
     vertex(x + (r*cos(angle)), y + (edge*sin(PI/3))/2,  r*sin(angle));
     vertex(x + (r*cos(angle+((2*PI)/5))), y + (edge*sin(PI/3))/2, r*sin(angle+((2*PI)/5)));
     endShape();
    }
    
    //top
    for (float angle = PI; angle < 3*PI; angle += (2*PI)/5) {
     beginShape(TRIANGLE);
     vertex(x, y - r, 0);
     vertex(x + (r*cos(angle)), y - (edge*sin(PI/3))/2,  r*sin(angle));
     vertex(x + (r*cos(angle+((2*PI)/5))), y - (edge*sin(PI/3))/2, r*sin(angle+((2*PI)/5)));
     endShape();
    }
    
    //middle top
    for (float angle = PI; angle < 3*PI; angle += (2*PI)/5) {
     beginShape(TRIANGLE);
     vertex(x + (r*cos(angle)), y - (edge*sin(PI/3))/2,  r*sin(angle));
     vertex(x + (r*cos(angle+((2*PI)/5))), y - (edge*sin(PI/3))/2, r*sin(angle+((2*PI)/5)));
     vertex(x + (r*cos(angle + PI/5)), y + (edge*sin(PI/3))/2, r*sin(angle + PI/5));
     endShape();
    }
    
    //middle bottom
    for(float angle = 0; angle < 2*PI; angle += (2*PI)/5) {
     beginShape(TRIANGLE);
     vertex(x + (r*cos(angle)), y + (edge*sin(PI/3))/2,  r*sin(angle));
     vertex(x + (r*cos(angle+((2*PI)/5))), y + (edge*sin(PI/3))/2, r*sin(angle+((2*PI)/5)));
     vertex(x + (r*cos(angle + PI/5)),y - (edge*sin(PI/3))/2, r*sin(angle + PI/5));
     endShape();
    }
  }
};