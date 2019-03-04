class board {
  void show() {
    stroke(0);
    for (int j = 0; j < 8; j++) {
     for (int i = 0; i < 8; i++) {
      if ((i+j)%2==0) {
       fill(200);
      }
      else {
       fill(80); 
      }
      beginShape();
      vertex((width/8)*i, height, -(width/8)*j);
      vertex((width/8)*(i+1), height, -(width/8)*j);
      vertex((width/8)*(i+1), height, -(width/8)*(j+1));
      vertex((width/8)*i, height, -(width/8)*(j+1));
      vertex((width/8)*i, height, -(width/8)*j);
      endShape();
     }
    }
  }
};