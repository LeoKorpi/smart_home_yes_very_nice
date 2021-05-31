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


  void updateData() {
    JSONObject state = network.getState();
    
  }

}
