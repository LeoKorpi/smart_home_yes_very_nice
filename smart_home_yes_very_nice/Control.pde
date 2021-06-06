class Control {

  ArrayList<Room> rooms;
  
  ArrayList<Lamp> selectedLamp;



  Control() {
    rooms = new ArrayList<Room>();
    selectedLamp = new ArrayList<Lamp>();

    retrieveFirstState();
    for (int i = this.rooms.size() - 1; i >= 0 ; i--) {
      rooms.get(i).addLampSwitch(new LampSwitch(350, 690 - (60 * i)));
    }
  }
 
  
  void selectLamp(Lamp lamp) {
    selectedLamp.add(lamp);
  }
  
  
  void unSelectLamp() {
    selectedLamp.remove(0); 
    cp5.getController("Red Lighting").setVisible(false); 
    cp5.getController("Green Lighting").setVisible(false); 
    cp5.getController("Blue Lighting").setVisible(false);
  }



  void toggleRoom(Room room) {
    network.toggleRoom(room);
  }
  void toggleRoomOn(Room room) {
    network.toggleRoomOn(room);
  }  
  
  void toggleRoomOff(Room room) {
    network.toggleRoomOff(room);
  }
  
  void checkForLampSwitchActivation() {
    println(mouseX + " : " + mouseY);

    for (int i = 0; i < control.rooms.size(); i++) {
    Room currentRoom = control.rooms.get(i);
   
    if (currentRoom.lampSwitch.isMouseOver(mouseX, mouseY)) {

 
      if (currentRoom.on) {          
        currentRoom.lampSwitch.on = true;
        on.play();
      } else {
        currentRoom.lampSwitch.on = false;
        off.play();
      }
      
      if(currentRoom.id == 8) {
       
       for(int room = 0; room < control.rooms.size(); room++) {
         if(currentRoom.on) {
           control.toggleRoomOff(rooms.get(room));
         }
         else 
         {
           control.toggleRoomOn(rooms.get(room));
         }
         
       }
       
      } 
      else 
      {
        control.toggleRoom(currentRoom);
      }
    }
  } 
  println("============="); 
  
  }


  void updateLamps() {
    JSONObject state = network.getState();

    JSONArray JSONrooms = state.getJSONArray("rooms");

    //For-loops som hämtar rum och lampor från servern
    for (int roomIndex = 0; roomIndex < JSONrooms.size(); roomIndex++) {
      JSONObject JSONroom = JSONrooms.getJSONObject(roomIndex);
      
      this.rooms.get(roomIndex).on = JSONroom.getBoolean("on");
      //println("Name : " + this.rooms.get(roomIndex).name + " : " + this.rooms.get(roomIndex).on);
      JSONArray JSONlamps = JSONroom.getJSONArray("lamps");

      for (int lampIndex = 0; lampIndex < JSONlamps.size(); lampIndex++) {
        Lamp lamp = this.rooms.get(roomIndex).lights.get(lampIndex);
        JSONObject JSONlamp = JSONlamps.getJSONObject(lampIndex); 
  
        lamp.x = JSONlamp.getFloat("x");
        lamp.y =  JSONlamp.getFloat("y");
        lamp.on = JSONlamp.getBoolean("on");

        lamp.changeColor(JSONlamp.getInt("r"), JSONlamp.getInt("g"), JSONlamp.getInt("b"));
      }
    }
  }




  void addLampsToRoom(Room room, JSONArray lamps) {
    for (int i = 0; i < lamps.size(); i++) {
      JSONObject lamp = lamps.getJSONObject(i);
      room.addLamp(new Lamp(lamp.getFloat("x"), 
        lamp.getFloat("y"), 
        lamp.getInt("id"), 
        lamp.getInt("intensity"), 
        lamp.getBoolean("on"), 
        lamp.getInt("r"), 
        lamp.getInt("g"), 
        lamp.getInt("b")
        ));
    }
  }
  
  void checkForLampSelection() {
  
    for(int room = 0; room < rooms.size(); room++) {  
      for(int light = 0; light < this.rooms.get(room).lights.size(); light++) {
        Lamp lamp = this.rooms.get(room).lights.get(light); 
        if(lamp.mouseIsOver(mouseX, mouseY)) {
          println(this.rooms.get(room).name + " " + selectedLamp.size());
          if(selectedLamp.size() > 0) {
            selectedLamp.clear();  
          }
         
          selectedLamp.add(lamp);
        }  
      }
    }
  }

  void retrieveFirstState() {
    JSONObject state = network.getState();

    JSONArray rooms = state.getJSONArray("rooms");
    for (int i = 0; i < rooms.size(); i++) {
      JSONObject room = rooms.getJSONObject(i);
      this.rooms.add(new Room(room.getInt("id"), 
        room.getBoolean("on"), 
        room.getString("name")));

      addLampsToRoom(this.rooms.get(i), 
        room.getJSONArray("lamps"));
    }
  }
}
