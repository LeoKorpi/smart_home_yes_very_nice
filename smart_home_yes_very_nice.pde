import http.requests.*;



Network network = new Network();

float x, y;


void setup(){
  
    
  frameRate(60);
    
  size(1280,720);
  background(183,245,247);  
  
  x = width/2;
  y = height/2; 
}

void draw(){ 
  background(183,245,247);  
  fill(0);
  textSize(48);
  text("lets build a house yall", x-240, y);
    
    
    
  if(frameCount % 120 == 0) {
    
  }
  
  
}
