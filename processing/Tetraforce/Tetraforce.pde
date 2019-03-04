float r = 100;
tetrahedron[] a;

void setup() {
  size(600, 600, P3D);
  a = new tetrahedron[4];
  int i = 0;
  for (float theta = 0; theta < 2*PI; theta += 2*PI/3) {
    a[i] = new tetrahedron(r*cos(theta), r*sin(theta), -r*cos(PI/3));
    i++;
  }
  a[3] = new tetrahedron(0, 0, r);
}

void draw() {
  translate(width/2, height/2);
  background(255);
  stroke(0);
  fill(255, 230, 0);
  rotateX(-mouseY*(4*PI/height));
  rotateY(-mouseX*(4*PI/width));
  for (int i = 0; i < 4; i++) {
    a[i].show();
  }
}