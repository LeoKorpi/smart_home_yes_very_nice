class LampSwitch{
 
  PImage switchOn, switchOff;  
  boolean switchOver, lampOn = false;
  
  LampSwitch(){
    switchOn = loadImage("switchOn.png");
    switchOff = loadImage("switchOff.png");
  }
  
  void toggle(){
    this.lampOn = !this.lampOn;
  }
  
  void draw(){
    if(lampOn){
      image(switchOn, 350, 700, 80, 35); 
    } else {
      image(switchOff, 350, 700, 80, 35);  
    } 
  }
  
}
