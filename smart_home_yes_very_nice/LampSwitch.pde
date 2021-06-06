class LampSwitch{
 
  PImage switchOn, switchOff;  
  boolean switchOver, lampOn = false;
  int x, y;
  
  LampSwitch(){
    switchOn = loadImage("switchOn.png");
    switchOff = loadImage("switchOff.png");
  }
  
  LampSwitch(int x, int y){
    this.x = x;
    this.y = y;
    switchOn = loadImage("switchOn.png");
    switchOff = loadImage("switchOff.png");
  }
  
  void toggle(){
    this.lampOn = !this.lampOn;
  }
  
  void toggleOff() {
    this.lampOn = false;
  }

  void toggleOn() {
    this.lampOn = true;
  }
  
  void draw(){
    if(lampOn){
      image(switchOn, y, x, 80, 35); 
    } else {
      image(switchOff, y, x, 80, 35);  
    } 
  }
  
}
