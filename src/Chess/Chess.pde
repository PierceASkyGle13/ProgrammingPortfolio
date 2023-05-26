// March-May 2023 | Chess Group Project
Board board;
Timer whiteTimer, blackTimer;
ArrayList<Piece> pieces = new ArrayList<Piece>();
Piece selectedPiece;

void setup() {
  size (400, 450);

  board = new Board();

  whiteTimer = new Timer(600000);
  blackTimer = new Timer(600000);

  setupChessPieces();
}

void setupChessPieces() {
  // White Pieces
  for (int i = 0; i<8; i++) {
    pieces.add(new Piece(25+i*50, 325, true, "pawn"));
  }
  pieces.add(new Piece(225, 375, true, "king"));
  for (int i = 0; i<2; i++) {
    pieces.add(new Piece(25+i*350, 375, true, "rook"));
  }
  for (int i = 0; i<2; i++) {
    pieces.add(new Piece(125+i*150, 375, true, "bishop"));
  }
  for (int i = 0; i<2; i++) {
    pieces.add(new Piece(75+i*250, 375, true, "knight"));
  }
  pieces.add(new Piece(175, 375, true, "queen"));

  // Black Pieces
  for (int i = 0; i<8; i++) {
    pieces.add(new Piece(25+i*50, 75, false, "pawn"));
  }
  pieces.add(new Piece(225, 25, false, "king"));
  for (int i = 0; i<2; i++) {
    pieces.add(new Piece(25+i*350, 25, false, "rook"));
  }
  for (int i = 0; i<2; i++) {
    pieces.add(new Piece(125+i*150, 25, false, "bishop"));
  }
  for (int i = 0; i<2; i++) {
    pieces.add(new Piece(75+i*250, 25, false, "knight"));
  }
  pieces.add(new Piece(175, 25, false, "queen"));
}

void draw() {
  background(60);
  board.display();
  // info panel by Jack Wakefield
  // timers

  whiteTimer.start();
  //blackTimer.start();


  whiteTimer.display(50, 420, 220);
  blackTimer.display(width-50, 420, 8);
  noFill();
  strokeWeight(3);
  stroke(220);
  rect(15, 410, 70, 30);
  stroke(8);
  rect(width-85, 410, 70, 30);


  // Pieces
  for (int i = 0; i<pieces.size(); i++) {
    Piece p = pieces.get(i);
    p.display();
  }
}

// dragging pieces created by Pierce Grandon and Jack Wakefield
void mousePressed() {
  for (int i = 0; i<pieces.size(); i++) {
    Piece p = pieces.get(i);
    if (dist(p.x, p.y, mouseX, mouseY) <= 50/2) {
      p.msOver = true;
    } else {
      p.msOver = false;
    }
    if (p.msOver == true) {
      p.x = mouseX;
      p.y = mouseY;
      selectedPiece = p;
      pieces.remove(selectedPiece); // remove from list
      pieces.add(selectedPiece); // place at the end of the list
    }
  }
}

void mouseDragged() {
  for (int i = 0; i<pieces.size(); i++) {
    Piece p = pieces.get(i);
    if (p.msOver) {
      selectedPiece.x = mouseX;
      selectedPiece.y = mouseY;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i<pieces.size(); i++) {
    Piece p = pieces.get(i);
    if (p.msOver) {
      p.x = mouseX-mouseX%50+25;
      p.y = mouseY-mouseY%50+25;
    }
    p.msOver = false;
  }
  selectedPiece = null;
}
