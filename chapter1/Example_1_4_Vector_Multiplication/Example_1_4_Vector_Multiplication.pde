// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-4: Vector multiplication

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width / 2, height / 2);
  mouse.sub(center);

  translate(width / 2, height / 2);
  strokeWeight(2);
  stroke(200);
  line(0, 0, mouse.x, mouse.y);

  //{!1} Multiplying a vector!  The vector is now half its original size (multiplied by 0.5).
  mouse.mult(0.5);

  stroke(0);
  strokeWeight(4);
  line(0, 0, mouse.x, mouse.y);
}
