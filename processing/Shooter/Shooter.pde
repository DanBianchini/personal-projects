Player p;
int numbullets = 20;
Bullet[] bullets = new Bullet[numbullets];
int count = 0;

void setup() {
  size(600,600);
  p = new Player();
  for (int i = 0; i < numbullets; i++) {
    bullets[i] = new Bullet();
  }
}

void draw() {
  background(0);
  p.show();
  p.move();
  for (int i = 0; i < numbullets; i++) {
    bullets[i].show();
    bullets[i].move();
  }
}

void keyPressed() {
  if (key == 'w') {
    p.up = true;
  }
  else if (key == 's') {
    p.down = true;
  }
  
  if (key == 'a') {
    p.left = true;
  }
  else if (key == 'd') {
    p.right = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    p.up = false;
  }
  else if (key == 's') {
    p.down = false;
  }
  
  if (key == 'a') {
    p.left = false;
  }
  else if (key == 'd') {
    p.right = false;
  }
}

void mousePressed() {
  bullets[count] = new Bullet(p.x, p.y);
  count++;
  count = count % numbullets;
}