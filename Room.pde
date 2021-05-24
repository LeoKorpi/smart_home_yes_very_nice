class Room {

  ArrayList<Lamp> lights;
  
  Room() {
   lights = new ArrayList<Lamp>();
  }
 
  void addLamp(Lamp lamp) {
    this.lights.add(lamp);
  }
  
  void toggle() {
    for(Lamp lamp : lights) {
      lamp.toggle();
    }
  }
  
  void turnOff() {
    for(Lamp lamp : lights) {
      lamp.toggleOff();
    }    
  }
  void turnOn() {
    for(Lamp lamp : lights) {
      lamp.toggleOn();
    }    
  }
  
  
  
}
