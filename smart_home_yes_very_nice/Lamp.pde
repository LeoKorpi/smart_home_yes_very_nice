class Lamp {

  float x, y;
  int r = 0, g = 0, b = 0;
  int id;
  int intensity = 0;
  boolean on = false;
  
  Lamp(float x, float y, int id, int intensity, boolean on, int r, int g, int b) {
    this.x = x;
    this.y = y;
    this.id = id;
    this.intensity = intensity;
    this.on = on;
    this.r = r;
    this.b = b;
    this.g = g;
  }  
  
  void changeColor(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.g = g;  
  }
  
  void toggle() {
    this.on = !this.on;  
  }
  
  void toggleOff() {
    this.on = false;  
  }
  
  void toggleOn() {
    this.on = true;
  }
    
  void draw() {
    if(on){
      strokeWeight(3);
      fill(255,255,0);
      circle(x,y,30);
      fill(255,255,0,30);
      circle(x,y,95);
    } else {
      strokeWeight(3);
      fill(128);
      circle(x,y,30);
    }
  }
  
}
