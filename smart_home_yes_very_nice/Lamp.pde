class Lamp {


  float x, y;
  int r = 255, g = 255, b = 0;
  int id;
  boolean lampOver, on, selected = false;

  Lamp(int x, int y) {
    this.x = x;
    this.y = y;
  }


  Lamp(float x, float y, int id, int intensity, boolean on, int r, int g, int b) {
    this.x = x;
    this.y = y;
    this.id = id;

    this.on = on;
    this.r = r;
    this.b = b;
    this.g = g;
  } 


  void changeColor(float r, float g, float b) {
    this.r = (int) r;
    this.g = (int) g; 
    this.b = (int) b;

  }

  boolean mouseIsOver(int x, int y) {
    if(x < this.x + (95 / 2) && x > this.x - (95 / 2) && 
       y < this.y + (95 / 2) && y > this.y - (95 / 2)) {
      return true;  
     }
        
    return false;
  }
  void select() {
    this.selected = true;
  }

  void unSelect() {
    this.selected = false;
  }


  void draw() {
    if (on) {
      strokeWeight(3);
      fill(this.r, this.g, this.b);
      circle(x, y, 95);
      
      fill(this.r, this.g, this.b);
      circle(x, y, 30);

    } else {
      strokeWeight(3);
      fill(128);
      circle(x, y, 30);
    }
  }
}
