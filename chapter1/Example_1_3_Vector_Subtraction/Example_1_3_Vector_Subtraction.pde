// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-3: Vector subtraction

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  
  // Two vectors, one for the mouse position and one for the center of the window
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width / 2, height / 2);
  
  // Draw the original two vectors
  strokeWeight(4);
  stroke(200);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, center.x, center.y);

  // Vector subtraction!
  mouse.sub(center);

  // Draw a line to represent the result of subtraction.
  // Notice how I move the origin with translate() to place the vector
  stroke(0);
  translate(width / 2, height / 2);
  line(0, 0, mouse.x, mouse.y);
}
