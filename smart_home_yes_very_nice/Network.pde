import http.requests.*;
import java.lang.Exception;
class Network {

  JSONObject jsonResponse = new JSONObject();
  String url = "https://samuel.ssis.nu/";

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
    JSONObject jsonResponse = new JSONObject();
    GetRequest getRequest = new GetRequest(url + "?type=get");
    getRequest.send();

    if (getRequest.getContent() == "ERROR" ) {
      println("Something is wrong on the server side");
    }

    jsonResponse = parseJSONObject(getRequest.getContent());

    return jsonResponse;
  }
}
