<?php
session_start();

function updateState() {


    $file = file_get_contents("state.json");

    
    if(!$file) 
    {
        return false;
    }
    else
    {
        $json = json_decode($file, true);
    }

    $result = $json;

    
    if(isset($_POST['roomid']) && isset($_POST["lampid"])) {
        if(isset($_POST["r"]) && isset($_POST["g"]) && isset($_POST["b"])) {
            
            $roomIndex = 0;
            
            foreach($json["rooms"] as $room) {
                if($_POST["roomid"] == $room["id"]) {
                    $lampIndex = 0;
                    foreach($room["lamps"] as $lamp) {
                        if($_POST["lampid"] == $lamp["id"]) {
                            $lamp["r"] = $_POST["r"];
                            $lamp["g"] = $_POST["g"];
                            $lamp["b"] = $_POST["b"];
                            unset($result["rooms"][$roomIndex][$lampIndex]);
                            $result["rooms"][$roomIndex]["lamps"][$lampIndex] = $lamp;
                        }
                        $lampIndex++;
                    }
                }
                $roomIndex++;
            }
        }
    }
    /*
    if(isset($_GET["roomid"]) && isset($_GET["on"])) {
        foreach($json["rooms"] as $key => $room) {
            if($room["id"] == $_GET["roomid"]) {
                $room["on"] = $_GET["on"];
            }
        }
    }
    */


    
    return $result;
}


if(isset($_GET['type'])) {

    if($_GET['type'] == "get") {

        $file = file_get_contents("state.json");
    
        if(!$file) {
            http_response_code(500);
            die("ERROR");
        }
    
        http_response_code(200);
        
        echo $file;
        
    
    }
}

if(isset($_POST['type'])) {
    if($_POST['type'] == "set") {
        $json = json_encode(updateState());
        
        $fileToWrite = fopen("state.json", "w+");
        fwrite($fileToWrite, $json);
        fclose($fileToWrite);
    }
    
    
    if($_POST["type"] != "set" && $_GET["type"] != "get") {
        //http_response_code(500);
        echo "ERROR";
    }
    
}


return 0;

session_destroy();

