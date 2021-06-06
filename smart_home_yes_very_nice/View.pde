class View {

  PImage img;

  View() { 
    img = loadImage("planlösning.png");
  }

  void draw() { 
    image(img, 600, 50, 950, 800);
    for (int i = 0; i < control.rooms.size(); i++) {
      control.rooms.get(i).draw();
    }
  }
  
void sliders() {
  control.selectedLamp.get(0).changeColor(
    cp5.getController("Red Lighting").getValue(), 
    control.selectedLamp.get(0).g, 
    control.selectedLamp.get(0).b); 
  control.selectedLamp.get(0).changeColor(
    control.selectedLamp.get(0).r, 
    cp5.getController("Green Lighting").getValue(), 
    control.selectedLamp.get(0).b); 
  control.selectedLamp.get(0).changeColor(
    control.selectedLamp.get(0).r, 
    control.selectedLamp.get(0).g, 
    cp5.getController("Blue Lighting").getValue()); 


  if (control.selectedLamp.size() > 0) {
    cp5.getController("Red Lighting").setVisible(true); 
    cp5.getController("Green Lighting").setVisible(true); 
    cp5.getController("Blue Lighting").setVisible(true);
  }
}

void createSliders() {
  cp5.addSlider("Red Lighting")
    .setPosition(280, 39)
    .setSize(200, 55)
    .setRange(0, 255)
    .setValue(255) 
    .setColorForeground(color(226, 83, 83))
    .setColorActive(color(226, 83, 83))
    .setVisible(false);
  ;

  cp5.addSlider("Green Lighting")
    .setPosition(280, 109)
    .setSize(200, 55)
    .setRange(0, 255)
    .setValue(255)
    .setColorForeground(color(47, 209, 54))
    .setColorActive(color(47, 209, 54))
    .setVisible(false);
  ;

  cp5.addSlider("Blue Lighting")
    .setPosition(280, 179)
    .setSize(200, 55)
    .setRange(0, 255)
    .setValue(0)
    .setColorForeground(color(71, 94, 218))
    .setColorActive(color(71, 94, 218))
    .setVisible(false);
  ;
}

}
