/*
 * Author: Dan Bianchini
 * Pledge: I pledge my honor that I have abided by the Stevens Honor System
*/

int n = 8;
int box;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  grid();
}

void grid() {
  stroke(0);
  box = width/n;
  
  for (int i = 0; i < n; i++) {
    line(i*box, 0, i*box, height);
    line(0, i*box, width, i*box);
  }
  
  fill(255);
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (i % 2 != j % 2)
        rect(i*box, j*box, box, box);
    }
  }
}

void mousePressed() {
  fill(255, 0, 0);
  ellipse(mouseX/box*box + box/2, mouseY/box*box+ box/2, box, box);
}