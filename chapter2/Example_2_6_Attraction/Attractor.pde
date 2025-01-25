// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An object for a draggable attractive body in our world

class Attractor {
  PVector position, dragOffset;
  float mass;
  boolean dragging, rollover;
  
  Attractor() {
    this.position = new PVector(width / 2, height / 2);
    this.mass = 20;
    this.dragOffset = new PVector(0, 0);
    this.dragging = false;
    this.rollover = false;
  }

  PVector attract(Mover mover) {
    // Calculate direction of force
    PVector force = PVector.sub(this.position, mover.position);
    // Distance between objects
    float distance = force.mag();
    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    distance = constrain(distance, 5, 25);

    // Calculate gravitional force magnitude
    float strength = (G * this.mass * mover.mass) / (distance * distance);
    // Get force vector --> magnitude * direction
    force.setMag(strength);
    return force;
  }

  // Method to display
  void show() {
    strokeWeight(4);
    stroke(0);
    if (this.dragging) {
      fill(50);
    } else if (this.rollover) {
      fill(100);
    } else {
      fill(175, 200);
    }
    circle(this.position.x, this.position.y, this.mass * 2);
  }

  // The methods below are for mouse interaction
  void handlePress(float mx, float my) {
    float d = dist(mx, my, this.position.x, this.position.y);
    if (d < this.mass) {
      this.dragging = true;
      this.dragOffset.x = this.position.x - mx;
      this.dragOffset.y = this.position.y - my;
    }
  }

  void handleHover(float mx, float my) {
    float d = dist(mx, my, this.position.x, this.position.y);
    if (d < this.mass) {
      this.rollover = true;
    } else {
      this.rollover = false;
    }
  }

  void stopDragging() {
    this.dragging = false;
  }

  void handleDrag(float mx, float my) {
    if (this.dragging) {
      this.position.x = mx + this.dragOffset.x;
      this.position.y = my + this.dragOffset.y;
    }
  }
}
