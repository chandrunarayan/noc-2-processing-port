class Ball {
  PVector pos;
  PVector vel;
  float dia;
  color clr;
  boolean liv;
  Ball() {
    float d = (float)(Math.random()*20)+20;
    float px = (float)Math.random()*(width-dia)+dia/2;
    float py = (float)Math.random()*(height-dia)+dia/2;
    float vx = (float)(Math.random()*4)-1.5;
    float vy = (float)(Math.random()*3)-1.0;
    color c = color((float)Math.random()*255,
      (float)Math.random()*255,
      (float)Math.random()*255
      );    
    pos = new PVector(px, py);
    vel = new PVector(vx, vy);
    dia = d;
    clr = c;
    liv = true;
  }
}
