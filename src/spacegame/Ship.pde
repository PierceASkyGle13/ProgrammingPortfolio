class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship;
  Ship() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 1000;
    turretCount = 3;
    health = 500;
    ship = loadImage("Ship.png");
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    imageMode(CENTER);
    ship.resize(w, w);
    image(ship, x, y);
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
