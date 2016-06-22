/**
 Yanano Muruvi  
 06/20/2016
 */
final int WIDTH=500, HEIGHT=500;

ArrayList <Bacteria> bacts = new ArrayList<Bacteria>();
void setup() {
  size(500, 500);
  for (int i=0; i<random(50,100); i++) {
    bacts.add(new Bacteria((int)random(500), (int)random(500)));
  }
}
void draw() {
  background(0);
  update();
  display();
}
void keepInBounds() {
  for (int i=0; i<bacts.size(); i++) {
    if (bacts.get(i).x>WIDTH||bacts.get(i).x<0) {
      bacts.get(i).hSpeed *=-1;
    }
    if (bacts.get(i).y>HEIGHT||bacts.get(i).y<0) {
      bacts.get(i).vSpeed *=-1;
    }
  }
}
void display() {

  for (int i=0; i<bacts.size(); i++) {
    bacts.get(i).display();
  }
}
void update() {
  for (int i=0; i<bacts.size(); i++) {
    bacts.get(i).update();
  }
  keepInBounds();
  checkCollision();
}
void newBact() {
  bacts.add(new Bacteria((int)random(500), (int)random(500)));
}
void checkCollision() {
  for (int i=0; i<bacts.size(); i++) {
    for (int j=i+1; j<bacts.size(); j++) {
      if (bacts.get(i).contains(bacts.get(j))) {
        bacts.get(i).eat(bacts.get(j));
        bacts.remove(j);
        println("There are " +bacts.size() +" bacteria left.");
      }
    }
  }
}