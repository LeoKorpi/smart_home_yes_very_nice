class View{
  
  PImage img;  
  Room room; 
 
  View(){ 
    img = loadImage("planlösning.png");
    room = new Room();
  }
 
  void setup(){
  }
  
  void draw(){ 
    image(img,600,50,950,800);
    room.draw();
  }
 
}
