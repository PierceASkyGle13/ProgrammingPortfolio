class Board {
  int xCoord, yCoord;
  Square [][] squares = new Square [8] [8];

  Board() {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        this.squares[i][j] = new Square(i,j);
      }
    }
  }
  
  void display () {
    // board created by Jack Wakefield
    // one square = 50 px x 50 px
    noStroke();
    rectMode(CORNER);

    // white squares
    fill(242, 222, 177);
    square(0, 0, 400);
    // black squares
    fill(156, 123, 90);
    for (int i = 0; i<4; i++) {
      square(50+100*i, 0, 50);
      square(0+100*i, 50, 50);
      square(50+100*i, 100, 50);
      square(0+100*i, 150, 50);
      square(50+100*i, 200, 50);
      square(0+100*i, 250, 50);
      square(50+100*i, 300, 50);
      square(0+100*i, 350, 50);
    }
    // files and rank text
    fill(64, 63, 62);
    textSize(12);
    textAlign(CENTER, CENTER);
    text("a", 45, 392);
    text("b", 95, 392);
    text("c", 145, 392);
    text("d", 195, 392);
    text("e", 245, 392);
    text("f", 295, 392);
    text("g", 345, 390);
    text("h", 395, 392);
    text("1", 5, 355);
    text("2", 5, 305);
    text("3", 5, 255);
    text("4", 5, 205);
    text("5", 5, 155);
    text("6", 5, 105);
    text("7", 5, 55);
    text("8", 5, 5);
  }
}
