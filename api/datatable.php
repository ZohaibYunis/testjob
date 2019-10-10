<?php 


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "api_db";

$conn = mysqli_connect($servername, $username, $password, $dbname);

$sql = "SELECT users.firstname, students.name, students.class, students.rollnumber, students.created FROM students INNER JOIN users on students.user_id = users.id";

$resultset = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));

$data = array();
$i =1; 
while( $rows = mysqli_fetch_assoc($resultset) ) {
    
    
    $rows['inc'] = $i;
    $data[] = $rows;
    
    $i++;
    
}




$results = array(
    
"sEcho" => 1,
"iTotalRecords" => count($data),
"iTotalDisplayRecords" => count($data),
"aaData"=>$data);

//echo '<pre>';
//print_r($data);

echo json_encode($results);

?>