class Rock {
  int x, y, speed, diam;
  PImage rock;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 6));
    diam = 25;
    rock = loadImage("rock.png");
  }

  void display() {
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      explosion.stop();
      explosion.play();
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Laser laser) {
    float d = dist(x, y, laser.x, laser.y);
    if (d<10) {
      return true;
    } else {
      return false;
    }
  }
}
