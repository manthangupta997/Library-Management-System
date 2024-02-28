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
	<div class="navbar navbar-expand-md navbar-light navbar-static">

		<!-- Header with logos -->
		<div class="navbar-header navbar-dark d-none d-md-flex align-items-md-center">
			<div class="navbar-brand navbar-brand-md">
				<a href="index.html" class="d-inline-block">
					<!-- <img src="global_assets\images\logo_light.png" alt=""> -->
					<h5 style="color: white;">Library Management System</h5>
				</a>
			</div>
			
			<div class="navbar-brand navbar-brand-xs">
				<a href="index.html" class="d-inline-block">
					<img src="global_assets\images\logo_icon_light.png" alt="">
				</a>
			</div>
		</div>
		<!-- /header with logos -->
	

		<!-- Mobile controls -->
		<div class="d-flex flex-1 d-md-none">
			<div class="navbar-brand mr-auto">
				<a href="index.html" class="d-inline-block">
					<img src="global_assets\images\logo_dark.png" alt="">
				</a>
			</div>	

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-mobile">
				<i class="icon-tree5"></i>
			</button>

			<button class="navbar-toggler sidebar-mobile-main-toggle" type="button">
				<i class="icon-paragraph-justify3"></i>
			</button>
		</div>
		<!-- /mobile controls -->


		<!-- Navbar content -->
		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="navbar-nav mr-md-auto">
				<li class="nav-item">
					<a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
						<i class="icon-paragraph-justify3"></i>
					</a>
				</li>
			</ul>

			<!-- <span class="badge bg-pink-400 badge-pill ml-md-3 mr-md-auto">16 orders</span> -->

			<ul class="navbar-nav">
				<li class="nav-item dropdown dropdown-user">
					<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
						<img src="global_assets\images\user.png" class="rounded-circle mr-2" height="34" alt="">
						<span><% out.println(session.getAttribute("name")); %></span>
					</a>

					<div class="dropdown-menu dropdown-menu-right">
						<a href="logout" class="dropdown-item"><i class="icon-switch2"></i> Logout</a>
					</div>
				</li>
			</ul>
		</div>
		<!-- /navbar content -->
		
	</div>
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
						<h4>Add Book</h4>
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
                                        <h3>Add A New Book</h3>
                                    </div>
                                    <div class="card-body py-0 mb-4">
                                        
                                        <div class="container">
                                        
                                            <form class="needs-validation" action="addBook" method="post" enctype="multipart/form-data" novalidate>
                                            
                                               <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        <div class="mb-3">
                                                            <input type="text" placeholder="Book Name" class="form-control" name="bookName" required>
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
                                                            <input type="text" class="form-control" placeholder="Book Details" name="bookDetils" required>
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
                                                            <input type="text" placeholder="Book Author" class="form-control" name="bookAuthor" required>
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
                                                            <input type="text" class="form-control" placeholder="Book Publish" name="bookPub" required>
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
                                                            <input type="text" placeholder="Branch" class="form-control" name="branch" required>
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
                                                            <input type="text" class="form-control" placeholder="Book Price" name="bookPrice" required>
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
                                                  
                                                        <div class="mb-3">
                                                            <input type="text" placeholder="Book Quantity" class="form-control" name="bookQuantity" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book quantity.
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <input type="text" placeholder="Book Rent" class="form-control" name="bookRent" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book rent.
                                                            </div>
                                                        </div>
                                                        <input type="hidden" placeholder="Book Available" name="bookAva" value="1" required>
                                                    
                                                    </div>
                                                    
                                                </div>
                                                
                                                <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        
                                                        <div class="mb-3">
                                                            <label>Upload Picture for book</label>
                                                            <input type="file" class="form-control" name="bookPic">
<!--                                                        <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid image.
                                                            </div>-->
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        
                                                    </div>
                                                    
                                                </div>
                                                
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
                        title: 'Congrats!',
                        text: 'Add user successfully'
                      });
                }
                else if(status == "failed"){
                    Swal.fire({
                        icon: 'warning',
                        title: 'Something went wrong'
                    });
                }
            
	</script>
</body>
</html>