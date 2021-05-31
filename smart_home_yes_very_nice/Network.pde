import http.requests.*;

class Network {
 
  JSONObject jsonResponse = new JSONObject();
  //String url = "https://udpr.cheadle.se/test/";
   
  String url = "https://udpr.cheadle.se/";

  /*
  // Send the change
  void sendChange(Room room, Lamp lamp) {
   GetRequest get = new GetRequest(url + "sendState");
    
  }
  */


  // Send the change
  void sendChange(Room room, Lamp lamp) {
    GetRequest get = new GetRequest(url + "?type=set");
  }



  void changeRGB(int r, int g, int b, int roomId, int lampId) {
    
    PostRequest post = new PostRequest(url);
    post.addData("type", "set");
    post.addData("r", r + "");
    post.addData("g", g + "");
    post.addData("b", b + "");
    post.addData("roomid", roomId  + "");
    post.addData("lampid", lampId + ""); 
    post.send();
  }


  JSONObject getState() {
    GetRequest getRequest = new GetRequest(url + "getState");
    getRequest.send();
    
    jsonResponse = parseJSONObject(getRequest.getContent());
    
    return jsonResponse;   
  }
}
