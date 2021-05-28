import http.requests.*;

class Network {
 
  JSONObject jsonResponse = new JSONObject();
<<<<<<< Updated upstream
  String url = "https://udpr.cheadle.se/test/";
   
  String url = "https://udpr.cheadle.se/";

>>>>>>> Stashed changes
  // Send the change
  void sendChange(Room room, Lamp lamp) {
   GetRequest get = new GetRequest(url + "sendState");
    
  }
  
  JSONObject getState() {
    GetRequest getRequest = new GetRequest(url + "getState");
    getRequest.send();
    
    jsonResponse = parseJSONObject(getRequest.getContent());
    
    return jsonResponse;   
  }
}
