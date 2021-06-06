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

    
    if(isset($_REQUEST['roomid']) && isset($_REQUEST["lampid"])) {
        if(isset($_REQUEST["r"]) && isset($_REQUEST["g"]) && isset($_REQUEST["b"])) {
            
            $roomIndex = 0;
            
            foreach($json["rooms"] as $room) {
                if($_REQUEST["roomid"] == $room["id"]) {
                    $lampIndex = 0;
                    foreach($room["lamps"] as $lamp) {
                        if($_REQUEST["lampid"] == $lamp["id"]) {
                            $lamp["r"] = $_REQUEST["r"];
                            $lamp["g"] = $_REQUEST["g"];
                            $lamp["b"] = $_REQUEST["b"];
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
    
    if(isset($_REQUEST["roomid"]) && isset($_REQUEST["on"])) {
        $roomIndex = -1;

        foreach($json["rooms"] as $key => $room) {
            if($room["id"] == $_REQUEST["roomid"]) {
                $roomIndex = $key;
            }
        }
        if($roomIndex >= 0) {
            $result["rooms"][$roomIndex]["on"] = $_REQUEST["on"];
        
            for($i = 0; $i < count($result["rooms"][$roomIndex]["lamps"]); $i++) {
                $result["rooms"][$roomIndex]["lamps"][$i]["on"] = $_REQUEST["on"];
            }    
        }
    }
    
    return $result;
}


if(isset($_REQUEST['type'])) {

    if($_REQUEST['type'] == "get") {

        $file = file_get_contents("state.json");
    
        if(!$file) {
            http_response_code(500);
            die("ERROR");
        }
    
        http_response_code(200);
        
        echo $file;
        
    
    }
}

if(isset($_REQUEST['type'])) {
    if($_REQUEST['type'] == "set") {
        $json = json_encode(updateState());
        $fileToWrite = fopen("state.json", "w+");
        fwrite($fileToWrite, $json);
        fclose($fileToWrite);
    }
    
    
    if($_REQUEST["type"] != "set" && $_REQUEST["type"] != "get") {
        //http_response_code(500);
        echo "ERROR";
    }
    
}


return 0;

session_destroy();

