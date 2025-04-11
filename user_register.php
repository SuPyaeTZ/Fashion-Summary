<?php   
include 'components/connect.php';

session_start();
$user_id = $_SESSION['user_id'] ?? '';

// Initialize messages array
$message = [];

if(isset($_POST['submit'])){
   // Collect and sanitize input
   $name = htmlspecialchars(trim($_POST['name']));
   $email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
   $pass = trim($_POST['pass']);
   $cpass = trim($_POST['cpass']);

   // Validate input
   if(empty($name) || empty($email) || empty($pass) || empty($cpass)){
      $message[] = 'All fields are required!';
   } elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)){
      $message[] = 'Invalid email format!';
   } elseif($pass !== $cpass){
      $message[] = 'Passwords do not match!';
   } elseif(strlen($pass) < 8 || !preg_match('/[A-Z]/', $pass) || !preg_match('/\d/', $pass) || !preg_match('/[\W_]/', $pass)) {
      $message[] = 'Password must have at least 8 characters, 1 uppercase, 1 number, and 1 special character.';
   } else {
      // Check if the email already exists
      $select_user = $conn->prepare("SELECT * FROM users WHERE email = ?");
      $select_user->execute([$email]);

      if($select_user->rowCount() > 0){
         $message[] = 'Email already exists!';
      } else {
         // Hash password securely
         $hashed_password = password_hash($pass, PASSWORD_DEFAULT);

         // Insert user into database
         $insert_user = $conn->prepare("INSERT INTO users(name, email, password) VALUES(?, ?, ?)");
         $insert_user->execute([$name, $email, $hashed_password]);

         $message[] = 'Registered successfully, login now!';
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
   <title>register</title>
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">


</head>
<body>
   
<?php include 'components/user_header.php'; ?>
<div class="banner-box3 f-slide-3">
        <div class="banner-text-container3">
        <div class="banner-text3">
            <span>Fashion Summary</span>
            <strong>Register</strong>
        </div>
        </div>
    
    </div> 
<section class="form-container">
<div class="row">

<div class="image">
<img src="images/Mobile-login.png" alt="">
 </div>
   <form action="" method="post">
      <h2>Welcome</h2>
      <h3>register now</h3>
      <input type="text" name="name" required placeholder="Enter your username" maxlength="20"  class="box">
      <input type="email" name="email" required placeholder="Enter your email" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <div class="password-container">
   <input type="password" name="pass" id="password" required placeholder="Enter your password" maxlength="50" class="box">
   <i class="fa fa-eye" id="togglePassword"></i>
</div>
<span id="password-error" style="color:red;"></span>

<div class="password-container">
   <input type="password" name="cpass" id="confirmPassword" required placeholder="Confirm your password" maxlength="50" class="box">
   <i class="fa fa-eye" id="toggleConfirmPassword"></i>
</div>
<span id="confirm-password-error" style="color:red;"></span>

      <input type="submit" value="register now" class="btn" name="submit">
      <p>Already have an account?</p>
      <div class="social-icons">
            <a href="https://www.facebook.com/"><img src="images/fb.png"/></a>
            <a href="https://twitter.com/i/flow/login"><img src="images/twitter.png"/></a>
            <a href="https://accounts.google.com/v3/signin/identifier?dsh=S704704954%3A1673878382527462&authuser=0&continue=https%3A%2F%2Fmyaccount.google.com%2F%3Futm_source%3Dsign_in_no_continue%26pli%3D1&ec=GAlAwAE&hl=en_GB&service=accountsettings&flowName=GlifWebSignIn&flowEntry=AddSession"><img src="images/google.png"/></a>
        </div>
      <a href="user_login.php" class="option-btn">login now</a>
   </form>
</div>
</section>





<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const passwordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirmPassword");
    const passwordError = document.getElementById("password-error");
    const confirmPasswordError = document.getElementById("confirm-password-error");
    const togglePassword = document.getElementById("togglePassword");
    const toggleConfirmPassword = document.getElementById("toggleConfirmPassword");

    // Password strength pattern
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$/;

    // Validate password in real time
    passwordInput.addEventListener("input", function () {
        if (!passwordPattern.test(passwordInput.value)) {
            passwordError.innerText = "⚠️ Password must be at least 8 characters, include 1 uppercase letter, 1 number, and 1 special character.";
        } else {
            passwordError.innerText = "✅ Strong password!";
            passwordError.style.color = "green";
        }
    });

    // Confirm password validation
    confirmPasswordInput.addEventListener("input", function () {
        if (confirmPasswordInput.value !== passwordInput.value) {
            confirmPasswordError.innerText = "❌ Passwords do not match!";
        } else {
            confirmPasswordError.innerText = "✅ Passwords match!";
            confirmPasswordError.style.color = "green";
        }
    });

    // Toggle password visibility
    function togglePasswordVisibility(input, toggleIcon) {
        toggleIcon.addEventListener("click", function () {
            if (input.type === "password") {
                input.type = "text";
                toggleIcon.classList.remove("fa-eye");
                toggleIcon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                toggleIcon.classList.remove("fa-eye-slash");
                toggleIcon.classList.add("fa-eye");
            }
        });
    }

    togglePasswordVisibility(passwordInput, togglePassword);
    togglePasswordVisibility(confirmPasswordInput, toggleConfirmPassword);
});

</script>

</body>
</html>