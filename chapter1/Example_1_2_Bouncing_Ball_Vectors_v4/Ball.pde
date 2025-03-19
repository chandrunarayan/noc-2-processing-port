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
  
  void checkBounce() {
    //We still sometimes need to refer to the individual components of a PVector and can do so using the dot syntax: position.x, velocity.y, etc.
    if (pos.x > width-dia/2 || pos.x < dia/2) {
      vel.x *= -1;
    }
    if (pos.y > height-dia/2 || pos.y < dia/2) {
      vel.y *= -1;
    }    
  }
  
  void show() {
    stroke(0);
    fill(clr);
    strokeWeight(2);
    circle(pos.x, pos.y, dia);    
  }
  
  void update() {
        pos.add(vel);
  }

}
