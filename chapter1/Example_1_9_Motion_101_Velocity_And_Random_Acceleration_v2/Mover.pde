

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover{
  PVector pos, vel, acc;
  float topSpeed, dia;
  color clr;
  
  Mover(){
    float d = (float)(Math.random()*5)+(float)Math.random()*maxSz;
    float px = (float)Math.random()*(width-dia)+dia/2;
    float py = (float)Math.random()*(height-dia)+dia/2;
    float vx = (float)(Math.random()*4)-1.5;
    float vy = (float)(Math.random()*3)-1.0;
    color c = color((float)Math.random()*255,
      (float)Math.random()*255,
      (float)Math.random()*255
      );   
    dia = d;
    clr = c;
    pos = new PVector(px, py);
    vel = new PVector(vx, vy);
    this.acc = new PVector();
    this.topSpeed = 5;
  }

  void update() {
    // The random2D() function returns a unit vector pointing in a random direction.
    this.acc = PVector.random2D();
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
