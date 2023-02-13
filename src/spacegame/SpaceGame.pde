// Pierce Grandon | November 28 2022 | SpaceGame
import processing.sound.*;
SoundFile blaster, explosion;
Ship s1;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[1000];
int score, level, rockRate, rockCount, rocksPassed, laserCount, health;
boolean play;

void setup() {
  size(800, 800);
  s1 = new Ship();
  rockRate = 500;
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  blaster = new SoundFile(this, "blaster.wav");
  explosion = new SoundFile(this, "explosion.wav");
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  rocksPassed = 0;
  laserCount = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if (!play) {
      startScreen();
    } else if (play) {
      // Level Handling
      if (frameCount % 1000 == 10) {
        level++;
        rockRate -=10;
      }
    }

    background(0);

    // Rendering Stars
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();

    // Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUps:" + powerups.size());
    }

    // Rendering PowerUps and Detecting Ship Collision
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=50;
        } else {
          s1.ammo+=100;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    // Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockCount++;
      rockTimer.start();
      println("Rocks:" + rocks.size());
    }

    // Rendering Rocks and Detecting Ship Collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        // todo call the explosion animation
        // add a sound for explosion
        // todo: consider adding rock health
        score-=r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocksPassed++;
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
    }

    // Render lasers on the screen and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (r.intersect(l)) {
          score+=r.diam;
          // Todo: add sound to collision
          // Todo: add animation to the collision
          // Todo: dectrament the rock health
          lasers.remove(l);
          r.diam-=50;
          if (r.diam<10) {

            rocks.remove(r);
          }
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();

    // Game over logic
    if (s1.health<1 || rocksPassed > 10) {
      gameOver();
    }
  }
}
// Add Laser based on event
void mousePressed() {
  if (play) {
    blaster.stop();
    blaster.play();
    handleEvent();
  }
}

void keyPressed() {
  if (play) {
    blaster.stop();
    blaster.play();
    if (key == ' ') {
      handleEvent();
    }
  }
}
void handleEvent() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-7, s1.y));
    lasers.add(new Laser(s1.x+7, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x-27, s1.y));
    lasers.add(new Laser(s1.x+27, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  }
  if (key == ' ') {
    if (s1.fire() && s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      println("Lasers:" + lasers.size());
    } else if (s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-7, s1.y));
      lasers.add(new Laser(s1.x+7, s1.y));
      println("Lasers:" + lasers.size());
    } else if (s1.fire() && s1.turretCount == 3) {
      lasers.add(new Laser(s1.x-27, s1.y));
      lasers.add(new Laser(s1.x+27, s1.y));
      lasers.add(new Laser(s1.x, s1.y));
      println("Lasers:" + lasers.size());
    }
  }
}

void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(25);
  text("SPACEGAME" +
    " | Rocks Passed:" + rocksPassed +
    " | Health:" + s1.health +
    " | Level:" + level +
    " | Score:" + score +
    " | Ammo:" + s1.ammo, 395, 35);
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Game Over!", width/2, height/2);
  play = false;
  noLoop();
}
