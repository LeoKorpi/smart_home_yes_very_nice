class LampSwitch {

  PImage switchOn, switchOff;  
  boolean on;
  int x, y;
  int switchOffsetX = 80;
  int switchOffsetY = 35;

  LampSwitch() {
    switchOn = loadImage("switchOn.png");
    switchOff = loadImage("switchOff.png");
  }

  LampSwitch(int x, int y) {
    this.x = x;
    this.y = y;
    switchOn = loadImage("switchOn.png");
    switchOff = loadImage("switchOff.png");
  }


  boolean isMouseOver(float x, float y) {
    if ((x > this.x && x < this.x + switchOffsetX) && (y > this.y && y < this.y + switchOffsetY)) {
      return true;
    }
    return false;
  }

  void draw() {
    if (on) {
      image(switchOn, x, y, 80, 35);
    } else {
      image(switchOff, x, y, 80, 35);
    }
  }
}
