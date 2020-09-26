<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>We Office - MyPage</title>


<!-- Custom fonts for this template-->
<link href="./resources/resource/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./resources/resource/css/sb-admin-2.min.css" rel="stylesheet">
<link href="./resources/resource/css/style.css" rel="stylesheet">

<script type="text/javascript">
	
</script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="./menu_side.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler Â· 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun Â· 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog Â· 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie
									Luna</span> <img class="img-profile rounded-circle"
								src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">My Page</h1>

					</div>

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-8 col-lg-7" style="min-width: 41%">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->


								<!-- 회원정보  -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">회원정보</h6>
									<div class="dropdown no-arrow"></div>
								</div>


								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<form class="user" method="post" action="">
											<div class="form-group">
												<label class="tw-account-settings-pane-label"><span
													data-l10n-key="user_settings.profile_pane.profile.first_name"
													data-l10n-message="이름">이름</span></label>
												<input type="text" class="form-control form-control-user" id="Name" placeholder="Name">
												<p class="tw-profile-setting__input-helper">
													<span data-l10n-key="user_settings.profile_pane.profile.first_last_name_help"
														data-l10n-message="팀원들이 본인을 알아볼 수 있도록 도와주세요.">팀원들이
														본인을 알아볼 수 있도록 도와주세요.</span>
												</p>
											</div>
											<div class="form-group">
												<label class="tw-account-settings-pane-label"><span
													data-l10n-key="user_settings.profile_pane.profile.first_name"
													data-l10n-message="부서">부서</span></label>
												<input type="text" class="form-control form-control-user" id="Department" placeholder="Department">
												<p class="tw-profile-setting__input-helper">
													<span data-l10n-key="user_settings.profile_pane.profile.department_help"
														data-l10n-message="부서명으로 본인을 찾을 수 있도록 도와주세요. 예) 디자인팀">부서명으로
														본인을 찾을 수 있도록 도와주세요. 예) 디자인팀</span>
												</p>
											</div>
											<div class="form-group">
												<label class="tw-account-settings-pane-label"><span
													data-l10n-key="user_settings.profile_pane.profile.first_name"
													data-l10n-message="팀">팀</span></label>
												<input type="text" class="form-control form-control-user" id="JabTitle" placeholder="JopTitle">
												<p class="tw-profile-setting__input-helper">
													<span data-l10n-key="user_settings.profile_pane.profile.job_title_help"
														data-l10n-message="자신이 무엇을 하는지 팀원들에게 알려주세요. 예) 웹디자이너">자신이
														무엇을 하는지 팀원들에게 알려주세요. 예) 웹디자이너</span>
												</p>
											</div>
											<div class="form-group">
												<label class="tw-account-settings-pane-label"><span
													data-l10n-key="user_settings.profile_pane.profile.first_name"
													data-l10n-message="전화번호">전화번호</span></label>
												<input type="text" class="form-control form-control-user" id="Phone" placeholder="Phone">
												<p class="tw-profile-setting__input-helper">
													<span data-l10n-key="user_settings.profile_pane.profile.phone_help"
														data-l10n-message="팀원들이 본인에게 연락할 수 있도록 도와주세요">팀원들이
														본인에게 연락할 수 있도록 도와주세요</span>
												</p>											
											</div>
											<div class="form-group">
												<label class="tw-account-settings-pane-label"><span
													data-l10n-key="user_settings.profile_pane.profile.first_name"
													data-l10n-message="이메일">이메일</span></label>
												<input type="email" class="form-control form-control-user"
													id="exampleInputEmail" placeholder="Email Address">
											</div>
											
											<div class="form-group">
												<label class="tw-account-settings-pane-label"><span
													data-l10n-key="user_settings.profile_pane.profile.first_name"
													data-l10n-message="주소">주소</span></label>
												<input type="text" class="form-control form-control-user" id="Address" placeholder="Address">
												<p class="tw-profile-setting__input-helper">
													<span
														data-l10n-key="user_settings.profile_pane.profile.address_help"
														data-l10n-message="팀원들이 본인을 지도에서 찾을 수 있도록 도와주세요!">팀원들이
														본인을 지도에서 찾을 수 있도록 도와주세요!</span>
												</p>											
											</div>
											
											<button href="#"
												class="mypage-btn btn btn-danger btn-icon-split"
												style="float: right;">
												<span class="text mypage-btn">회원 탈퇴하기 </span>
											</button>
											<button type="submit" href="#"
												class="btn btn-primary btn-icon-split"
												style="float: right; margin-right: 10px;">
												<span class="text mypage-btn">회원정보 변경 </span>
											</button>
										</form>

									</div>
								</div>
							</div>
						</div>


						<!-- 버튼-->
						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-5" style="max-width: 55%">
							<div class="card shadow mb-4">
							
							<!-- Cart Header -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">비밀번호 변경</h6>
									<div class="dropdown no-arrow"></div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area pt-4 pb-2">
										<form method="post" action="" class="user">
											<div class="form-group">
												<div class="col-sm-6 mb-3 mb-sm-0"
													style="max-width: 100%;">
													<input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
												</div>
												<div class="my-2"></div>
												<div class="col-sm-6" style="max-width: 100%;">
													<input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
												</div>
											</div>
											<div class="my-2"></div>
											<input type="submit" class="btn btn-success btn-icon-split"
												value="비밀번호 변경"
												style="width: 112px; height: 38px; font-size: 13px; float: right;">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- 예약조회 -->

						<div class="col-lg-8 mb-7">

							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">예약조회</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>예약자명</th>
													<th>회의 제목</th>
													<th>프로젝트</th>
													<th>인원수</th>
													<th>예약일</th>
													<th>예약금액</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Tiger Nixon</td>
													<td>System Architect</td>
													<td>Edinburgh</td>
													<td>61</td>
													<td>2011/04/25</td>
													<td>$320,800</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


			<!-- Footer -->
				<%@ include file="./footer.jsp" %>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->
	</div>
	
	<%@ include file="./logout.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="resource/vendor/jquery/jquery.min.js"></script>
	<script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resource/js/sb-admin-2.min.js"></script>
</body>

</html>
