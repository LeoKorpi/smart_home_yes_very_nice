import http.requests.*;

Network network = new Network();

float x, y;

View view;
Lamp lamp;

void setup(){
  frameRate(60);
  size(1600,900);
  background(128);  
  
  x = width/2;
  y = height/2; 
  
  view = new View();
  lamp = new Lamp(x,y);
}

void draw(){ 
  update(mouseX, mouseY);
  background(128); 
  view.draw();
  
  if(frameCount % 120 == 0) {
    
  }
  //println(frameCount);
}

void mousePressed(){
  if(view.room.switchOver){
    view.room.lamp.toggle();
    view.room.toggle();
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
