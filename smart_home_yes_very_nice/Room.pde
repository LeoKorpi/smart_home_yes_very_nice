class Room {

  ArrayList<Lamp> lights;
  LampSwitch lampSwitch;
  int id;
  int namePosX = 130;
  int namePosY = 780;
  int switchPosX = 750;
  int switchPosY = 350;
  String name = "";  
  boolean on = false;
  

  Room(int id, boolean on, String name) {
    this.id = id;
    this.on = on;
    this.name = name;
    switchPosX -= (id*60);
    namePosY -= (id*60);
    lights = new ArrayList<Lamp>();
  }

  void addLamp(Lamp lamp) {
    this.lights.add(lamp);
  }

  void addLampSwitch(LampSwitch lampSwitch) {
    this.lampSwitch = lampSwitch;
  }


  void draw() {
    textSize(34);
    fill(255);
    text(name, namePosX, namePosY);

    for (Lamp lamp : lights) {
      lamp.draw();
    }
    lampSwitch.on = this.on;
    lampSwitch.draw();
  }
}
