// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Arriving "vehicle" follows the mouse position

// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "arrive"
// See: http://www.red3d.com/cwr/

Vehicle vehicle;

void setup() {
  size(640, 360);
  vehicle = new Vehicle(width / 2, height / 2);
}

void draw() {
  background(255);
  PVector mouse = new PVector(mouseX, mouseY);

  // Draw an ellipse at the mouse position
  fill(127);
  stroke(0);
  strokeWeight(2);
  circle(mouse.x, mouse.y, 48);

  // Call the appropriate steering behaviors for our agents
  vehicle.arrive(mouse);
  vehicle.update();
  vehicle.show();
}

void mousePressed(){
  save("screenshot.png");
}
