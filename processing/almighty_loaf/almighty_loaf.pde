PShape loaf;
float w = 700;
float h = 600;
float angle = 0;
final float spin = 0.05;

void setup() {
  size(800, 700, P3D);
  noStroke();
  loaf = createShape(RECT, -w/2, -h/2, w, h);
  PImage img = loadImage("loaf.jpg");
  loaf.setTexture(img);
}

void draw() {
  PImage img = loadImage("loaf.jpg");
  img.resize(width, height);
  background(img);
  translate(width/2, height/2, -400);
  pushMatrix();
  rotateY(angle);
  shape(loaf);
  angle += spin;
  popMatrix();
}