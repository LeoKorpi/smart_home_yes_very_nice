import processing.sound.*;
import http.requests.*;
import controlP5.*;

Network network = new Network();

ControlP5 cp5;
View view;
Lamp lamp;
SoundFile on, off;

ArrayList<Lamp> selectedLamp;

void setup(){
  frameRate(60);
  size(1600,900);
  background(128);

  view = new View();
  cp5 = new ControlP5(this);  
  
  on = new SoundFile(this, "switchOn.wav");
  off = new SoundFile(this, "switchOff.wav");
  
  selectedLamp = new ArrayList<Lamp>();
  
  cp5.addSlider("Red Lighting")
    .setPosition(280,39)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(255) 
    .setColorForeground(color(226,83,83))
    .setColorActive(color(226,83,83))
    .setVisible(false);
    ;
    
  cp5.addSlider("Green Lighting")
    .setPosition(280,109)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(255)
    .setColorForeground(color(47,209,54))
    .setColorActive(color(47,209,54))
    .setVisible(false);
    ;

  cp5.addSlider("Blue Lighting")
    .setPosition(280, 179)
    .setSize(200,55)
    .setRange(0,255)
    .setValue(0)
    .setColorForeground(color(71,94,218))
    .setColorActive(color(71,94,218))
    .setVisible(false);
    ;
      
}

void draw(){ 
  update(mouseX, mouseY);
  background(128); 
  view.draw();
  if(selectedLamp.size() > 0){
    sliders();
  }
  
  
  /*  
  if(frameCount % 120 == 0) {
    
  }
  */
}
    
void mousePressed(){
  //går igenom alla rum och kollar om musens position är över en av knapparna
  for(int i = 0; i < view.rooms.size()-1; i++){
    if(view.rooms.get(i).lampSwitch.switchOver){
      for(int j = 0; j < view.rooms.get(i).lights.size();j++){
        view.rooms.get(i).lights.get(j).toggle();
        on.play();
        if (checkLights() == true){
          view.rooms.get(7).switches.get(0).toggleOn(); 
        }
      }
      view.rooms.get(i).switches.get(0).toggle();
      off.play();
      if (checkLights() == false){
        view.rooms.get(7).switches.get(0).toggleOff(); 
      }
    } else {
      //går igenom alla lampor i rummen och kollar om musen position är över en av lamporna
      //Om den gör det tänds lampan när man klickar på den (eller släcks om den redan är på)
      //Lampan markeras även för färg sliderserna (najs swengelska)
      for(int j = 0; j < view.rooms.get(i).lights.size(); j++){
        if (view.rooms.get(i).lights.get(j).lampOver && !view.rooms.get(i).lights.get(j).on){
          view.rooms.get(i).lights.get(j).toggleOn();
          view.rooms.get(i).lights.get(j).select();
          on.play();
          selectLamp(view.rooms.get(i).lights.get(j));
        } else if (view.rooms.get(i).lights.get(j).lampOver && view.rooms.get(i).lights.get(j).on){
          view.rooms.get(i).lights.get(j).toggleOff();
          view.rooms.get(i).lights.get(j).unSelect();
          off.play();
          unSelectLamp();
        }
        view.rooms.get(i).lights.get(j).unSelect();
        if(selectedLamp.size()<0){
        unSelectLamp();
        }        
      }
    }
  }
} //<>//

void update(int x, int y){
  for(int i = 0; i < view.rooms.size()-1; i++ ){
    if (x > view.rooms.get(i).lampSwitch.y && 
        x < view.rooms.get(i).lampSwitch.y+80 && 
        y > view.rooms.get(i).lampSwitch.x && 
        y < view.rooms.get(i).lampSwitch.x+35)
    {
        view.rooms.get(i).switchOver = true; 
        view.rooms.get(i).lampSwitch.switchOver = true;    
    }
    
    else if (x > view.rooms.get(7).lampSwitch.y && 
        x < view.rooms.get(7).lampSwitch.y+80 && 
        y > view.rooms.get(7).lampSwitch.x && 
        y < view.rooms.get(7).lampSwitch.x+35 &&
        checkLights() == true
        )
    {
        view.rooms.get(i).switchOver = true; 
        view.rooms.get(i).lampSwitch.switchOver = true;
    } 
    
    else {
        for(int j = 0; j < view.rooms.get(i).lights.size();j++){
        if(x > view.rooms.get(i).lights.get(j).x-15 &&
         x < view.rooms.get(i).lights.get(j).x+15 &&
         y > view.rooms.get(i).lights.get(j).y-15 &&
         y < view.rooms.get(i).lights.get(j).y+15)
        {
          view.rooms.get(i).lights.get(j).lampOver = true;
        } 
        else {
          view.rooms.get(i).switchOver = false;   
          view.rooms.get(i).lampSwitch.switchOver= false;  
          view.rooms.get(i).lights.get(j).lampOver = false;
        }
      }
    }
  } 
}

boolean checkLights(){
  for(int i = 0; i < view.rooms.size()-1; i++){
    for(int j = 0; j < view.rooms.get(i).lights.size();j++){
      if(view.rooms.get(i).lights.get(j).on){
        return true; 
      }  
    }  
  }
  return false;
}

void selectLamp(Lamp lamp){
  this.selectedLamp.add(lamp);  
}


void unSelectLamp(){
  selectedLamp.remove(0); 
  cp5.getController("Red Lighting").setVisible(false);
  cp5.getController("Green Lighting").setVisible(false); 
  cp5.getController("Blue Lighting").setVisible(false); 
}


void sliders(){
        
  selectedLamp.get(0).changeColor(
    cp5.getController("Red Lighting").getValue(),
    selectedLamp.get(0).g, 
    selectedLamp.get(0).b);
  selectedLamp.get(0).changeColor(
    selectedLamp.get(0).r,
    cp5.getController("Green Lighting").getValue(), 
    selectedLamp.get(0).b);
  selectedLamp.get(0).changeColor(
    selectedLamp.get(0).r, 
    selectedLamp.get(0).g, 
    cp5.getController("Blue Lighting").getValue());    
      
      
  if(selectedLamp.size() > 0){
    cp5.getController("Red Lighting").setVisible(true); 
    cp5.getController("Green Lighting").setVisible(true); 
    cp5.getController("Blue Lighting").setVisible(true); 
  } 
        
}
