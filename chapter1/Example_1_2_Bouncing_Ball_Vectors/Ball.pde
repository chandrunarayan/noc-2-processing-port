class Ball {
  PVector pos;
  PVector vel;
  float dia;
  color clr;
  Ball(float px, float py, float vx, float vy, float d, color c) {
    pos = new PVector(px, py);
    vel = new PVector(vx, vy);
    dia = d;
    clr = c;
  }
}
