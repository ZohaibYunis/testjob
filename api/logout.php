<?php 

if (isset($_POST['Logout'])){

if (isset($_COOKIE['JWT'])) {
    unset($_COOKIE['JWT']);
    setcookie("JWT", "", -1);

            // set response code
        http_response_code(200);

        // show user details
        echo json_encode(array(
            "data" => "LogOUT."
        ));
    
}else{
        http_response_code(200);
        echo json_encode(array(
            "data" => "Return To Login Page."
        ));    
    
}    
    
}


if (isset($_POST['local'])){
    
    
if (isset($_COOKIE['JWT'])) {
    
}else{
        http_response_code(200);
        echo json_encode(array(
            "data" => "Return To Login Page."
        ));    
    
}    
    
}



    
