<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@include file="connectionStudent.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Student Dashboard</title>

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
                                            <h4>Dashboard</h4>
                                            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
                                    </div>
                            </div>
                    </div>
                    <!-- /page header -->


			<!-- Content area -->
			<div class="content pt-0">

				<!-- Dashboard content -->
				<div class="row">
					<div class="col-xl-12">

						<!-- Quick stats boxes -->
						<div class="row">
							<div class="col-lg-4">

								<!-- Members online -->
								<div class="card bg-teal-400">
									<div class="card-body">
										<div class="d-flex">
											<h3 class="font-weight-semibold mb-0">
                                                                                            <%
                                                                                                try{ 
                                                                                                    connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                                                                                    statement=connection.createStatement();
                                                                                                    String sql ="SELECT count(id) as total FROM book";
                                                                                                    resultSet = statement.executeQuery(sql);
                                                                                                    while(resultSet.next()){
                                                                                            %>
                                                                                            <%=resultSet.getString("total") %>
                                                                                        </h3>
                                                                                        
                                                                                        
                                                                                        <% 
                                                                                            }

                                                                                            } catch (Exception e) {
                                                                                            e.printStackTrace();
                                                                                            }
                                                                                        %>
                                                                                </div>
					                	
                                                                                <a href="totalBooks.jsp" style="color:white;"><div>
                                                                                    No. of Subjects
                                                                                </div></a>
                                                                        </div>

                                                                        <div class="container-fluid">
                                                                                <div id="members-online"></div>
                                                                        </div>
                                                                </div>
								<!-- /members online -->

                                                            </div>

                                                            <div class="col-lg-4">

								<!-- Current server load -->
								<div class="card bg-pink-400">
									<div class="card-body">
										<div class="d-flex">
                                                                                    <h3 class="font-weight-semibold mb-0">
                                                                                        <%
                                                                                            try{ 
                                                                                                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                                                                                statement=connection.createStatement();
                                                                                                String sql ="SELECT * FROM issuebook where Userid='"+id+"'";
                                                                                                resultSet = statement.executeQuery(sql);
                                                                                                long totalfine = 0;
                                                                                                while(resultSet.next()){
                                                                                        %>
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
                                                                                            
                                                                                            long fine = 10 * getDaysDiff;
                                                                                            
                                                                                            totalfine = totalfine + fine;
                                                                                        }
                                                                                            out.print(totalfine + " Rs");
                                                                                        %>
                                                                                    </h3>
                                                                                    <% 
                                                                                        
                                                                                        String sqll = "SELECT count(id) as totalId FROM issuebook where Userid='"+id+"'";
                                                                                        resultSet = statement.executeQuery(sqll);
                                                                                        while(resultSet.next()){                                                                                        
                                                                                    %>
					                	</div>
					                	
					                	<div>
											Total fine
										</div>
									</div>

									<div id="server-load"></div>
								</div>
								<!-- /current server load -->

                                                            </div>

                                                            <div class="col-lg-4">

								<!-- Today's revenue -->
								<div class="card bg-blue-400">
									<div class="card-body">
										<div class="d-flex">
											<h3 class="font-weight-semibold mb-0"><%=resultSet.getString("totalId") %></h3>
                                                                                        <%
                                                                                            }
                                                                                        } catch (Exception e) {
                                                                                        e.printStackTrace();
                                                                                        }
                                                                                        %>
					                	</div>
					                	
					                	<div>
                                                                    <a href="issuedBooks.jsp" style="color:white;">Issued Books</a>
										</div>
									</div>

									<div id="today-revenue"></div>
								</div>
								<!-- /today's revenue -->

                                                            </div>
						</div>
						<!-- /quick stats boxes -->

					</div>

					
				</div>
				<!-- /dashboard content -->

			</div>
			<!-- /content area -->
                        
                        
                        
                        
                        <!-- Content area -->
			<div class="content pt-0">

				<!-- Dashboard content -->
				<div class="card">
                                    
                                    <div class="card-header header-element-inline">
                                        <h3>Old Books</h3>
                                    </div>
                                    <div class="card-body py-0 mb-4">
                                        
                                        <div class="container">
                                        
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Book name</th>
                                                        <th>Author</th>
                                                        <th>Publisher</th>
                                                        <th>Branch</th>
                                                        <th>Available</th>
                                                        
                                                    </tr>                                                    
                                                </thead>
                                                <tbody>
                                                    <%
                                                        try{ 
                                                            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                                            statement=connection.createStatement();
                                                            String sql ="SELECT * FROM oldbooks";
                                                            resultSet = statement.executeQuery(sql);
                                                            int i=1;
                                                            while(resultSet.next()){
                                                                
                                                    %>
                                                    <tr>
                                                        <td><%= i++ %></td>
                                                        <td><%=resultSet.getString("bookName") %></td>
                                                        <td><%=resultSet.getString("bookAuthor") %></td>
                                                        <td><%=resultSet.getString("bookPub") %></td>
                                                        <td><%=resultSet.getString("branch") %></td>
                                                        <td><%=resultSet.getString("bookAva")%></td>
                                                        
                                                        
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
                        <%@include file="footerStudent.jsp" %>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->

</body>
</html>