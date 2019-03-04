int cols, rows;
int scl = 20;
int w = 1200;
int h = 900;
float[][] terrain;
float flying = 0;
plane p;
enemy swas;
int bullets = 30;
phaser[] shot = new phaser[bullets];
int fire = 0;

void mouseClicked() {
 shot[fire].reset();
 fire++;
 if (fire == bullets) {
  fire = 0; 
 }
}

void setup() {
 size(600, 600, P3D);
 cols = w / scl;
 rows = h / scl;
 terrain = new float[cols][rows];
 float yoff = 0;
 for (int j = 0; j < rows; j++) {
   float xoff = 0;
  for (int i = 0; i < cols; i++) {
   terrain[i][j] = map(noise(xoff, yoff), 0, 1, -100, 100); 
   xoff += 0.15;
  }
  yoff += 0.15;
 }
 p = new plane();
 swas = new enemy();
 for (int i = 0; i < bullets; i++) {
  shot[i] = new phaser(); 
 }
}

void draw() {
 noCursor();
 background(180, 180, 255);
 stroke(0);
 fill(0, 100, 0);
 
  flying -= 0.05;
 
 float yoff = flying;
 for (int j = 0; j < rows; j++) {
   float xoff = 0;
  for (int i = 0; i < cols; i++) {
   terrain[i][j] = map(noise(xoff, yoff), 0, 1, -100, 100); 
   xoff += 0.15;
  }
  yoff += 0.15;
 }
 
  translate(width/2, height/2);
 rotateX(PI/3);
 translate(-w/2, -h/2);
 
 for (int y = 0; y < rows-1; y++) {
   beginShape(TRIANGLE_STRIP);
  for (int x = 0; x < cols; x++) {
    vertex(x*scl, y*scl, terrain[x][y]);
    vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
  }
  endShape();
 }
 
 swas.show();
 swas.move();
 p.show();
 p.move();
 for (int i = 0; i < bullets; i++) {
   shot[i].show();
   shot[i].move();
 }
 
}