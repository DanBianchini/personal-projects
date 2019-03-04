int instances;
obstacle[] o;
int count = 0;
//initial position of player
float x = 80;
float y = 60;
float z = 0;
player p;
boolean gameover = false;
int score = 0;
float tolerance = 20;
boolean gamestart = false;

void setup() {
 size(800, 400, P3D);
 instances = width/200;
 o = new obstacle[instances];
 for (int i = 0; i < instances; i++) {
  o[i] = new obstacle();
  count++;
  p = new player();
 }
}

void draw() {
 background(0);
 stroke(255);
 
 fill(80);
 
 //bottom
 beginShape();
 vertex(0, height, 0);
 vertex(width, height, 0);
 vertex(width, height, -300);
 vertex(0, height, -300);
 vertex(0, height, 0);
 endShape();
 
 //top
 beginShape();
 vertex(0, 0, 0);
 vertex(width, 0, 0);
 vertex(width, 0, -300);
 vertex(0, 0, -300);
 vertex(0, 0, 0);
 endShape();
 
 //back
 beginShape();
 vertex(0, 0, -300);
 vertex(0, height, -300);
 vertex(width, height, -300);
 vertex(width, 0, -300);
 vertex(0, 0, -300);
 endShape();
 
 //left
 beginShape();
 vertex(0, 0, 0);
 vertex(0, 0, -300);
 vertex(0, height, -300);
 vertex(0, height, 0);
 vertex(0, 0, 0);
 endShape();
 
 //right
 beginShape();
 vertex(width, 0, 0);
 vertex(width, 0, -300);
 vertex(width, height, -300);
 vertex(width, height, 0);
 vertex(width, 0, 0);
 endShape();
 if (!gamestart) {
   fill(255);
   textSize(32);
   textAlign(CENTER, CENTER);
   text("Press any key to start", width/2, height/2, 0);
   if (keyPressed) {
     gamestart = true;
   }
 }
 
 else {
   if (y <= 0) {
    y = 0; 
   }
   
   if (!gameover) {  
    for (int i = 0; i < o.length; i++) {
     o[i].move();
     o[i].show();
    }
    p.fall();
    if (keyPressed) {
     p.fly(); 
    }
   }
   else {
     fill(255);
     textSize(50);
     textAlign(CENTER, CENTER);
     text("GAME OVER", width/2, height/2, 0);
     textSize(30);
     text("Press any key to try again", width/2, height/2 - 100, 0);
     if (keyPressed) {
       gameover = false;
       y = 60;
     }
   }
 
 for (int i = 0; i < o.length; i++) {
  if (((y + p.p1.r > o[i].h || y - p.p1.r < o[i].h - o[i].leeway) && (o[i].x - o[i].r <= x + p.p1.r && o[i].x + o[i].r >= x - p.p1.r))) {
    gameover = true;
  }
  else if (x - p.p1.r >= o[i].x + o[i].r) {
    score++;
  }
 }
  
  if (height - y <= p.p1.r) {
    gameover = true;
  }
  
  String s = "Score: " + str(score/32);
  textSize(15);
  textAlign(CENTER, CENTER);
  fill(0);
  text(s, width/2, 20, 0);
 }
 
 noFill();
 p.show();
}