class Room {

  ArrayList<Lamp> lights;
  ArrayList<LampSwitch> switches;
  int id;
  int namePosX = 130;
  int namePosY = 780;
  int switchPosX = 750;
  int switchPosY = 350;
  String name = "";
  PImage switchOn, switchOff;  
  boolean switchOver, lampOn, on = false;
  
  Lamp lamp;
  LampSwitch lampSwitch;
  
  Room(int id, boolean on, String name) {
    this.id = id;
    this.on = on;
    this.name = name;
    switchPosX -= (id*60);
    namePosY -= (id*60);
    lights = new ArrayList<Lamp>();
    switches = new ArrayList<LampSwitch>();
    switchOn = loadImage("switchOn.png");
    switchOff = loadImage("switchOff.png");
    lampSwitch = new LampSwitch(switchPosX, switchPosY);
  }
 
  void addLamp(Lamp lamp) {
    this.lights.add(lamp);
  }
  
  void addLampSwitch(LampSwitch lampSwitch){
    this.switches.add(lampSwitch);
  }
  
  void toggle() {
    for(Lamp lamp : lights) {
      lamp.toggle();
    }
    this.lampOn = !this.lampOn;
  }
  
  
  void turnOff() {
    for(Lamp lamp : lights) {
      lamp.toggleOff();
    }    
  }
  
  /*
  void turnOn() {
    for(Lamp lamp : lights) {
      lamp.toggleOn();
    }    
  }
  */
  
  void draw(){
    textSize(34);
    fill(255);
    text(name,namePosX,namePosY);
    
    for(Lamp lamp : lights) {
      lamp.draw();
    }
    for (LampSwitch lampSwitch : switches){
      lampSwitch.draw();
    }
 
  }
 
}
