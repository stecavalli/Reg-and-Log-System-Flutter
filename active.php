<?php
     $server "YOUR SERVER NAME";   // Edit this line by inserting localhost or the correct host name
     $user = "YOUR USERNAME";      // Edit this line by entering the username to access the database
     $pass = "";                   // Edit this line by entering the password to access the database, some servers accept a blank field
     $db = "YOUR DATABASE NAME";   // Edit this line by inserting the correct database name
	 
     $connect = mysqli_connect($server, $user, $pass, $db);

     if (!$connect) {
         die("Database connection failed:" . mysqli_connect_error());
     }
     
     if (isset($_GET['token'])) {
          $token = $_GET['token'];
      
          $check_token_query = "SELECT username FROM users_activation WHERE token=? AND TIMESTAMPDIFF(HOUR, created_at, NOW()) <= 24";
          $check_token_stmt = mysqli_prepare($connect, $check_token_query);
          mysqli_stmt_bind_param($check_token_stmt, "s", $token);
          mysqli_stmt_execute($check_token_stmt);
          $check_token_result = mysqli_stmt_get_result($check_token_stmt);
      
          if (mysqli_num_rows($check_token_result) == 1) {
              $user_row = mysqli_fetch_assoc($check_token_result);
              $username = $user_row['username'];
      
              $activate_user_query = "UPDATE users SET active = 1 WHERE username=?";
              $activate_user_stmt = mysqli_prepare($connect, $activate_user_query);
              mysqli_stmt_bind_param($activate_user_stmt, "s", $username);
              mysqli_stmt_execute($activate_user_stmt);
      
              $delete_token_query = "DELETE FROM users_activation WHERE username=?";
              $delete_token_stmt = mysqli_prepare($connect, $delete_token_query);
              mysqli_stmt_bind_param($delete_token_stmt, "s", $username);
              mysqli_stmt_execute($delete_token_stmt);
      
              echo "Your account has been successfully activated.";
          } else {
              echo "Invalid or expired activation token.";
          }
     } else {
         echo "Missing 'token' parameter in URL.";
     }
     
     mysqli_close($connect);
?>