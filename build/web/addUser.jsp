<%@include file="connectionAdmin.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Admin Dashboard</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="global_assets\css\icons\icomoon\styles.min.css" rel="stylesheet" type="text/css">
	<link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets\css\bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
	<link href="assets\css\layout.min.css" rel="stylesheet" type="text/css">
	<link href="assets\css\components.min.css" rel="stylesheet" type="text/css">
	<link href="assets\css\colors.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="global_assets\js\main\jquery.min.js"></script>
	<script src="global_assets\js\main\bootstrap.bundle.min.js"></script>
	<script src="global_assets\js\plugins\loaders\blockui.min.js"></script>
	<script src="global_assets\js\plugins\ui\ripple.min.js"></script>
	<!-- /core JS files -->
        
        <!--    sweet alert 2-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.all.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.4/dist/sweetalert2.min.css" rel="stylesheet">
        

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
	<style>
            @import url('https://fonts.googleapis.com/css2?family=Catamaran:wght@700&display=swap');
            *{
                font-family: 'Catamaran', sans-serif;
            }
        </style>
</head>

<body>
    
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    
	<!-- Main navbar -->
        <%@include file="headerAdmin.jsp" %>
	<!-- /main navbar -->

					
	<!-- Page content -->
	<div class="page-content">
            
            <%@include file="adminSideBar.jsp" %>
            
		<!-- Main content -->
		<div class="content-wrapper">

                    <!-- Page header -->
                    <div class="page-header">
                        <div class="page-header-content header-elements-md-inline">
                            <div class="page-title d-flex">
                                <h4>Add a user</h4>
                                <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /page header -->


                    <!-- Content area -->
			<div class="content pt-0">

				<!-- Dashboard content -->
				<div class="card">
                                    
                                    <div class="card-header header-element-inline">
                                        <h3>Add A New User</h3>
                                    </div>
                                    <div class="card-body py-0 mb-4">
                                        
                                        <div class="container">
                                        
                                            <form class="needs-validation" action="addUser" method="post" novalidate>
                                            
                                               <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        <div class="mb-3">
                                                            <input type="text" placeholder="User Name" class="form-control" name="name" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book name.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                    
                                                        <div class="mb-3">
                                                            
                                                            <input type="email" class="form-control" placeholder="Email" name="email" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book details.
                                                            </div>
                                                        </div>
                                                    
                                                    </div>
                                                    
                                                </div>
                                                
                                                <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                                                                          
                                                        <div class="mb-3">
                                                            <label class="form-label">Password</label>
                                                            <input type="password" placeholder="Password" class="form-control" name="password" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book author.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                    
                                                        <div class="mb-3">
                                                            <label class="form-label">Date of Birth</label>
                                                            <input type="date" placeholder="Date of Birth" class="form-control" name="dob" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book publish.
                                                            </div>
                                                        </div>
                                                    
                                                    </div>
                                                    
                                                </div>
                                                
                                                <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        <div class="mb-3">
                                                            <input type="text" placeholder="Roll No." class="form-control" name="rollno" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid branch.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                    
                                                        <div class="mb-3">
                                                            <input type="text" class="form-control" placeholder="Department" name="department" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book price.
                                                            </div>
                                                        </div>
                                                    
                                                    </div>
                                                    
                                                </div>
                                                
                                                <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        <div class="form-check">
                                                            <label style="margin-left:-30px;">User Type</label><br>

                                                            <input class="form-check-input" type="radio" name="userType" value="Student" checked>
                                                            <label class="form-check-label">Student</label><br>
                                                            <input class="form-check-input" type="radio" name="userType" value="Teacher">
                                                            <label class="form-check-label">Teacher</label><br>
                                                            <input class="form-check-input" type="radio" name="userType" value="Staff">
                                                            <label class="form-check-label">Staff</label>

                                                        </div>
                                                    </div>
                                                    
                                                </div><br>                 
                                                
                                                
                                                <div class="row">
                                                    <div class="col-md-6">            
                                                        <button type="submit" class="btn btn-outline-primary" style="border-radius: 8px; width: 100%;">Submit</button>
                                                    </div>
                                                </div>
                                            
                                            </form>
                                        </div>
                                    </div>
				</div>
				<!-- /dashboard content -->

			</div>
			<!-- /content area -->


			<!-- Footer -->
                        <%@include file="footerAdmin.jsp" %>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->
        
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
//                        title: 'Congrats!',
                        text: 'Add user successfully'
                      });
                }
                else if(status == "failed"){
                    Swal.fire({
                        icon: 'error',
                        title: 'Something went wrong'
                    });
                }
                else if(status == "exist"){
                    Swal.fire({
                        icon: 'error',
                        title: 'User already exists.'
                    });
                }
        </script>
</body>
</html>