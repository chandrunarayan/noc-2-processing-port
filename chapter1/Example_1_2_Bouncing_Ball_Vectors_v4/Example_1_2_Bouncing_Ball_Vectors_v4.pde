// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-2: Bouncing Ball, with PVector!
//Instead of a bunch of floats, we now just have two variables.
// modified by CN 031525

PFont f;
float stop;
boolean isStopSet = false;
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
  
  removeDead();
  
  instruct();

  for (int i=0; i<balls.size(); i++) {
    Ball b = balls.get(i);
    b.update();
    b.checkBounce();
    b.show();
  }
}

void instruct() {
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

}

void setStop(float value) {
  if (!isStopSet) {
    stop = value;
    isStopSet = true;
  }
}

void removeDead() {
  // Remove any dead balls
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (!b.liv) balls.remove(b);
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
