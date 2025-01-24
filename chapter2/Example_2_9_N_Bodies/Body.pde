// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Body {
  float mass;
  PVector position,velocity,acceleration;
  
  Body(float x, float y, float m) {
    this.mass = m;
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  void update() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(127, 127);
    circle(this.position.x, this.position.y, this.mass * 16);
  }

  PVector attract(Body other) {
    // Calculate direction of force
    PVector force = PVector.sub(this.position, other.position);
    // Distance between objects
    float distance = force.mag();
    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    distance = constrain(distance, 5, 25);

    // Calculate gravitional force magnitude
    float strength = (G * this.mass * other.mass) / (distance * distance);
    // Get force vector --> magnitude * direction
    force.setMag(strength);
    return force;
  }
}
