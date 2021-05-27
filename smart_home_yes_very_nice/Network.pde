import http.requests.*;
import java.lang.Exception;
class Network {
 
 
  JSONObject jsonResponse = new JSONObject();
  String url = "https://udpr.cheadle.se/";
  
  
  // Send the change
  void sendChange(Room room, Lamp lamp) {
   GetRequest get = new GetRequest(url + "?type=set");
    
  }
  
  
  void changeRGB(int r, int g, int b, int roomId, int lampId) {
    
    String arguments = "r=" + r + "&" + 
                       "g=" + g + "&" + 
                       "b=" + b + "&" + 
                       "roomid=" + roomId +  "&" +  
                       "lampId=" + lampId;
    GetRequest get = new GetRequest(url + "?type=set&" + arguments);
    get.send();
    
  }
  
  
  JSONObject getState() {
    JSONObject jsonResponse = new JSONObject();
    GetRequest getRequest = new GetRequest(url + "?type=get");
    getRequest.send();
    println(getRequest.getContent());
    
    if(getRequest.getContent() == "ERROR" ) {
      println("Something is wrong on the server side");
    }
    
    println(getRequest.getContent());
    try {
   
       jsonResponse = parseJSONObject(getRequest.getContent());

    } catch (Exception e) {
      
      println("ERROR: " + e.getMessage());
      exit();
    }
   return jsonResponse;   

  }
}
