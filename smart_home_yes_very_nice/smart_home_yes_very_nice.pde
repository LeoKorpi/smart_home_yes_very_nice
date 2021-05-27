import http.requests.*;
import controlP5.*;

Network network = new Network();


ControlP5 cp5;
View view;


View view;
Control control;
void setup(){
  
  control = new Control();
  control.retrieveFirstState();
  frameRate(60);
  size(1600,900);
  background(128);  
  
  x = width/2;
  y = height/2; 
  
  cp5 = new ControlP5(this);
  view = new View();  
  
  cp5.addSlider("Red Lighting")
    .setPosition(280,39)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(view.room.lamp.r)
    .setColorForeground(color(226,83,83))
    .setColorActive(color(226,83,83))
    ;
    
  cp5.addSlider("Green Lighting")
    .setPosition(280,109)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(view.room.lamp.g)
    .setColorForeground(color(47,209,54))
    .setColorActive(color(47,209,54))
    ;

  cp5.addSlider("Blue Lighting")
    .setPosition(280, 179)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(view.room.lamp.b)
    .setColorForeground(color(71,94,218))
    .setColorActive(color(71,94,218))
    ;

}

void draw(){ 
  //update(mouseX, mouseY);
  background(128);
  view.draw();
  view.room.lamp.changeColor(cp5.getController("Red Lighting").getValue(), view.room.lamp.g, view.room.lamp.b);
  view.room.lamp.changeColor(view.room.lamp.r,cp5.getController("Green Lighting").getValue(), view.room.lamp.b);
  view.room.lamp.changeColor(view.room.lamp.r, view.room.lamp.g, cp5.getController("Blue Lighting").getValue());
  
   if(view.room.lamp.on){
    cp5.getController("Red Lighting").setVisible(true); 
    cp5.getController("Green Lighting").setVisible(true); 
    cp5.getController("Blue Lighting").setVisible(true); 
  } else {
    cp5.getController("Red Lighting").setVisible(false);
    cp5.getController("Green Lighting").setVisible(false); 
    cp5.getController("Blue Lighting").setVisible(false); 
  }
  
  
 //<>// //<>//
  int r = 0;
  
  if(frameCount % 10 == 0) {
    //JSONArray rooms = network.getState().getJSONArray("rooms");
    for(Room room : control.rooms) {
      for(Lamp lamp : room.lights) {
        network.changeRGB(r++, r++, r++, room.id, lamp.id);
      }
    }
     

  }
  //println(frameCount);
}

void mousePressed(){
  if(view.room.lampSwitch.switchOver){
    view.room.lamp.toggle();
    view.room.toggle();
  }
  
 println("X: " + mouseX + " Y: " + mouseY); //änvänd bara som hjälp för att veta vart saker ska ligga
}

void update(int x, int y){
  if (x > 350 && x < 430 && y > 700 && y < 735){
    view.room.lampSwitch.switchOver = true; 
  } else {
    view.room.lampSwitch.switchOver= false;   
  }
}
