<%@page import="java.sql.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                                <h4>Return Details</h4>
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
                                        <h3>Return Details</h3>
                                    </div>
                                    <div class="card-body py-0 mb-4">
                                        
                                        <div class="container">
                                        
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>S. No.</th>
                                                        <th>Book Id</th>
                                                        <th>Holder Name</th>
                                                        <th>Fine</th>
                                                        <th></th>                                    
                                                </thead>
                                                <tbody>
                                                    <%
                                                        String id = request.getParameter("bookId");
                                                        try{ 
                                                            
                                                            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                                            statement=connection.createStatement();
                                                            String sql ="SELECT * FROM issuebook where issuebook='"+id+"' ";
                                                            resultSet = statement.executeQuery(sql);
                                                            int i=1;
                                                            while(resultSet.next()){
                                                                
                                                    %>
                                                    <tr>
                                                        <td><%= i++ %></td>
                                                        <td><%=resultSet.getString("issuebook") %></td>
                                                        <td><%=resultSet.getString("issuename") %></td>
                                                        <td>
                                                            <%
                                                                LocalDate todayD = java.time.LocalDate.now();
                                                                
                                                                Date todayDate  = java.sql.Date.valueOf(todayD);
                                                                
                                                                String returnD = resultSet.getString("returnDate");
                                                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                                                java.util.Date returnDa = sdf.parse(returnD);
                                                                java.sql.Date returnDate = new java.sql.Date(returnDa.getTime());
                                                                
                                                                long getDiff = todayDate.getTime() - returnDate.getTime();

                                                                // using TimeUnit class from java.util.concurrent package
                                                                long getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
                                                                
                                                                if(getDaysDiff > 0){
                                                                    
                                                                    long fine = 10 * getDaysDiff;
                                                                    out.print(fine + " Rs");
                                                                }
                                                                else{
                                                                    out.print(0 + " Rs");
                                                                }
                                                            %>
                                                        </td>
                                                        
                                                        
                                                        
                                                        <td>
                                                            <form action="returnBook" method="post">
                                                                <input type="hidden" name="bookId" value="<%=id %>">
                                                                <button type="submit" class="btn btn-danger">Return Book</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                    <% 
                                                        }

                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    %>
                                                </tbody>
                                                
                                            </table>                                                 
                                            
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
        </script>
</body>
</html>