<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="global_assets\css\icons\icomoon\styles.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\layout.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\components.min.css" rel="stylesheet" type="text/css">
    <link href="assets\css\colors.min.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!--    sweet alert 2-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.min.css" rel="stylesheet">

    <!-- Core JS files -->
    <script src="global_assets\js\main\jquery.min.js"></script>
    <script src="global_assets\js\main\bootstrap.bundle.min.js"></script>
    <script src="global_assets\js\plugins\loaders\blockui.min.js"></script>
    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script src="global_assets\js\plugins\visualization\d3\d3.min.js"></script>
    <script src="global_assets\js\plugins\visualization\d3\d3_tooltip.js"></script>
    <script src="global_assets\js\plugins\forms\styling\switchery.min.js"></script>
    <script src="global_assets\js\plugins\forms\selects\bootstrap_multiselect.js"></script>
    <script src="global_assets\js\plugins\ui\moment\moment.min.js"></script>
    <script src="global_assets\js\plugins\pickers\daterangepicker.js"></script>

    <script src="assets\js\app.js"></script>
    <script src="global_assets\js\demo_pages\dashboard.js"></script>
    
    <!-- /theme JS files -->
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Catamaran:wght@700&display=swap');
        *{
            font-family: 'Catamaran', sans-serif;
        }
        body{
            background: white;
        }
        .nav-link{
            padding: 10px;
            font-size: 18px;
        }
        .card-text{
            height: 70px;
        }
        .fa-icon-border{
            border: 1px solid black;
            padding: 10px;
            border-radius: 50%;
        }
        .fa-brands{
            font-size: 22px;
            color: black;
        }
    </style>
</head>
<body>
    
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    
	<div class="container">
		<div class="row" style="height: 100vh; justify-items: center; align-items: center;">
			<div class="col-md-6">
				<img src="global_assets/images/book.png" style="width: 70%; padding-right: 40px;" alt="CAR"/>
			</div>
			<div class="col-md-6" style="padding: 50px; border-radius: 17px; box-shadow: 0px 0px 16px -6px #919191;">
				<h2 style="text-align: center;">Student/Others Login!</h2>
				<p style="text-align: center;">Don't have an account, <a href="stu_register.jsp" style="text-decoration: none;">Sign up</a></p>
                                <form class="needs-validation" action="studentLogin" method="post" novalidate>
                                    <div class="mb-3">
                                        <label for="userEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                        <div id="validationServer01Feedback" class="invalid-feedback">
                                            Please provide a valid email.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="userPassword" class="form-label">Password</label>
                                        <input type="password" class="form-control" name="password" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                        <div id="validationServer01Feedback" class="invalid-feedback">
                                            Please provide a valid password.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <p class="w-100" style="text-align: right;">
                                            <a href="#">Forgot Password?</a>
                                        </p>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-outline-primary"style="border-radius: 30px; width: 100%;">Sign In</button>
				</form>
			</div>
		</div>
	</div>
    
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();


    //alert js
    var status = document.getElementById("status").value;
    
        if(status == "success"){
            Swal.fire({
                icon: 'success',
                title: 'Congrats!',
                text: 'Account Created Successfully'
              });
        }
        else if(status == "failed"){
            Swal.fire({
                icon: 'failed',
                title: 'Something went wrong'
            });
        }
</script>
</body>
</html>