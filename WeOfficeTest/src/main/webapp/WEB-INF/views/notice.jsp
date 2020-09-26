<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>We Office - Main</title>

<!-- Custom fonts for this template-->
<link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
<link href="resource/css/style.css" rel="stylesheet">

<!-- 제이쿼리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var date = new Date().getDate();
		var month = new Date().getMonth() + 1;
		var Month;
		if (month == 1) {
			Month = "JAN"
		} else if (month == 2) {
			Month = "FEB";
		} else if (month == 3) {
			Month = "MAR";
		} else if (month == 4) {
			Month = "APR";
		} else if (month == 5) {
			Month = "MAY";
		} else if (month == 6) {
			Month = "JUN";
		} else if (month == 7) {
			Month = "JUL";
		} else if (month == 8) {
			Month = "AUG";
		} else if (month == 9) {
			Month = "SEP";
		} else if (month == 10) {
			Month = "OCT";
		} else if (month == 11) {
			Month = "NOV";
		} else if (month == 12) {
			Month = "DEC";
		}

		document.getElementById('noticeDate').innerHTML = date;
		document.getElementById('noticeMonth').innerHTML = Month;
		
		
		$( '.tw-homepage-collapsible-section__header' ).click( function() {
	          $(this).parent('.tw-homepage-collapsible-section').toggleClass( '--expanded' );
	        } );

	})
</script>

<!-- $(function() { -->
<!--     //... -->
<!--  }); -->

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<%@ include file="./menu_side.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="./top_nav.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="tw-homepage-header">
						<div class="tw-homepage-header-title ax-homepage-header-title">
							<div class="tw-homepage-header-title__icon --all">
								<div>
									<div class="tw-homepage-header-title__month" id="noticeMonth"></div>
									<div class="tw-homepage-header-title__day" id="noticeDate"></div>
								</div>
							</div>
							<div class="tw-homepage-header-title__text">
								<span data-l10n-key="homepage.header.none" data-l10n-message="업데이트 사항을 모두 확인하셨습니다 :-)">업데이트 사항을 모두 확인하셨습니다 :-)</span>
							</div>
							<div class="tw-homepage-header__filters">
								<div class="tw-click-area tw-homepage-header__filter ax-homepage-header__filter --active" role="button" tabindex="0" data-filter="all">
									<span data-l10n-key="homepage.menu.all" data-l10n-message="새 알림">새 알림</span>
								</div>
								<span class="tw-homepage-header__filters-divider"></span>
								<div class="tw-click-area tw-homepage-header__filter ax-homepage-header__filter" role="button" tabindex="0" data-filter="cleared">
									<span data-l10n-key="homepage.menu.cleared" data-l10n-message="지움">지움</span>
								</div>
							</div>
						</div>
					</div>
					<div class="tw-homepage-stack">
						<div class="tw-homepage-stack__content">
							<div class="tw-homepage-stack__noti-section ax-homepage-stack__noti-section" data-category="today">
								<div class="tw-homepage-stack__noti-section-row-header">
									<span class="tw-homepage-stack__noti-section-date"><span data-l10n-key="homepage.section.title.today" data-l10n-message="오늘">오늘</span></span>
								</div>
								<div class="tw-homepage-noti-rows"></div>
							</div>
							<div class="tw-homepage-stack__collapsible">
								<div class="tw-homepage-collapsible-section --overdue">
									<div class="tw-click-area tw-homepage-collapsible-section__header" role="button" tabindex="0">
										<div class="tw-homepage-collapsible-section__badge">2</div>
										<div class="tw-homepage-collapsible-section__name">마감일 지남</div>
										<div class="tw-homepage-collapsible-section__right-section"></div>
									</div>
									<div class="tw-homepage-collapsible-section__content">
										<div class="tw-homepage-task-rows">
											<div class="tw-homepage-task-rows__row">
												<div class="tw-click-area tw-homepage-task-row" role="button" tabindex="0">
													<div class="tw-homepage-task-row__dot">
														<div class="tw-homepage-task-row__list-style --overdue"></div>
													</div>
													<div class="tw-homepage-task-row__task">
														<div class="tw-homepage-task-row__task-title">3</div>
														<div class="tw-homepage-task-row__task-location">
															<div class="tw-homepage-task-row__overdue-period">
																<i class="tw-icon tw-icon-calendar --name_calendar tw-homepage-task-row__overdue-calendar"><i class="far fa-calendar-alt"></i></span></i><span class="tw-homepage-task-row__overdue-for"><span data-l10n-key="homepage.row.overdue_by" data-l10n-message="마감일 %{time} 지남">마감일 <span data-l10n-key="relative_time.days" data-l10n-message="%{days}일">5일</span> 지남
																</span></span>
															</div>
															<div class="tw-homepage-task-row__location">
																<i class="tw-icon tw-icon-project --name_project tw-homepage-task-row__project-icon --overdue"><i class="far fa-folder"></i></span></i><span class="tw-homepage-task-row__project-title"><span>파이널 프로젝트</span></span><i class="tw-icon tw-icon-arrow-right --name_arrow-right"><i class="fas fa-chevron-right"></i></span></i><span class="tw-homepage-task-row__tasklist-title"><span>예인 한</span></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tw-homepage-task-rows__row">
												<div class="tw-click-area tw-homepage-task-row" role="button" tabindex="0">
													<div class="tw-homepage-task-row__dot">
														<div class="tw-homepage-task-row__list-style --overdue"></div>
													</div>
													<div class="tw-homepage-task-row__task">
														<div class="tw-homepage-task-row__task-title">1. html</div>
														<div class="tw-homepage-task-row__task-location">
															<div class="tw-homepage-task-row__overdue-period">
																<i class="tw-icon tw-icon-calendar --name_calendar tw-homepage-task-row__overdue-calendar"><i class="far fa-calendar-alt"></i></span></i><span class="tw-homepage-task-row__overdue-for"><span data-l10n-key="homepage.row.overdue_by" data-l10n-message="마감일 %{time} 지남">마감일 <span data-l10n-key="relative_time.a_day" data-l10n-message="1일">1일</span> 지남
																</span></span>
															</div>
															<div class="tw-homepage-task-row__location">
																<i class="tw-icon tw-icon-project --name_project tw-homepage-task-row__project-icon --overdue"><i class="far fa-folder"></i></span></i><span class="tw-homepage-task-row__project-title"><span>파이널 프로젝트</span></span><i class="tw-icon tw-icon-arrow-right --name_arrow-right"><i class="fas fa-chevron-right"></i></i></i><span class="tw-homepage-task-row__tasklist-title"><span>예인 한</span></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tw-homepage-collapsible-section__divider"></div>
									</div>
								</div>
							</div>
							<div class="tw-homepage-stack__collapsible">
								<div class="tw-homepage-stack__divider"></div>
								<div class="tw-homepage-collapsible-section --due-today">
									<div class="tw-click-area tw-homepage-collapsible-section__header" role="button" tabindex="0">
										<div class="tw-homepage-collapsible-section__badge">1</div>
										<div class="tw-homepage-collapsible-section__name">오늘까지</div>
										<div class="tw-homepage-collapsible-section__right-section"></div>
									</div>
									<div class="tw-homepage-collapsible-section__content">
										<div class="tw-homepage-task-rows">
											<div class="tw-homepage-task-rows__row">
												<div class="tw-click-area tw-homepage-task-row" role="button" tabindex="0">
													<div class="tw-homepage-task-row__dot">
														<div class="tw-homepage-task-row__list-style --due-today"></div>
													</div>
													<div class="tw-homepage-task-row__task">
														<div class="tw-homepage-task-row__task-title">희망 사다리1</div>
														<div class="tw-homepage-task-row__task-location">
															<div class="tw-homepage-task-row__location">
																<i class="tw-icon tw-icon-project --name_project tw-homepage-task-row__project-icon --due-today"></i><span class="tw-homepage-task-row__project-title"><span>파이널 프로젝트</span></span><i class="tw-icon tw-icon-arrow-right --name_arrow-right"><i class="fas fa-chevron-right"></i></span></i><span class="tw-homepage-task-row__tasklist-title"><span>업무2</span></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tw-homepage-collapsible-section__divider"></div>
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
			<%@ include file="footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


	<!-- Scroll to Top Button-->
	<!-- Logout Modal-->
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
