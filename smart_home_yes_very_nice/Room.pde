class Room {

  ArrayList<Lamp> lights;
  int id = -1;
  String name = "";
  PImage switchOn, switchOff;  
  boolean switchOver, lampOn = false;
  boolean on = false;
  
  int topOff = 50;
  int gap = 10;
  
  Room(int id, boolean on, String name) {
   this.id = id;
   this.on = on;
   this.name = name;
   lights = new ArrayList<Lamp>();
   switchOn = loadImage("switchOn.png");
   switchOff = loadImage("switchOff.png");
  }
 
  void addLamp(Lamp lamp) {
    this.lights.add(lamp);
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
  void turnOn() {
    for(Lamp lamp : lights) {
      lamp.toggleOn();
    }    
  }
  
 

 
  void draw(){
    textSize(34);
    fill(255);
    text(this.name,170,730);
    
    for(Lamp lamp : lights) {
      lamp.draw();
    } 
    
    
    
    if(lampOn){
      image(switchOn, 350, 700, 80, 35); 
    } else {
      image(switchOff, 350, 700, 80, 35);  
    }
  }
 
  /*
  Koordinater för lampor:
  Sovrum 1:
    Lampa 1: x: 1298 y: 141
    Lampa 2: x: 1457 y: 320
  Sovrum 2: 
    Lampa 1: x: 1398 y: 436
  Sovrum 3: 
    Lampa 1: x: 853 y: 694
  Sovrum 4:
    Lampa 1: x: 1139 y: 184
    Lampa 2: x: 1244 y: 134
  Vardagsum:
    Lampa 1: x: 1132 y: 576
    Lampa 2: x: 1237 y: 791
    Lampa 3: x: 1049 y: 328
  Hall:
    Lampa 1: x: 681 y: 539
  Kök:
    Lampa 1: x: 852 y: 224
  */
  
}
