// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Recursive Tree
// Renders a simple tree-like structure via recursion
// Branching angle calculated as a function of horizontal mouse position

float angle;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  // Mapping the angle between 0 to 90° (HALF_PI) according to mouseX
  angle = map(mouseX, 0, width, 0, HALF_PI);

  // Start the tree from the bottom of the canvas
  translate(width / 2, height);
  stroke(0);
  strokeWeight(2);
  branch(100);
}

//{!1} Each branch now receives its length as an argument.
void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);

  //{!1} Each branch's length shrinks by two-thirds.
  len *= 0.67;

  if (len > 2) {
    push();
    rotate(angle);
    //{!1} Subsequent calls to branch() include the length argument.
    branch(len);
    pop();

    push();
    rotate(-angle);
    branch(len);
    pop();
  }
}