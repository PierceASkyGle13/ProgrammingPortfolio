// Pierce Grandon | Nov 2022 | Calculator Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;

void setup() {
  size(380, 520);
  opButtons[0] = new Button(90, 140, 160, 40, 'C');
  opButtons[1] = new Button(140, 140, 60, 40, '%');
  opButtons[2] = new Button(240, 140, 60, 40, '±');
  opButtons[3] = new Button(340, 140, 60, 40, '=');
  numButtons[0] = new Button(40, 210, 60, 40, '1');
  numButtons[1] = new Button(140, 210, 60, 40, '2');
  numButtons[2] = new Button(240, 210, 60, 40, '3');
  opButtons[4] = new Button(340, 210, 60, 40, '÷');
  numButtons[3] = new Button(40, 280, 60, 40, '4');
  numButtons[4] = new Button(140, 280, 60, 40, '5');
  numButtons[5] = new Button(240, 280, 60, 40, '6');
  opButtons[5] = new Button(340, 280, 60, 40, 'x');
  numButtons[6] = new Button(40, 350, 60, 40, '7');
  numButtons[7] = new Button(140, 350, 60, 40, '8');
  numButtons[8] = new Button(240, 350, 60, 40, '9');
  opButtons[6] = new Button(340, 350, 60, 40, '+');
  opButtons[7] = new Button(40, 420, 60, 40, '.');
  numButtons[9] = new Button(140, 420, 60, 40, '0');
  opButtons[1] = new Button(240, 420, 60, 40, '%');
  opButtons[8] = new Button(340, 420, 60, 40, '-');
  opButtons[9] = new Button(40, 490, 60, 40, 'π');
  opButtons[10] = new Button(140, 490, 60, 40, 'y');
  opButtons[11] = new Button(240, 490, 60, 40, '²');
  opButtons[12] = new Button(340, 490, 60, 40, '√');
}

void draw() {
  background(0);
  for (int i =0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i =0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key" + key);
  println("keyCode: " + keyCode);
  if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 12 || keyCode == 27) {
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 61 || keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 107 || keyCode == 80) {
    handleEvent("+", false);
  } else if (keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("×", false);
  } else if (keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 16 || keyCode == 32) {
    handleEvent("±", false);
  } else if (keyCode == 89) {
    handleEvent("y", false);
  }
}

void handleEvent (String val, boolean num) {
  if (num && dVal.length() < 24) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }

    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("±")) {
    if (left) {
      l = l * -1;
      dVal = str(l);
    } else {
      r = r * -1;
      dVal = str(r);
    }
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals("+")) {
    op = '+';
    dVal = "";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "";
    left = false;
  } else if (val.equals("×")) {
    op = '×';
    dVal = "";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = "";
    left = false;
  }
}
void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      op = '%';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      op = '=';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '1') {
      op = '1';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '2') {
      op = '2';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '3') {
      op = '3';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '4') {
      op = '4';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '5') {
      op = '5';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '6') {
      op = '6';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      op = 'x';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '7') {
      op = '7';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '8') {
      op = '8';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '9') {
      op = '9';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '0') {
      op = '0';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      op = 'π';
      dVal = "3.14";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == 'y') {
      op = 'y';
      dVal = "y";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      if (left) {
        l=sq(l);
        dVal = str(l);
      } else {
        r=sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l=sqrt(l);
        dVal = str(l);
      } else {
        r=sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + " left:" + left + " Result:" + result);
}

void updateDisplay() {
  fill(127);
  rect(190, 60, 360, 90);
  fill(255);
  textAlign(RIGHT);
  text(dVal, width-15, 100);
  textSize(20);
}

void performCalculation () {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result= l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '²') {
    result = l * l;
  } else if (op == 'π') {
    result = l * 3.14;
  } else if (op == '%') {
    result = l/100;
  } else if (op == '√') {
    result = sqrt(l);
  }
  dVal = str(result);
  l = result;
  left  = true;
}
