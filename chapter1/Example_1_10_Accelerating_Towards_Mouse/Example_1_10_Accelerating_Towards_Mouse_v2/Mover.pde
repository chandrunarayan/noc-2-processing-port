

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover{
  PVector pos, vel, acc;
  float topSpeed, dia;
  color clr;
  boolean liv;
  
  Mover(){
    float d = (float)(Math.random()*5)+(float)Math.random()*20;
    float px = (float)Math.random()*(width-dia)+dia/2;
    float py = (float)Math.random()*(height-dia)+dia/2;
    float vx = (float)(Math.random()*3)-1.0;
    float vy = (float)(Math.random()*3)-1.0;
    float ax = (float)(Math.random()*3)-1.0;
    float ay = (float)(Math.random()*3)-1.0;
    color c = color((float)Math.random()*255,
      (float)Math.random()*255,
      (float)Math.random()*255
      );   
    dia = d;
    clr = c;
    pos = new PVector(px, py);
    vel = new PVector(vx/2, vy/2);
    acc = new PVector(ax/2, ay/2);
    liv = true;
    this.topSpeed = 2.0;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    // Step 1: Compute direction
    PVector dir = PVector.sub(mouse, this.pos);
    
    // The random2D() function returns a unit vector pointing in a random direction.
    // this.acc = PVector.random2D();
    dir.normalize();
    dir.mult(0.2);
    this.acc = dir;
    this.acc.mult(random(2));

    this.vel.add(this.acc);
    this.vel.limit(this.topSpeed);
    this.pos.add(this.vel);
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(clr);
    circle(this.pos.x, this.pos.y, dia);
  }

  void checkBounce() {
    //We still sometimes need to refer to the individual components of a PVector and can do so using the dot syntax: position.x, velocity.y, etc.
    if (pos.x > width-dia/2 || pos.x < dia/2) {
      vel.x *= -1;
    }
    if (pos.y > height-dia/2 || pos.y < dia/2) {
      vel.y *= -1;
    }    
  }

}
