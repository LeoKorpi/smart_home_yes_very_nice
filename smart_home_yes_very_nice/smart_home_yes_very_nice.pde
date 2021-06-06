import processing.sound.*;
import http.requests.*;
import controlP5.*;

Network network = new Network();

ControlP5 cp5;
View view;
Lamp lamp;
Control control;
SoundFile on, off;


void setup() {
  control = new Control();
  frameRate(20);
  size(1600, 900);
  background(128);

  view = new View();
  cp5 = new ControlP5(this);  

  on = new SoundFile(this, "switchOn.wav");
  off = new SoundFile(this, "switchOff.wav");

  view.createSliders();
}

void draw() { 
  background(128);
  view.draw();
  
  if (control.selectedLamp.size() > 0) {
    view.sliders();
  }
  

  if (frameCount % 5 == 0) {
    control.updateLamps();
  }
  
  



}

void mousePressed() {


  control.checkForLampSwitchActivation();
  
  if (frameCount % 20 == 0) {       
      network.changeRGB(
      (int)cp5.getController("Red Lighting").getValue(), 
      (int)cp5.getController("Green Lighting").getValue(), 
      (int)cp5.getController("Blue Lighting").getValue(),
      control.rooms.get(0).id, 
      control.rooms.get(0).lights.get(0).id);
    
  }
}
