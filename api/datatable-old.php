<?php //

/* Database connection start */
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "api_db";

$conn = mysqli_connect($servername, $username, $password, $dbname) or die("Connection failed: " . mysqli_connect_error());

/* Database connection end */


// storing  request (ie, get/post) global array to a variable  

$requestData = $_REQUEST;


$columns = array(
// datatable column index  => database column name

    0 => 'user_id',
    1 => 'name',
    2 => 'class',
    3 => 'rollnumber',
    4 => 'created',

);

// getting total number records without any search

$sql = "SELECT `id`, `user_id`, `name`, `class`, `rollnumber`, `created`, `modified` ";
$sql .= " FROM students";

$query = mysqli_query($conn, $sql) or die();
$totalData = mysqli_num_rows($query);


$totalFiltered = $totalData;  // when there is no search parameter then total number rows = total number filtered rows.


$sql = "SELECT `id`, `user_id`, `name`, `class`, `rollnumber`, `created`, `modified` ";
$sql .= " FROM students WHERE 1=1";

if (!empty($requestData['search']['value'])) {   // if there is a search parameter, $requestData['search']['value'] contains search parameter
    
    $sql .= " AND ( name LIKE '" . $requestData['search']['value'] . "%' ";
    
    $sql .= " OR class LIKE '" . $requestData['search']['value'] . "%' ";

    $sql .= " OR rollnumber LIKE '" . $requestData['search']['value'] . "%' )";
}

    $sql .= " ORDER BY " . @$columns[@$requestData['order'][0]['column']] . "   " . @$requestData['order'][0]['dir'] . "  LIMIT " . @$requestData['start'] . ", " . @$requestData['length'] . "   ";


$query          = mysqli_query($conn, $sql) or die();

$totalFiltered  = mysqli_num_rows($query); // when there is a search parameter then we have to modify total number filtered rows as per search result. 


/* $requestData['order'][0]['column'] contains colmun index, $requestData['order'][0]['dir'] contains order such as asc/desc  */

//echo $sql;

$query = mysqli_query($conn, $sql) or die();

$data = array();
$i = 1;

while ($row = mysqli_fetch_array($query)) {  // preparing an array
    $nestedData = array();
    
    $nestedData[] = $i;
    $nestedData[] = $row["user_id"];
    $nestedData[] = $row["name"];
    $nestedData[] = $row["class"];
    $nestedData[] = $row["rollnumber"];
    $nestedData[] = $row["created"];
    ++$i;
    $data[] = $nestedData;
}



$json_data = array(
    "draw" => intval(@$requestData['draw']), // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
    "recordsTotal" => intval($totalData), // total number of records
    "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
    "data" => $data   // total data array
);


//echo "<pre>";
//print_r($data);

echo json_encode($json_data);  // send data as json format
