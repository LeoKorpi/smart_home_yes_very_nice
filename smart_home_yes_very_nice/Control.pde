class Control {

  ArrayList<Room> rooms;
  
  Control() {
    rooms = new ArrayList<Room>();
    retrieveFirstState();
    
  }
  
  void toggleRoom() {
    
    
  
  }
  
  
  void updateAllLamps() {
    
  
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
