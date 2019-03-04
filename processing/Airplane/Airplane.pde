int cols = 60;
int rows = 60;
float w = 1200;
float h = 800;
float[][] terrain;
float scl = 0.075;
float flying = 0;
float flyspeed = 0.1;
player p;
enemy e;
int bullets = 20;
phaser[] shot = new phaser[bullets];
int fire = 0;
boolean falling = false;

void mouseClicked() {
  shot[fire].reset();
  fire++;
  if (fire == bullets) {
   fire = 0; 
  }
}

void setup() {
  size(800, 800, P3D);
  p = new player();
 
  e = new enemy();
  
  terrain = new float[cols][rows];
  for (int j = 0; j < rows; j++) {
   for (int i = 0; i <cols; i++) {
     terrain[i][j] = map(noise(i*scl, j*scl), 0, 1, -200, 100);
   }
  }
  
  for (int i = 0; i < bullets; i++) {
   shot[i] = new phaser(); 
  }
}

void draw() {
  translate(width/2, height/2, 100);
  rotateX(PI/3);
  noCursor();
  background(150, 150, 255);
  stroke(0);
  fill(0, 80, 0);
  for (int j = 0; j < rows -1; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < cols; i++) {
      vertex((w/cols)*i - w/2, (h/rows)*j - h/2, terrain[i][j]);
      vertex((w/cols)*i - w/2, (h/rows)*(j + 1) - h/2, terrain[i][j + 1]);
    }
    endShape();
  }
  
  for (int j = 0; j < rows; j++) {
   for (int i = 0; i <cols; i++) {
     terrain[i][j] = map(noise(i*scl, j*scl + flying), 0, 1, -100, 100);
   }
  }
  flying -= flyspeed;
  
  p.show();
  p.move();
  
  for (int i = 0; i < bullets; i++) {
    shot[i].move();
    if (!falling) {
     shot[i].show();
    }
    if (((e.x-e.r <= shot[i].x && shot[i].x <= e.x+e.r) && (shot[i].y <= e.y && e.y <= shot[i].y + shot[i].len)) || falling) {
      if (e.z + e.r > -200) {
        falling = true;
      }
      else {
       falling = false;
       e.z = p.z;
       e.fall = 0;
      }
      e.hit();
      e.show();
    }
  }
  
  if (!falling) {
   e.show();
   e.move();
  }
}