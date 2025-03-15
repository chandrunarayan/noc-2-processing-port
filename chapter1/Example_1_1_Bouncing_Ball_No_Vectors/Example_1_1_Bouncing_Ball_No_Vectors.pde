// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-1: Bouncing Ball, no vectors
// Variables for position and speed of ball.
float x = 100;
float y = 100;
float dia = 48;
float xspeed = 2.5;
float yspeed = 2;

void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  //background(255);

  // Move the ball according to its speed.
  x += xspeed;
  y += yspeed;

  //Check for bouncing.
  if (x > width-dia/2 || x < dia/2) {
    xspeed *= -1;
  }
  if (y > height-dia/2 || y < dia/2) {
    yspeed *= -1;
  }

  stroke(0);
  fill(127);
  strokeWeight(2);
  //Draw the ball at the position (x,y).
  circle(x, y, dia);
}
