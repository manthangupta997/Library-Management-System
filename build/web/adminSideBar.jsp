<!-- Main sidebar -->
		<div class="sidebar sidebar-dark sidebar-main sidebar-expand-md">

			<!-- Sidebar mobile toggler -->
			<div class="sidebar-mobile-toggler text-center">
				<a href="#" class="sidebar-mobile-main-toggle">
					<i class="icon-arrow-left8"></i>
				</a>
				Navigation
				<a href="#" class="sidebar-mobile-expand">
					<i class="icon-screen-full"></i>
					<i class="icon-screen-normal"></i>
				</a>
			</div>
			<!-- /sidebar mobile toggler -->


			<!-- Sidebar content -->
			<div class="sidebar-content">
				
				<!-- User menu -->
				<div class="sidebar-user-material">
					<div class="sidebar-user-material-body">
						<div class="card-body text-center">
							<a href="#">
								<img src="global_assets\images\user.png" class="img-fluid rounded-circle shadow-1 mb-3" width="80" height="80" alt="">
							</a>
							<h6 class="mb-0 text-white text-shadow-dark"><% out.println(session.getAttribute("name")); %></h6>
						</div>
													
						<div class="sidebar-user-material-footer">
							<a href="#user-nav" class="d-flex justify-content-between align-items-center text-shadow-dark dropdown-toggle" data-toggle="collapse"><span>My account</span></a>
						</div>
					</div>

					<div class="collapse" id="user-nav">
						<ul class="nav nav-sidebar">
							<li class="nav-item">
								<a href="logout" class="nav-link">
									<i class="icon-switch2"></i>
									<span>Logout</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- /user menu -->
	
				
				<!-- Main navigation -->
				<div class="card card-sidebar-mobile">
					<ul class="nav nav-sidebar" data-nav-type="accordion">

						<!-- Main -->
						<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Main</div> <i class="icon-menu" title="Main"></i></li>
						<li class="nav-item">
							<a href="adminDashboard.jsp" class="nav-link active">
								<i class="icon-home4"></i>
								<span> Dashboard </span>
							</a>
						</li>

						<!-- Layout -->
						<!--<li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Books</div> <i class="icon-menu" title="Layout options"></i></li>-->
						<li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-stack2"></i> <span>Books</span></a>

							<ul class="nav nav-group-sub" data-submenu-title="Page layouts">
								<li class="nav-item"><a href="addBook.jsp" class="nav-link">Add Book</a></li>
                                                                <li class="nav-item"><a href="bookReport.jsp" class="nav-link">Book Report</a></li>
                                                                <li class="nav-item"><a href="issueBook.jsp" class="nav-link">Issue a book</a></li>
								<li class="nav-item"><a href="issueReport.jsp" class="nav-link">Issue report</a></li>
                                                                <li class="nav-item"><a href="returnBook.jsp" class="nav-link">Return a book</a></li>
                                                                <li class="nav-item"><a href="approveRequest.jsp" class="nav-link">Approve Request</a></li>
                                                                <li class="nav-item"><a href="oldBook.jsp" class="nav-link">Old Books</a></li>
                                                        </ul>
						</li>
                                                
                                                <li class="nav-item nav-item-submenu">
							<a href="#" class="nav-link"><i class="icon-user"></i> <span>User</span></a>

							<ul class="nav nav-group-sub" data-submenu-title="Page layouts">
								<li class="nav-item"><a href="addUser.jsp" class="nav-link">Add User</a></li>
								<li class="nav-item"><a href="userReport.jsp" class="nav-link">User Record</a></li>
                                                        </ul>
						</li>
                                                
                                                
						<!-- /layout -->
							
					</ul>
				</div>
				<!-- /main navigation -->

			</div>
			<!-- /sidebar content -->
			
		</div>
		<!-- /main sidebar -->