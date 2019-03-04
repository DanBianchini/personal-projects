/*
 *Author: Dan Bianchini
 *Pledge: I pledge my honor that I have abided by the Stevens honor System
*/

PShape earth;
PShape moon;
int ed = 150;
int md = ed/10;
float angle = 0;
float anglem = 0;
float spin = 0.05;

void setup() {
  size(800, 800, P3D);
  noStroke();
  earth = createShape(SPHERE, ed);
  PImage img = loadImage("earth_1k.jpg");
  earth.setTexture(img);
  
  moon = createShape(SPHERE, md);
  PImage img2 = loadImage("moon.jpg");
  moon.setTexture(img2);
}

void draw() {
  background(0);
  translate(width/2, height/2, -400);
  
  pushMatrix();
  rotateZ(23.5*PI/180);
  rotateY(angle);
  shape(earth);
  angle += spin;
  popMatrix();
  
  pushMatrix();
  rotateZ(anglem);
  translate(4*ed, 0);
  shape(moon);
  anglem += spin/28.5;
  popMatrix();
}