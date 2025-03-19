// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ArrayList<Mover> movers;
PFont f;
int num=5;
boolean isStopSet = false;
float stop;
float maxDist = 20;

void setup() {
  size(640, 360);
  //mover = new Mover();
  f = createFont("Serif", 16, true); // Create Font
  movers = new ArrayList<Mover>();
  //Note how PVector() has to be called inside of setup().
  for (int i=0; i<num; i++) {
    Mover m = new Mover();
    movers.add(m);
  }
}

void draw() {
  background(255);
  removeDead();
  instruct();
  for (int i=0; i<movers.size(); i++) {
    Mover m = movers.get(i);
    m.update();
    m.checkBounce();
    m.show();
  }
}

void instruct() {
    if ( movers.size() <= 0) {
    setStop(millis());
    textFont(f, 16);
    fill(255, 0, 0);
    text("You got'em all in " + stop/1000 + " seconds !!", 10, 100);
  } else {
    textFont(f, 16);
    fill(255, 0, 255);
    String s = "Click inside a Ball to remove it: " + movers.size() + " remaining";
    text(s, 10, 100);
  }
}

void setStop(float value) {
  if (!isStopSet) {
    stop = value;
    isStopSet = true;
  }
}

void removeDead() {
  // Remove any dead balls
  for (int i=0; i<movers.size(); i++) {
    Mover m = movers.get(i);
    if (!m.liv) movers.remove(m);
  }  
}

void mouseClicked() {
  float mx = mouseX;
  float my = mouseY;
  for (int i=0; i<movers.size(); i++) {
    Mover m = movers.get(i);
    if (dist(mx, my, m.pos.x, m.pos.y) <= maxDist) {
      m.liv = false;
    }
  }
}
