int balls = 1;
ball[] b = new ball[balls];
float rball = 15;
float distance = 30;

void mouseClicked() {
  for (int i = 0; i < balls; i++) {
   if (i != 0) {
    if (sqrt(pow(b[i-1].x-b[i].x, 2)+pow(b[i-1].y-b[i].y, 2)) >= ) {
      
    }
   }
  }
}

void setup() {
  size(600, 600);
  b[0] = new ball(width/2, height-rball);
}

void draw() {
  background(0);
  for (int i = 0; i < balls; i++) {
    b[i].show();
  }
  
}