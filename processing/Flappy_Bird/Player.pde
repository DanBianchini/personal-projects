class player {;
  icosahedron p1;
  float g = 0.8;
  float yspeed;
  float wing1 = 10;
  float wing2 = 10;
  
  player() {
   p1 = new icosahedron();
   yspeed = 0;
  }
  
  void fall() {
    y += yspeed;
    yspeed += g;
    
  }
  
  void show() {
    fill(0);
    stroke(255);
    p1.show();
    if (yspeed > 7) {
       //right wing top
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((9*PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((9*PI)/5));
      vertex(x + (p1.r*cos((8*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((8*PI)/5));
      vertex(x + (p1.r*cos((9*PI)/5)),  y - (p1.edge*sin(PI/3))/2 - 7, p1.r*sin((9*PI)/5) + wing1);
      endShape();
      
      //right wing tip
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((8*PI)/5)), y + (p1.edge*sin(PI/3))/2 - 3.5*7, p1.r*sin((8*PI)/5) + wing2);
      vertex(x + (p1.r*cos((8*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((8*PI)/5));
      vertex(x + (p1.r*cos((9*PI)/5)),  y - (p1.edge*sin(PI/3))/2 - 7, p1.r*sin((9*PI)/5) + wing1);
      endShape();
      
      //left wing top
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((PI)/5));
      vertex(x + (p1.r*cos((2*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((2*PI)/5));
      vertex(x + (p1.r*cos((PI)/5)), y - (p1.edge*sin(PI/3))/2 - 7,  p1.r*sin((PI)/5) - wing1);
      endShape();
      
       //right wing tip
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((2*PI)/5)), y + (p1.edge*sin(PI/3))/2 - 3.5*7, p1.r*sin((2*PI)/5) - wing2);
      vertex(x + (p1.r*cos((2*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((2*PI)/5));
      vertex(x + (p1.r*cos((PI)/5)),  y - (p1.edge*sin(PI/3))/2 - 7, p1.r*sin((PI)/5) - wing1);
      endShape();
      
      //tail
      beginShape();
      vertex(x - p1.r, y - (p1.edge*sin(PI/3))/2,  0);
      vertex(x - p1.r - 7, y - (p1.edge*sin(PI/3))/2 - 0.75*7,  0);
      vertex(x - p1.r - 15, y - (p1.edge*sin(PI/3))/2 - 2*7,  0);
      vertex(x - p1.r - 10, y - (p1.edge*sin(PI/3))/2 + 5 - 7,  0);
      vertex(x - p1.r, y + (p1.edge*sin(PI/3))/2,  0);
      vertex(x - p1.r, y - (p1.edge*sin(PI/3))/2,  0);
      endShape();
    }
    
    else {
      //right wing top
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((9*PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((9*PI)/5));
      vertex(x + (p1.r*cos((8*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((8*PI)/5));
      vertex(x + (p1.r*cos((9*PI)/5)),  y - (p1.edge*sin(PI/3))/2 - yspeed, p1.r*sin((9*PI)/5) + wing1);
      endShape();
      
      //right wing tip
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((8*PI)/5)), y + (p1.edge*sin(PI/3))/2 - 3.5*yspeed, p1.r*sin((8*PI)/5) + wing2);
      vertex(x + (p1.r*cos((8*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((8*PI)/5));
      vertex(x + (p1.r*cos((9*PI)/5)),  y - (p1.edge*sin(PI/3))/2 - yspeed, p1.r*sin((9*PI)/5) + wing1);
      endShape();
      
      //left wing top
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((PI)/5));
      vertex(x + (p1.r*cos((2*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((2*PI)/5));
      vertex(x + (p1.r*cos((PI)/5)), y - (p1.edge*sin(PI/3))/2 - yspeed,  p1.r*sin((PI)/5) - wing1);
      endShape();
      
       //right wing tip
      beginShape(TRIANGLE);
      vertex(x + (p1.r*cos((2*PI)/5)), y + (p1.edge*sin(PI/3))/2 - 3.5*yspeed, p1.r*sin((2*PI)/5) - wing2);
      vertex(x + (p1.r*cos((2*PI)/5)), y + (p1.edge*sin(PI/3))/2,  p1.r*sin((2*PI)/5));
      vertex(x + (p1.r*cos((PI)/5)),  y - (p1.edge*sin(PI/3))/2 - yspeed, p1.r*sin((PI)/5) - wing1);
      endShape();
      
      //tail
      beginShape();
      vertex(x - p1.r, y - (p1.edge*sin(PI/3))/2,  0);
      vertex(x - p1.r - 7, y - (p1.edge*sin(PI/3))/2 - 0.75*yspeed,  0);
      vertex(x - p1.r - 15, y - (p1.edge*sin(PI/3))/2 - 2*yspeed,  0);
      vertex(x - p1.r - 10, y - (p1.edge*sin(PI/3))/2 + 5 - yspeed,  0);
      vertex(x - p1.r, y + (p1.edge*sin(PI/3))/2,  0);
      vertex(x - p1.r, y - (p1.edge*sin(PI/3))/2,  0);
      endShape();
    }
    
    //beak top
    beginShape(TRIANGLE);
    vertex(x + (p1.r*cos((9*PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((9*PI)/5));
    vertex(x + (p1.r*cos((PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((PI)/5));
    vertex(x + p1.r + 10, y - (p1.edge*sin(PI/3))/2,  0);
    endShape();
    
    //beak right
    beginShape(TRIANGLE);
    vertex(x + p1.r, y + (p1.edge*sin(PI/3))/2, 0);
    vertex(x + (p1.r*cos((9*PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((9*PI)/5));
    vertex(x + p1.r + 10, y - (p1.edge*sin(PI/3))/2,  0);
    endShape();
    
    //beak left
    beginShape(TRIANGLE);
    vertex(x + p1.r, y + (p1.edge*sin(PI/3))/2, 0);
    vertex(x + (p1.r*cos((PI)/5)), y - (p1.edge*sin(PI/3))/2,  p1.r*sin((PI)/5));
    vertex(x + p1.r + 10, y - (p1.edge*sin(PI/3))/2,  0);
    endShape();
    
    //beak tip
    beginShape(TRIANGLE);
    vertex(x + p1.r, y + (p1.edge*sin(PI/3))/2, 0);
    vertex(x + p1.r + 10, y - (p1.edge*sin(PI/3))/2, 0);
    vertex(x + p1.r + 15, y + (p1.edge*sin(PI/3))/2 + 7, 0);
    endShape();
  }
  
  void fly() {
   yspeed = -5.5; 
  }
};