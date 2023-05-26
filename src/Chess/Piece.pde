class Piece {
  boolean white;
  int x, y;
  boolean msOver;
  String type;
  PImage whiteking, blackking, whitepawn, blackpawn, whiterook, blackrook, whitebishop, blackbishop, whiteknight, blackknight, whitequeen, blackqueen;

  Piece(int x, int y, boolean white, String type) {
    this.x = x;
    this.y = y;
    this.white = white;
    this.type = type;
    
    
    // Images by Jack Wakefield and Pierce Grandon
    whiteking = loadImage("white_king.png");
    whitepawn = loadImage("white_pawn.png");
    whiterook = loadImage("white_rook.png");
    whitebishop = loadImage("white_bishop.png");
    whiteknight = loadImage("white_knight.png");
    whitequeen = loadImage("white_queen.png");
    blackking = loadImage("black_king.png");
    blackpawn = loadImage("black_pawn.png");
    blackrook = loadImage("black_rook.png");
    blackbishop = loadImage("black_bishop.png");
    blackknight = loadImage("black_knight.png");
    blackqueen = loadImage("black_queen.png");
    whiteking.resize(44,44);
    whitepawn.resize(44,44);
    whiterook.resize(44,44);
    whitebishop.resize(44,44);
    whiteknight.resize(44,44);
    whitequeen.resize(44,44);
    blackking.resize(44,44);
    blackpawn.resize(44,44);
    blackrook.resize(44,44);
    blackbishop.resize(44,44);
    blackknight.resize(44,44);
    blackqueen.resize(44,44);
    imageMode(CENTER);
    tint(245, 240, 230);
    
  }
  void display() {
    if (white == true) {
      if (type == "king") {image(whiteking, x,y);}
      if (type == "pawn") {image(whitepawn, x,y);}
      if (type == "rook") {image(whiterook, x,y);}
      if (type == "bishop") {image(whitebishop, x,y);}
      if (type == "knight") {image(whiteknight, x,y);}
      if (type == "queen") {image(whitequeen, x,y);}
    } else {
      if (type == "king") {image(blackking,x,y);}
      if (type == "pawn") {image(blackpawn,x,y);}
      if (type == "rook") {image(blackrook,x,y);}
      if (type == "bishop") {image(blackbishop,x,y);}
      if (type == "knight") {image(blackknight,x,y);}
      if (type == "queen") {image(blackqueen,x,y);}
    }
  }
  //class King extends Piece {
    
  //}
}
