player p;
menorah m;
int enemies = 5;
enemy[] e = new enemy[enemies];
int kills = 0;
int bullets = 25;
int fire = 0;
shot[] s = new shot[bullets];
float vel = 3;
boolean gameover = false;
int menorahs = 0;

void setup() {
 size(600, 600);
 p = new player();
 m = new menorah();
 for (int i = 0; i < bullets; i++) {
   s[i] = new shot();
 }
 for (int i = 0; i < enemies; i++) {
   e[i] = new enemy();
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

void mousePressed() {
 s[fire].reset();
 fire++;
 if (fire == bullets) {
  fire = 0; 
 }
}

void draw() {
  background(0);
    fill(255);
    textAlign(LEFT);
    textSize(15);
    text("Kills", 10, 20);
    text(kills, 60, 20);
    textAlign(RIGHT);
    text("Menorahs", width-50, 20);
    text(menorahs, width-10, 20);
    stroke(255);
    strokeWeight(4);
    noCursor();
    point(mouseX, mouseY);
  if (!(gameover)) {
   p.show();
   p.move();
   m.show();
   if (pow(m.x+(3*m.r)-p.x, 2) + pow(m.y+(3*m.r)-p.y, 2) < pow(p.r, 2)) {
      m.respawn();
    }
    else if (pow(m.x-(3*m.r)-p.x, 2) + pow(m.y+(3*m.r)-p.y, 2) < pow(p.r, 2)) {
      m.respawn();
    }
    else if (pow(m.x-(3*m.r)-p.x, 2) + pow(m.y-(3*m.r)-p.y, 2) < pow(p.r, 2)) {
      m.respawn();
    }
    else if (pow(m.x+(3*m.r)-p.x, 2) + pow(m.y-(3*m.r)-p.y, 2) < pow(p.r, 2)) {
      m.respawn();
    }
    for (int i = 0; i < enemies; i++) {
      e[i].show();
      e[i].move();
      if (pow(e[i].x+e[i].r-p.x, 2) + pow(e[i].y+e[i].r-p.y, 2) < pow(p.r, 2)) {
        gameover = true;
      }
      else if (pow(e[i].x-e[i].r-p.x, 2) + pow(e[i].y+e[i].r-p.y, 2) < pow(p.r, 2)) {
        gameover = true;
      }
      else if (pow(e[i].x-e[i].r-p.x, 2) + pow(e[i].y-e[i].r-p.y, 2) < pow(p.r, 2)) {
        gameover = true;
      }
      else if (pow(e[i].x+e[i].r-p.x, 2) + pow(e[i].y-e[i].r-p.y, 2) < pow(p.r, 2)) {
        gameover = true;
      }
      /*else if (((p.x-p.r < e[i].x+e[i].r) && (p.x > e[i].x+e[i].r)) && (e[i].y-e[i].r > p.y-sqrt(pow(p.r, 2)+pow(p.x-e[i].x-e[i].r, 2)))&&(e[i].y+e[i].r < p.y+sqrt(pow(p.r, 2)+pow(p.x-e[i].x-e[i].r, 2)))) {
        gameover = true;
      }
      else if (((p.y-p.r < e[i].y+e[i].r) && (p.y > e[i].y+e[i].r)) && (e[i].x-e[i].r > p.x-sqrt(pow(p.r, 2)+pow(p.y-e[i].y-e[i].r, 2)))&&(e[i].x+e[i].r < p.x+sqrt(pow(p.r, 2)+pow(p.y-e[i].y-e[i].r, 2)))) {
        gameover = true;
      }      
      else if (((p.x+p.r > e[i].x-e[i].r) && (p.x < e[i].x-e[i].r)) && (e[i].y+e[i].r < p.y+sqrt(pow(p.r, 2)+pow(p.x-e[i].x-e[i].r, 2)))&&(e[i].x-e[i].r > p.y-sqrt(pow(p.r, 2)+pow(p.x-e[i].x-e[i].r, 2)))) {
        gameover = true;
      }      
      else if (((p.y+p.r > e[i].y-e[i].r) && (p.y < e[i].y-e[i].r)) && (e[i].x+e[i].r < p.x+sqrt(pow(p.r, 2)+pow(p.x-e[i].x-e[i].r, 2)))&&(e[i].x-e[i].r > p.x-sqrt(pow(p.r, 2)+pow(p.y-e[i].y-e[i].r, 2)))) {
        gameover = true;
      }*/
    }
    for (int i = 0; i < bullets; i++) {
      s[i].show();
      s[i].move();
      for (int j = 0; j < enemies; j++) {
        if (((s[i].x > e[j].x-e[j].r)&&(s[i].x < e[j].x+e[j].r))&&((s[i].y > e[j].y-e[j].r)&&(s[i].y < e[j].y+e[j].r))) {
          e[j].die();
          s[i].x = width+100;
          s[i].y = height+ 100;
          s[i].vx = 0;
          s[i].vy = 0;
        }
      }
    }
  }
  else {
   textAlign(CENTER);
   textSize(50);
   text("G A M E   O V E R", width/2, height/2);
   textSize(20);
   text("Press space to Jew again", width/2, height/2+100);
   if (keyPressed && key == ' ') {
    gameover = false;
    for (int i = 0; i < enemies; i++) {
      e[i].die();
    }
    for (int i = 0 ; i < bullets; i++) {
      s[i].x = width+100;
      s[i].y = height+100;
      s[i].vx = 0;
      s[i].vy = 0;
    }
    kills = 0;
    menorahs = 0;
    p.x = width/2;
    p.y = height/2;
   }
  }
}