import http.requests.*;
import controlP5.*;

Network network = new Network();


ControlP5 cp5;

View view;
Control control;
void setup(){
  
  control = new Control();
  frameRate(20);
  size(1600,900);
  background(128);  
    

  cp5 = new ControlP5(this);
  view = new View();  
  
  cp5.addSlider("Red Lighting")
    .setPosition(280,39)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(control.rooms.get(0).lights.get(0).r)
    .setColorForeground(color(226,83,83))
    .setColorActive(color(226,83,83))
    ;
    
  cp5.addSlider("Green Lighting")
    .setPosition(280,109)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(control.rooms.get(0).lights.get(0).g)
    .setColorForeground(color(47,209,54))
    .setColorActive(color(47,209,54))
    ;

  cp5.addSlider("Blue Lighting")
    .setPosition(280, 179)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(control.rooms.get(0).lights.get(0).b)
    .setColorForeground(color(71,94,218))
    .setColorActive(color(71,94,218))
    ;

}

void draw(){ 
  //update(mouseX, mouseY);
  background(128);
  view.draw();

    
   if(control.rooms.get(0).lights.get(0).on){
    cp5.getController("Red Lighting").setVisible(true); 
    cp5.getController("Green Lighting").setVisible(true); 
    cp5.getController("Blue Lighting").setVisible(true); 
  } else {
    cp5.getController("Red Lighting").setVisible(false);
    cp5.getController("Green Lighting").setVisible(false); 
    cp5.getController("Blue Lighting").setVisible(false); 
  }
  

  if(frameCount % 5 == 0) {
    //JSONArray rooms = network.getState().getJSONArray("rooms");
    control.updateLamps();
  
  }
  
  if(frameCount % 20 == 0) {
    network.changeRGB((int)cp5.getController("Red Lighting").getValue(), 
                      (int)cp5.getController("Green Lighting").getValue(), 
                      (int)cp5.getController("Blue Lighting").getValue(), 
                      control.rooms.get(0).id, 
                      control.rooms.get(0).lights.get(0).id);
  }
  
}




void mousePressed(){
  if(control.rooms.get(0).lampSwitch.switchOver){
    control.rooms.get(0).lights.get(0).toggle();
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
