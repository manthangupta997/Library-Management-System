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

                                            <div>
                                                                    No. of Books
                                                            </div>
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
                                                                String sql ="SELECT count(id) as totalStu FROM users";
                                                                resultSet = statement.executeQuery(sql);
                                                                while(resultSet.next()){
                                                        %>
                                                        <%=resultSet.getString("totalStu") %>
                                                    </h3>
                                                        <% 
                                                            }

                                                            } catch (Exception e) {
                                                            e.printStackTrace();
                                                            }
                                                        %>
                                                </div>

                                                <div>
                                                    No. of Registration
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
                                                    <h3 class="font-weight-semibold mb-0">
                                                        <%
                                                            try{ 
                                                                connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                                                                statement=connection.createStatement();
                                                                String sql ="SELECT count(id) as issueBook FROM issuebook";
                                                                resultSet = statement.executeQuery(sql);
                                                                while(resultSet.next()){
                                                        %>
                                                        <%=resultSet.getString("issueBook") %>
                                                    </h3>
                                                    <% 
                                                        }

                                                        } catch (Exception e) {
                                                        e.printStackTrace();
                                                        }
                                                    %>
                                                </div>

                                                <div>
                                                    Issued Books
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


			<!-- Footer -->
                        <%@include file="footerAdmin.jsp" %>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->

</body>
</html>