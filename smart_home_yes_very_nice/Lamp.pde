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
    
  void draw() {
    if(on){
      strokeWeight(3);
<<<<<<< HEAD
      fill(this.r,this.g,this.b);
      circle(x,y,30);
      fill(this.r,this.g,this.b);
=======
      fill(r,g,b);
      circle(x,y,30);
      fill(r,g,b,30);
>>>>>>> 630019226be5528bc7bcf3c6b78718329eee05c1
      circle(x,y,95);
    } else {
      strokeWeight(3);
      fill(128);
      circle(x,y,30);
    }
  }
  
}
