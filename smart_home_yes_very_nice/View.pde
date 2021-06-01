class View{
  
  PImage img;

  Room room; 
  Lamp lamp;
  LampSwitch lampSwitch;
  
  ArrayList<Room> rooms; 
 
  View(){ 
    img = loadImage("planlösning.png");
    rooms = new ArrayList<Room>();
    rooms.add(new Room(0, false, "Kök"));
    rooms.add(new Room(1, false, "Hall"));
    rooms.add(new Room(2, false, "Vardagsrum"));
    rooms.add(new Room(3, false, "Sovrum 1"));
    rooms.add(new Room(4, false, "Sovrum 2"));
    rooms.add(new Room(5, false, "Sovrum 3"));
    rooms.add(new Room(6, false, "Sovrum 4"));
    rooms.add(new Room(7, false, "Släck allt"));
    
    for(int i = 0; i < rooms.size(); i++){
      if(i == 0){ //Köket
        rooms.get(i).addLamp(lamp = new Lamp(857,224));
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(750,350));  
      } else if (i == 1){ //Hallen
        rooms.get(i).addLamp(lamp = new Lamp(681,539));
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(690,350));  
      } else if (i == 2){ //Vardagsrummet
        rooms.get(i).addLamp(lamp = new Lamp(1132,576));
        rooms.get(i).addLamp(lamp = new Lamp(1237,791));
        rooms.get(i).addLamp(lamp = new Lamp(1049,328));
       rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(630,350));  
      } else if (i == 3){ //Sovrum 1
        rooms.get(i).addLamp(lamp = new Lamp(1298,141));
        rooms.get(i).addLamp(lamp = new Lamp(1457,320));
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(570,350));  
      } else if (i == 4){ //Sovrum 2
        rooms.get(i).addLamp(lamp = new Lamp(1398,436));
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(510,350));    
      } else if (i == 5){ //Sovrum 3
        rooms.get(i).addLamp(lamp = new Lamp(853,694));
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(450,350));  
      } else if (i == 6){ //Sovrum 4
        rooms.get(i).addLamp(lamp = new Lamp(1139,184));
        rooms.get(i).addLamp(lamp = new Lamp(1244,134));
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(390,350));  
      } else if (i == 7){ //Master control
        rooms.get(i).addLampSwitch(lampSwitch = new LampSwitch(330,350));  
      }
    }
 
  void draw(){ 
    image(img,600,50,950,800);
    for(int i = 0; i < rooms.size(); i++){
      rooms.get(i).draw();
    } 
    //Room room = control.rooms.get(0);
  }
 
}
