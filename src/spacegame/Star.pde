class Star {
  int x, y, speed, diam;

  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    speed = int(random(2, 6));
    diam = int(random(1, 4));
  }

  void display() {
    fill(#B7F0F5);
    ellipse(x, y, diam, diam);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}
