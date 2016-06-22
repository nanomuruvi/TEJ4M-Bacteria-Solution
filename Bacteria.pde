class Bacteria {
  public int size;
  public int x;
  public int y;
  public int hSpeed;
  public int vSpeed;
  private static final int MAXSPEED=10;

  public color c;

  Bacteria(int x, int y) {
    c = color(random(255), random(255), random(255));
    this.x = x;
    this.y = y;
    this.size = (int)random(5,20);
  }
  void display() {
    
    fill(c);
    ellipse(x, y, size, size);
  }
  boolean contains(Bacteria b) {
    int hDist=(b.x-this.x);
    int vDist=(b.y-this.y);
    return (sqrt(pow(hDist, 2)+pow(vDist, 2))<(this.size+b.size)/2);
  }
  void rndSpeed() {
    vSpeed = (int)random(-MAXSPEED,MAXSPEED);
    hSpeed = (int)random(-MAXSPEED,MAXSPEED);
  }
  void update() {
    rndSpeed();
    x+= hSpeed;
    y+= vSpeed;
  }
  void move() {
  }
  void position(int x, int y){
    this.x = x;
    this.y = y;
  }
  void eat(Bacteria b){
    size=size+(b.size/2);
  }
}