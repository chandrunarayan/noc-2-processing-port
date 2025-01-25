// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Particles are generated each cycle through draw(),
// fall with gravity and fade out over time
// A ParticleSystem object manages a variable size
// list of particles.


Emitter emitter;

void setup() {
  size(640, 360);
  emitter = new Emitter(width / 2, 50);
}

void draw() {
  background(255);
  emitter.addParticle();
  emitter.run();
}
