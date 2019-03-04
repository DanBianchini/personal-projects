board game;
ally a;
enemy e;
cursor c;

void setup() {
 size(800, 800, P3D);
 game = new board();
 a = new ally(width/16, -width/16);
 e = new enemy(3*width/16, -3*width/16);
 c = new cursor();
}

void draw() {
  noCursor();
  background(200, 200, 255);
  game.show();
  a.show();
  a.showcrown();
  e.show();
  c.show();
  c.move();
}