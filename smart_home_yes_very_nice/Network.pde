import http.requests.*;
import java.lang.Exception;
class Network {

  JSONObject jsonResponse = new JSONObject();
  String url = "https://samuel.ssis.nu/";




  void toggleRoom(Room room) {
    println("Sending toggle: " + room.on + " -> " + !room.on);
    PostRequest post = new PostRequest(url);
    post.addData("type", "set");
    post.addData("roomid", room.id  + "");
    post.addData("on", !room.on + "");
    post.send();
  }

  void toggleRoomOff(Room room) {
    println("Sending toggle: " + room.on + " -> " + !room.on);
    PostRequest post = new PostRequest(url);
    post.addData("type", "set");
    post.addData("roomid", room.id  + "");
    post.addData("on", false + "");
    post.send();
  }

  void toggleRoomOn(Room room) {
    println("Sending toggle: " + room.on + " -> " + !room.on);
    PostRequest post = new PostRequest(url);
    post.addData("type", "set");
    post.addData("roomid", room.id  + "");
    post.addData("on", true + "");
    post.send();
  }


  void changeRGB(int r, int g, int b, int lampId) {    
    PostRequest post = new PostRequest(url);
    post.addData("type", "set");
    post.addData("r", r + "");
    post.addData("g", g + "");
    post.addData("b", b + "");
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
