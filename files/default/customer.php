<?php
class Customer {
  public $id;
  public $first_name;
  public $last_name;
  public $email;
  public $latitude;
  public $longitude;
  public function __construct($id, $first_name, $last_name, $email, $latitude, $longitude) {
    $this->id = $id;
    $this->first_name = $first_name;
    $this->last_name = $last_name;
    $this->email = $email;
    $this->latitude = $latitude;
    $this->longitude = $longitude;
  }
}
function get_sample_customers() {
  include "dbvars.php";

  $array = array();

  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname);

  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  // Perform SQL query
  $sql = "SELECT * FROM customers";
  $result = $conn->query($sql);
  $i=0;

  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $array[$i]=new Customer("$row[id]", "$row[first_name]", "$row[last_name]", "$row[email]","$row[latitude]","$row[longitude]");
     $i=$i+1;
    }
} else {
    echo "0 results";
}

// Close connection
$conn->close();
return $array;
}
?>
