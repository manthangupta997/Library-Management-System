<%@include file="connectionStudent.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>User Dashboard</title>

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
        <%@include file="headerStudent.jsp" %>
	<!-- /main navbar -->

					
	<!-- Page content -->
	<div class="page-content">
            
            <%@include file="stuSideBar.jsp" %>
            
		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Page header -->
			<div class="page-header">
				<div class="page-header-content header-elements-md-inline">
					<div class="page-title d-flex">
						<h4>Request A Book</h4>
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
                                        <h3>Request A Book</h3>
                                    </div>
                                    <div class="card-body py-0 mb-4">
                                        
                                        <div class="container">
                                        
                                            <form class="needs-validation" action="requestBook" method="post" novalidate>
                                            
                                               <div class="row">
                                                    
                                                    <div class="col-md-6">
                                                  
                                                        <div class="mb-3">
                                                            <select class="form-control" name="bookId">
                                                                <option selected>Choose book</option>
                                                                <%
                                                                    try{ 
                                                                        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                                                        statement=connection.createStatement();
                                                                        String sql ="SELECT * FROM book";
                                                                        resultSet = statement.executeQuery(sql);
                                                                        while(resultSet.next()){
                                                                            String ava = resultSet.getString("bookAva");
                                                                            int avab = Integer.parseInt(ava);

                                                                            if(avab > 0){
                                                                %>
                                                                <option value="<%=resultSet.getString("id") %>"><%=resultSet.getString("bookName") %></option>
                                                                <% 
                                                                            }
                                                                        }

                                                                        } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                        }
                                                                    %>
                                                            </select>
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
<!--                                                        <label>Choose Student</label>
                                                            <input type="text" class="form-control" placeholder="Book Details" name="bookDetils" required>-->
                                                            <input type="hidden" name="studentId" value=<%= id %>>
                                                            
                                                            <input type="text" class="form-control" placeholder="Days" name="day" required>
                                                            <div class="valid-feedback">
                                                                Looks good!
                                                            </div>
                                                            <div id="validationServer01Feedback" class="invalid-feedback">
                                                                Please provide a valid book author.
                                                            </div>
                                                            
                                                            
                                                        </div>
                                                    
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
                        text: 'Send book request '
                      });
                }
                else if(status == "failed"){
                    Swal.fire({
                        icon: 'warning',
                        title: 'Something went wrong'
                    });
                }
                else if(status == "error"){
                    Swal.fire({
                        icon: 'warning',
                        title: 'Book is not available'
                    });
                }
            
	</script>
</body>
</html>