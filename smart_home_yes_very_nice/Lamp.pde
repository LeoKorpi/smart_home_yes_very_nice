class Lamp {

  int x, y;
  float r = 255, g = 255, b = 0;
  int id;
  int intensity = 0;
  boolean lampOver, on, selected = false;

  Lamp(int x, int y){
    this.x = x;
    this.y = y;
  }

  void changeColor(float r, float g, float b) {
    this.r = r;
    this.g = g; 
    this.b = b;  
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
  
  void select(){
    this.selected = true;
  }
  
  void unSelect(){
    this.selected = false; 
  }
  
  void draw() {
    if(on){
      strokeWeight(3);
      fill(r,g,b);
      circle(x,y,30);
      fill(r,g,b,30);
      circle(x,y,95);
    } else {
      strokeWeight(3);
      fill(128);
      circle(x,y,30);
    }
  }
}
