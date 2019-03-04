PShape paul;
float w = 500;
float h = 500;
float x = 0;
float y = 0;
float angle = 0;
float speed = 0.05;
float spin = 0.03;

void setup() {
  size(800, 800, P3D);
  stroke(255);
  paul = createShape(RECT, -w/2, -h/2, w, h);
  PImage img = loadImage("paul.jpg");
  paul.setTexture(img);
}

void draw() {
  PImage img = loadImage("paul.jpg");
  img.resize(width, height);
  background(img);
  noStroke();
  translate(width/2, height/2);
  pushMatrix();
  rotateY(angle);
  shape(paul, x, y);
  popMatrix();
  angle += spin;
}