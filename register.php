<?php
   $username = "YOUR USERNAME";      // Edit this line by entering the username to access the database
   $password = "";                   // Edit this line by entering the password to access the database, some servers accept a blank field
   $host = "YOUR SERVER NAME";       // Edit this line by inserting localhost or the correct server name
   $db_name = "YOUR DATABASE NAME";  // Edit this line by inserting the correct database name

   $connect = mysqli_connect($host, $username, $password, $db_name);

   $name = $_POST['name'];
   $lastname = $_POST['lastname'];
   $mail = $_POST['mail'];
   $user = $_POST['username'];
   $psw = $_POST['password'];
   $hashed_password = password_hash($psw, PASSWORD_DEFAULT);
   
   if (isset($_POST['name']) && isset($_POST['lastname']) &&    // This isset check is not needed 
       isset($_POST['mail']) && isset($_POST['username']) &&    // if the flutter app checks for 
       isset($_POST['password'])) {                             // empty mandatory form fields
       
       if (!filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL)) {
           echo "Email address is not valid";
       } elseif (strlen($_POST['password']) < 8) {
           echo "The password must be at least 8 characters long";
       } else {
           if ($connect) {
                 $check_username_query = "SELECT * FROM users WHERE username=?";
                 $check_username_stmt = mysqli_prepare($connect, $check_username_query);
                 mysqli_stmt_bind_param($check_username_stmt, "s", $user);
                 mysqli_stmt_execute($check_username_stmt);
                 $check_username_result = mysqli_stmt_get_result($check_username_stmt);
             
                 $check_email_query = "SELECT * FROM users WHERE mail=?";
                 $check_email_stmt = mysqli_prepare($connect, $check_email_query);
                 mysqli_stmt_bind_param($check_email_stmt, "s", $mail);
                 mysqli_stmt_execute($check_email_stmt);
                 $check_email_result = mysqli_stmt_get_result($check_email_stmt);
             
                 if (mysqli_num_rows($check_username_result) > 0) {
                     echo "Username not available";
                 } elseif (mysqli_num_rows($check_email_result) > 0) {
                     echo "Email address is already in use";
                 } else {
                     $activation_token = bin2hex(random_bytes(16));
             
                     $insert_activation_query = "INSERT INTO users_activation (username, token, created_at) VALUES (?, ?, NOW())";
                     $insert_activation_stmt = mysqli_prepare($connect, $insert_activation_query);
                     mysqli_stmt_bind_param($insert_activation_stmt, "ss", $user, $activation_token);
                     mysqli_stmt_execute($insert_activation_stmt);
             
                     $to = $mail;
                     $subject = "Activate your account";
                     $message = "Click on the following link to activate your account:\n" .
                                "http://YOUR-SUBDOMAIN-NAME.altervista.org/active.php?token=" . $activation_token;  // Edit this line by inserting the web address or IP address of the HTTP/WEB server used
                     $headers = "From: YOUR-SUBDOMAIN-NAME@altervista.org";                                         // Edit this line by inserting the the correct subdomain name
                     
                     mail($to, $subject, $message, $headers);
             
                     echo "An activation email has been sent to the address provided. Check your inbox.\n";
    
                     $insert_query = "INSERT INTO users (name, lastname, mail, username, password) VALUES (?, ?, ?, ?, ?)";
                     $insert_stmt = mysqli_prepare($connect, $insert_query);
                     mysqli_stmt_bind_param($insert_stmt, "sssss", $name, $lastname, $mail, $user, $hashed_password);
             
                     if (mysqli_stmt_execute($insert_stmt)) {
                         echo "Registration was successful";
                     } else {
                         echo "Registration failed: " . mysqli_error($connect);
                     }
                 }
             
                 mysqli_stmt_close($check_username_stmt);
                 mysqli_stmt_close($check_email_stmt);
                 mysqli_stmt_close($insert_activation_stmt);
                 mysqli_stmt_close($insert_stmt);
           } else {
               die("Database connection failed:" . mysqli_connect_error());
           }
       }
       
   } else {
               echo "Missing mandatory fields";   // This code will never run if the flutter app
   }                                              // checks for empty required form fields
   mysqli_close($connect);
?>
