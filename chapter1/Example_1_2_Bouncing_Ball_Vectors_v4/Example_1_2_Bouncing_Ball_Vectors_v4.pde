// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-2: Bouncing Ball, with PVector!
//Instead of a bunch of floats, we now just have two variables.
// modified by CN 031525

PFont f;
float stop;
boolean isStopSet = false;

void setStop(float value) {
  if (!isStopSet) {
    stop = value;
    isStopSet = true;
  }
}

int num=5;
float maxDist = 20;
ArrayList<Ball> balls;

void setup() {
  size(640, 360);
  f = createFont("Serif", 16, true); // Create Font
  balls = new ArrayList<Ball>();
  //Note how PVector() has to be called inside of setup().
  for (int i=0; i<num; i++) {
    Ball aBall = new Ball();
    balls.add(aBall);
  }
}

void draw() {
  background(255);
  // Remove any dead balls
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (!b.liv) balls.remove(b);
  }

  if ( balls.size() <= 0) {
    setStop(millis());
    textFont(f, 16);
    fill(255, 0, 0);
    text("You got'em all in " + stop/1000 + " seconds !!", 10, 100);
  } else {
    textFont(f, 16);
    fill(255, 0, 255);
    String s = "Click inside a Ball to remove it: " + balls.size() + " remaining";
    text(s, 10, 100);
  }

  for (int i=0; i<balls.size(); i++) {
    Ball b = balls.get(i);
    b.pos.add(b.vel);

    //We still sometimes need to refer to the individual components of a PVector and can do so using the dot syntax: position.x, velocity.y, etc.
    if (b.pos.x > width-b.dia/2 || b.pos.x < b.dia/2) {
      b.vel.x *= -1;
    }
    if (b.pos.y > height-b.dia/2 || b.pos.y < b.dia/2) {
      b.vel.y *= -1;
    }

    stroke(0);
    fill(b.clr);
    strokeWeight(2);
    circle(b.pos.x, b.pos.y, b.dia);
  }
}

void mouseClicked() {
  float mx = mouseX;
  float my = mouseY;
  for (int i=0; i<balls.size(); i++) {
    Ball b = balls.get(i);
    if (dist(mx, my, b.pos.x, b.pos.y) <= maxDist) {
      b.liv = false;
    }
  }
}
