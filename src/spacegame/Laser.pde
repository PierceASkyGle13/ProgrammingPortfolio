class Laser {
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 10;
    speed = 3;
  }

  void display() {
    fill(#1FBED6);
    rectMode(CENTER);
    noStroke();
    rect(x, y, w, h, 8);
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
}
