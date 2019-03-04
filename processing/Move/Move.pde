player p;
int bullets = 50;
int fire = 0;
shot[] s = new shot[bullets];
float vel = 3;

void setup() {
 size(600, 600);
 p = new player();
 for (int i = 0; i < bullets; i++) {
   s[i] = new shot();
 }
}

void keyPressed() {
 if (key == 'w') {
  p.yv = -vel; 
 }
 else if (key == 's') {
  p.yv = vel; 
 }
 else if (key == 'a') {
  p.xv = -vel; 
 }
 else if (key == 'd') {
  p.xv = vel; 
 }
}

void keyReleased() {
 if (key == 'w' || key == 's') {
  p.yv = 0; 
 }
 else if (key == 'a' || key == 'd') {
   p.xv = 0;
 }
}

void mousePresseda() {
 s[fire].reset();
 fire++;
 if (fire == bullets) {
  fire = 0; 
 }
}

void draw() {
  background(0);
  stroke(255, 0, 0);
  fill(80);
  strokeWeight(4);
  noCursor();
  point(mouseX, mouseY);
  p.show();
  p.move();
  for (int i = 0; i < bullets; i++) {
    s[i].show();
    s[i].move();
  }
}