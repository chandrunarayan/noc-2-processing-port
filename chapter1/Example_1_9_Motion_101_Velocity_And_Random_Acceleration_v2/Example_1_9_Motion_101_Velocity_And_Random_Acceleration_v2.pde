// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ArrayList<Mover> movers;
PFont f;
int num=100;
int maxSz = 50;

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
  for (int i=0; i<movers.size(); i++) {
    Mover m = movers.get(i);
    m.update();
    m.checkBounce();
    m.show();
  }
}
