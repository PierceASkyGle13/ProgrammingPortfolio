// Daniel Shiffmas | Rain Catcher | Example
class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }
  
  void pause() {
    // work on this later
  }
  
  void display(int x, int y, int c) { // Timer Display By Jack Wakefield
    int minutes = (totalTime-savedTime)/60000;
    int seconds = ((totalTime-savedTime)/1000)%60;
    fill(c);
    textSize(25);
    textAlign(CENTER, CENTER);
    if (seconds<10) {
      text(minutes + ":0" + seconds, x, y);
    } else if (seconds == 60) {
      text(minutes + ":00", x, y);
    } else {text(minutes + ":" + seconds, x, y);}
  }

  // The function isFinished() returns true if 5,000 ms have passed.
  // The work of the timer is farmed out to this method.
  boolean isFinished() {
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
