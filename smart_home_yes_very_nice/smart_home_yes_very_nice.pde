import http.requests.*;

Network network = new Network();



View view;
Control control;
void setup(){
  
  control = new Control();
  control.retrieveFirstState();
  frameRate(60);
  size(1600,900);
  background(128);  
  
  view = new View();

}

void draw(){ 
  //update(mouseX, mouseY);
  background(128);
  view.draw();
  
 //<>//
  int r = 0;
  
  if(frameCount % 10 == 0) {
    //JSONArray rooms = network.getState().getJSONArray("rooms");
    for(Room room : control.rooms) {
      for(Lamp lamp : room.lights) {
        network.changeRGB(r++, r++, r++, room.id, lamp.id);
      }
    }
     

  }
  //println(frameCount);
}

void mousePressed(){
  if(view.room.switchOver){
    //view.room.lamp.toggle();
    //view.room.toggle();
  }
  println("X: " + mouseX + " Y: " + mouseY); //änvänd bara som hjälp för att veta vart saker ska ligga
}

void update(int x, int y){
  if (x > 350 && x < 430 && y > 700 && y < 735){
    view.room.switchOver = true; 
  } else {
    view.room.switchOver = false;   
  }
}
