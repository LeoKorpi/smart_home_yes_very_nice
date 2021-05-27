class View{
  
  PImage img;

 Room room;
  View(){ 
    img = loadImage("planlösning.png");
  }
 
  void setup(){
  }
  
  void draw(){ 
    image(img,600,50,950,800);
    Room room = control.rooms.get(0);
    room.draw();
  }
 
}
