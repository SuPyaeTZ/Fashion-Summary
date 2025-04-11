<?php 

include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
   $user_id = $_SESSION['user_id'];
} else {
   $user_id = '';
}

// Check if the user is locked out
$ip_address = $_SERVER['REMOTE_ADDR'];
$attempts_query = $conn->prepare("SELECT COUNT(*) FROM login_attempts WHERE ip_address = ? AND try_time > (UNIX_TIMESTAMP() - 100)"); // Lockout period of 1 second
$attempts_query->execute([$ip_address]);
$attempt_count = $attempts_query->fetchColumn();

$remaining_attempts = 3 - $attempt_count;

if ($attempt_count >= 3) {
    // Add a 1-second delay after 3 attempts
    sleep(1);
    die('You are locked out due to multiple unsuccessful login attempts. Please try again later. Wait 1 second!!!');
}

if (isset($_POST['submit'])) {

   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);

   $select_user = $conn->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
   $select_user->execute([$email, $pass]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if ($select_user->rowCount() > 0) {
      $_SESSION['user_id'] = $row['id'];
      header('location:home.php');
      exit();
   } else {
      // Log the failed attempt
      $insert_attempt = $conn->prepare("INSERT INTO login_attempts (ip_address, try_time) VALUES (?, UNIX_TIMESTAMP())");
      $insert_attempt->execute([$ip_address]);
      
      // Update the error message with remaining attempts
      if ($remaining_attempts > 1) {
          $message[] = "Incorrect username or password! $remaining_attempts attempts remaining.";
      } elseif ($remaining_attempts == 1) {
          $message[] = "Incorrect username or password! 1 attempt remaining.";
      } else {
          $message[] = "You have exceeded the maximum number of attempts.";
      }
   }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Login</title>
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">
</head>
<body>
   
<?php include 'components/user_header.php'; ?>
<div class="banner-box2 f-slide-3">
        <div class="banner-text-container2">
        <div class="banner-text2">
            <span>Fashion Summary</span>
            <strong>Login</strong>
        </div>
        </div>
    </div>
<section class="form-container1">
<div class="row">

<div class="image">
<img src="images/login.png" alt="">
 </div>
   <form action="" method="post">
      <h2>Welcome</h2>
      <h3>Login now</h3>
      <input type="email" name="email" required placeholder="Enter your email" maxlength="50" class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <div class="password-container">
    <input type="password" id="password" name="pass" required placeholder="Enter your password" maxlength="20" class="box" oninput="this.value = this.value.replace(/\s/g, '')">
    <i class="fas fa-eye" id="togglePassword"></i>
</div>


      <input type="submit" value="login now" class="btn" name="submit">
      <p>Don't have an account?</p>
      <div class="social-icons">
            <a href="https://www.facebook.com/"><img src="images/fb.png"/></a>
            <a href="https://twitter.com/i/flow/login"><img src="images/twitter.png"/></a>
            <a href="https://accounts.google.com/v3/signin/identifier?dsh=S704704954%3A1673878382527462&authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F%3Futm_source%3Dsign_in_no_continue%26pli%3D1&ec=GAlAwAE&hl=en_GB&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession"><img src="images/google.png"/></a>
        </div>
      <a href="user_register.php" class="option-btn">register now</a>
   </form>
</div>
</section>

<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

<script>



document.addEventListener("DOMContentLoaded", function () {
    const togglePassword = document.getElementById("togglePassword");
    const passwordField = document.getElementById("password");

    togglePassword.addEventListener("click", function () {
        // Toggle password visibility
        if (passwordField.type === "password") {
            passwordField.type = "text";
            togglePassword.classList.remove("fa-eye");
            togglePassword.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            togglePassword.classList.remove("fa-eye-slash");
            togglePassword.classList.add("fa-eye");
        }
    });
});

</script>

</body>
</html>
