class Control {

ArrayList<Room> rooms;
  
  Control() {
    rooms = new ArrayList<Room>();
    retrieveFirstState();
    
  }
  

  
  //Vad gör denna?
  void toggleRoom() {
    
    
  }
  
  
  void updateLamps() {
  JSONObject state = network.getState();
  
  JSONArray JSONrooms = state.getJSONArray("rooms");
  
  //For-loops som hämtar rum och lampor från servern
  for(int roomIndex = 0; roomIndex < JSONrooms.size(); roomIndex++) {
    JSONObject JSONroom = JSONrooms.getJSONObject(roomIndex);
    JSONArray JSONlamps = JSONroom.getJSONArray("lamps");
    
    for(int lampIndex = 0; lampIndex < JSONlamps.size(); lampIndex++) {
      Lamp lamp = this.rooms.get(roomIndex).lights.get(lampIndex);
      JSONObject JSONlamp = JSONlamps.getJSONObject(lampIndex); 
  
      lamp.x = JSONlamp.getFloat("x");
      lamp.y =  JSONlamp.getFloat("y");
      lamp.intensity = JSONlamp.getInt("intensity");
      lamp.on = JSONlamp.getBoolean("on");
      
      lamp.changeColor(JSONlamp.getInt("r"), JSONlamp.getInt("g"), JSONlamp.getInt("b"));
      
    }
  }
  
  
  
  void updateLamps() {
  JSONObject state = network.getState();
  
  JSONArray JSONrooms = state.getJSONArray("rooms");
  
  for(int roomIndex = 0; roomIndex < JSONrooms.size(); roomIndex++) {
    JSONObject JSONroom = JSONrooms.getJSONObject(roomIndex);
    JSONArray JSONlamps = JSONroom.getJSONArray("lamps");
    
    for(int lampIndex = 0; lampIndex < JSONlamps.size(); lampIndex++) {
      Lamp lamp = this.rooms.get(roomIndex).lights.get(lampIndex);
      JSONObject JSONlamp = JSONlamps.getJSONObject(lampIndex); 
  
      lamp.x = JSONlamp.getFloat("x");
      lamp.y =  JSONlamp.getFloat("y");
      lamp.intensity = JSONlamp.getInt("intensity");
      lamp.on = JSONlamp.getBoolean("on");
      
      lamp.changeColor(JSONlamp.getInt("r"), JSONlamp.getInt("g"), JSONlamp.getInt("b"));
      
    }
  }

                          
                            
  }
  
//Lamp(float x, float y, int id, int intensity, boolean on) {
  void addLampsToRoom(Room room, JSONArray lamps) {
    for(int i = 0; i < lamps.size(); i++){
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

  void retrieveFirstState() {
    JSONObject state = network.getState();
    

    JSONArray rooms = state.getJSONArray("rooms");
    for(int i = 0; i < rooms.size(); i++) {
      JSONObject room = rooms.getJSONObject(i);
      this.rooms.add(new Room(room.getInt("id"), 
                              room.getBoolean("on"), 
                              room.getString("name")));
      
      addLampsToRoom(this.rooms.get(i), 
                     room.getJSONArray("lamps"));
                     
    }

  }

}
