// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-2: Bouncing Ball, with PVector!
//Instead of a bunch of floats, we now just have two variables.
// modified by CN 031525

int num=10;
float maxDist = 20;
Ball balls[];

void setup() {
  size(640, 360);
  balls = new Ball[num];
  //Note how PVector() has to be called inside of setup().
  for (int i=0; i<num; i++) {
    float dia = (float)(Math.random()*20)+20;
    float px = (float)Math.random()*(width-dia)+dia/2;
    float py = (float)Math.random()*(height-dia)+dia/2;
    float vx = (float)(Math.random()*4)-1.5;
    float vy = (float)(Math.random()*3)-1.0;
    color clr = color((float)Math.random()*255,
      (float)Math.random()*255,
      (float)Math.random()*255
      );
    balls[i] = new Ball(px, py, vx, vy, dia, clr);
  }
}

void draw() {
  background(255);
  for (int i=0; i<num; i++) {
    Ball b = balls[i];
    b.pos.add(b.vel);

    //We still sometimes need to refer to the individual components of a PVector and can do so using the dot syntax: position.x, velocity.y, etc.
    if (b.pos.x > width-b.dia/2 || b.pos.x < b.dia/2) {
      b.vel.x *= -1;
    }
    if (b.pos.y > height-b.dia/2 || b.pos.y < b.dia/2) {
      b.vel.y *= -1;
    }

    stroke(255);
    fill(b.clr);
    //strokeWeight(2);
    circle(b.pos.x, b.pos.y, b.dia);
  }
}

void mouseClicked() {
  float mx = mouseX;
  float my = mouseY;
  for (int i=0; i<num; i++) {
    Ball b = balls[i];
    if (dist(mx, my, b.pos.x, b.pos.y) <= maxDist) {
      b.clr = color(255.255,255);
    }
  }
}
