import http.requests.*;

class Network {
 
 
  JSONObject jsonResponse = new JSONObject();
  String url = "https://udpr.cheadle.se/test/";
  
  
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
