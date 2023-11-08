<?php
     $server = "YOUR SERVER NAME";  // Edit this line by inserting localhost or the correct server name
     $user = "YOUR USERNAME";       // Edit this line by entering the username to access the database
     $pass = "";                    // Edit this line by entering the password to access the database, some servers accept a blank field
     $db = "YOUR DATABASE NAME";    // Edit this line by inserting the correct database name
     
     $conn = mysqli_connect($server, $user, $pass, $db);
     
     if (!$conn) {
         die("Database connection failed:" . mysqli_connect_error());
     }
     
     $username = $_POST['username'];
     $password = $_POST['password'];
     
     $sql = "SELECT * FROM users WHERE username=?";
     $stmt = mysqli_prepare($conn, $sql);
     mysqli_stmt_bind_param($stmt, "s", $username);
     mysqli_stmt_execute($stmt);
     $result = mysqli_stmt_get_result($stmt);
     
     if (!$result) {
         die("Query error: " . mysqli_errno($conn));
     }
     $row = mysqli_fetch_assoc($result);
     if ($row) {
         $hashed_password = $row['password'];
         $is_active = $row['active']; 
     
         if ($is_active == 1 && password_verify($password, $hashed_password)) {
             $name = $row['name'];
             $lastname = $row['lastname'];
             $email = $row['mail'];
             $userVerified = $row['username'];
     
             echo "You are logged in.\nWelcome, " . $name . " " . $lastname . 
                 "\nE-Mail: " . $email . "\nUsername: " . $userVerified;
         } elseif ($is_active == 0) {
             echo "Your account is not yet activated. Please check your email for activation instructions.";
         } else {
             echo "Incorrect username or password";
         }
     } else {
         echo "Incorrect username or password";
     }
     mysqli_stmt_close($stmt);
     mysqli_close($conn);
?>
