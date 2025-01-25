// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Child class constructor
class Confetti extends Particle {
  
  Confetti (float x, float y) {
    super(x, y);
  }
  // Override the show method
  void show() {
    float angle = map(this.position.x, 0, width, 0, TWO_PI * 2);

    rectMode(CENTER);
    fill(127, this.lifespan);
    stroke(0, this.lifespan);
    strokeWeight(2);
    push();
    translate(this.position.x, this.position.y);
    rotate(angle);
    square(0, 0, 12);
    pop();
  }
}
