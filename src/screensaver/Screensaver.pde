// Pierce Grandon | 10 Oct 2022 | Screensaver
float xpos, ypos, strokeW, pointCount;

void setup() {
  background(800);
  size(displayWidth, displayHeight);
  fullScreen();
  xpos = random(width);
  ypos = random(height);
}

void draw() {
  strokeW = random(2, 15);
  pointCount = random(20, 60);
  strokeWeight(strokeW);
  stroke(random(800), random(800), random(800));
  //moveRight(xpos, ypos, pointCount);
  if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
  }
  int rand = int(random(4));
  if (rand == 0) {
    moveLeft(xpos, ypos, pointCount);
  } else if (rand == 1) {
    moveUp(xpos, ypos, pointCount);
  } else if (rand == 2) {
    moveRight(xpos, ypos, pointCount);
  } else if (rand == 3) {
    moveDown(xpos, ypos, pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}
void moveUp
  (float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY - i);
    xpos = startX;
    ypos = startY - i;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY + i;
  }
}
