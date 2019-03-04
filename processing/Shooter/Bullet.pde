class Bullet {
  float x, y, vx, vy;
  float leng = 5;
  float v = 5;
  
  Bullet() {
    x = -100;
    y = -100;
    vx = 0;
    vy = 0;
  }
  
  Bullet(int i, int j) { //constructor: i and j are the x and y of the player's current position, respectively
    x = i;
    y = j;
    vx = v * (mouseX - i) / sqrt(pow(mouseY - j, 2) + pow(mouseX - i, 2));
    vy = v * (mouseY - j) / sqrt(pow(mouseY - j, 2) + pow(mouseX - i, 2));
  }
  
  void show() {
    ellipseMode(CENTER);
    ellipse(x, y, 3, 3);
  }
  
  void move() {
    x += vx;
    y += vy;
  }
}