float len = 200;

void setup() {
 size(600, 600, P3D);
}

float spin = 0;
void draw() {
 translate(width/2, height/2);
 background(0);
 stroke(255);
 
 if (mousePressed) {
  fill(100);
 }
 else {
  noFill();
 }
 
 rotateY(spin);
 spin += 0.01;
 
 for (float z = -(len/2); z <= len/2; z += len) {
  beginShape();
  vertex(-(len/2), -(len/2), z);
  vertex((len/2), -(len/2), z);
  vertex((len/2), (len/2), z);
  vertex(-(len/2), (len/2), z);
  vertex(-(len/2), -(len/2), z);
  endShape();
 }
 
 for (float y = -(len/2); y <= len/2; y += len) {
  beginShape();
  vertex(-(len/2), y, -(len/2));
  vertex((len/2), y, -(len/2));
  vertex((len/2), y, (len/2));
  vertex(-(len/2), y, (len/2));
  vertex(-(len/2), y, -(len/2));
  endShape();
 }
 
 for (float x = -(len/2); x <= len/2; x += len) {
  beginShape();
  vertex(x, -(len/2), -(len/2));
  vertex(x, (len/2), -(len/2));
  vertex(x, (len/2), (len/2));
  vertex(x, -(len/2), (len/2));
  vertex(x, -(len/2), -(len/2));
  endShape();
 }
}