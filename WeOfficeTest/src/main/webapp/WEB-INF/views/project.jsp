<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title> 귀영 css-1 </title>

  <!-- Custom fonts for this template-->
  <link href="./resources/resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="./resources/resource/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- 제이쿼리 -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
</head>

<style type="text/css">
.contentTopArea {
	/* 	width: 300px;
	height: 60px;
	border: 1px solid gray;
	margin-left: 15px;
	padding: 15px; */
	align-items: center;
	float: left;
	width: 43%;
	height: 40px;
	background-color: #f8f9fc;
	margin-top: -1.4rem;
}

.contentTopArea ul {
	list-style-type: none;
}

.contentTopArea ul li a {
	text-decoration: none;
	color: black;
}

.contentTopArea ul li a:hover {
	color: #4e73df;
}

.container-fluid {
	/* 	background-color:#dddfeb; */
	background-color: #f8f9fc;
	border-top: 1px solid #dddfeb;
	height: 1000px;
}

.card-body-container {
	display: inline-flex;
	flex-flow: row wrap;
}

.border-bottom-primary {
	border-top: 2.5rem solid #4e73df !important;
	width: 280px;
	height: 140px;
	margin-top: 5px;
	margin-left: 15px;
	margin-right: 20px;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-content: space-around;
}

.card-body-2 {
	flex: 1 1 auto;
	min-height: 1px;
	padding-left: 1.25rem;
	padding-right: 1rem;
	padding-top: 0;
	padding-bottom: 1.25rem;
}

.modal-header {
	vertical-align: middle;
}

/* 모달 - input태그 선택시 css */
#pjtName:focus, #pjtInfo:focus, #updatepjtName:focus, #updatepjtInfo:focus,
#pjtStartDate:focus, #pjtEndDate:focus, #updatepjtStartDate:focus, #updatepjtEndDate:focus {
	outline: 1.5px solid #4e73df;
}

/* 모달 - close 버튼 테두리제거 */
.modal-header .close {
	border: 0;
	outline: 0;
}

/* 모달 - 라디오버튼 div */
.radioBtn {
	border-radius: 5px 5px 5px 5px;
	width: 300px;
	height: 60px;
	border: 1px solid gray;
	margin-left: 15px;
	padding: 15px;
	display: flex;
	align-items: center;
	float: left;
	width: 43%;
	font-size: 13px;
}

.radioBtn:nth-child(odd) {
	margin-left: 25px;
}

.radioBtn input {
	display: flex;
	align-items: center;
}

#testVal, #updatetestVal {
	visibility: hidden;
	position: absolute;
	height: 75px;
	overflow-y: scroll;
	border: 1px solid gray;
	background: white;
}

#selMember, #updateselMember {
	border: 1px solid gray;
	align-items: center;
	float: left;
	width: 43%;
}
</style>

<script type="text/javascript">
$(function() {
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
	
	// submit시 프로젝트 생성
    $("#modalSubmit").submit(function(){
		// 프로젝트 기간 제한설정
        var startDate = $('#pjtStartDate').val();
        var endDate = $('#pjtEndDate').val();
        //-을 구분자로 연,월,일로 잘라내어 배열로 반환
        var startArray = startDate.split('-');
        var endArray = endDate.split('-');   
        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);
        //날짜를 숫자형태의 날짜 정보로 변환하여 비교
        if(start_date.getTime() >= end_date.getTime()) {
            alert("종료일은 시작일 이후 날짜여야 합니다.");
            $("#pjtEndDate").focus();
            return false;
        }
        
        var pjtName = $("#pjtName").val();
    	var pjtInfo = $("#pjtInfo").val();
    	var p_pub = $("input[name=p_pub]:checked").attr("value");
		var user_num = "";
        $("input:checkbox[name='user_num']:checked").each(function(index) {
            if(index != 0) {
            	user_num += ',';
            }
            user_num += $(this).val();		// 1,2,3 형태로 삽입
        });
    	var pjtStartDate = $("#pjtStartDate").val();
    	var pjtEndDate = $("#pjtEndDate").val();
    	
    	var pjtVal = {
    		"p_title":pjtName, 
    		"p_info":pjtInfo, 
    		"p_pub":p_pub, 
    		"user_num":user_num, 
    		"p_startdate":pjtStartDate, 
    		"p_enddate":pjtEndDate
    	};

    	$.ajax({
			type: "post",
			url: "insert.do",
			data: JSON.stringify(pjtVal),
			contentType: "application/json",
			dataType: "json", 
			success: function(msg) {
				if(msg.check == true) {
					location.href = "project.do";
					// 처음 실행했을땐 새로고침 해야만 뜸 /////////////////////////////////////////
				}
			},
			error: function() {
				alert("실패");
			}
		});
    });
    
});


function pjtUpdate(pid) {
/* 프로젝트 수정 세팅 : 톱니바퀴(id='config') 클릭시 모달에 입력했던 정보 불러오기 */
	$("#updatetestVal").css("visibility", "visible");
	$("#updateselMember").css("border","2px solid #4e73df");
	
	var pjtId = {"p_id":pid};
	
	$.ajax({
		type: "post",
		url: "selectOne.do",
		data: JSON.stringify(pjtId),
		contentType: "application/json",
		dataType: "json", 
		success: function(msg) {
			$.each(msg, function(key, val) {
				$("#updatdpjtId").val(val.p_id);			//아이디(hidden)
				
				$("#updatepjtName").val(val.p_title);		//제목
				$("#updatepjtInfo").val(val.p_info);		//설명
				
				if(val.p_pub == "pub") {					//공개범위
					$("#updatepri").removeAttr("checked");
					$("#updatepub").attr("checked", true);
					
					$(".radioBtn:eq(2)").css({"border":"1.5px solid", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
					$(".radioBtn:eq(3)").removeAttr("style");
				} else if(val.p_pub == "pri") {
					$("#updatepub").removeAttr("checked");
					$("#updatepri").attr("checked", true);
					
					$(".radioBtn:eq(3)").css({"border":"1.5px solid", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
					$(".radioBtn:eq(2)").removeAttr("style");
				}
				
				// 회원번호 어케받을지 /////////////////////////////////
				// 이름 클릭시 체크박스 클릭 안됨 /////////////////////////////////
				// 체크값 기본 세팅 //////////////////////////////////////////
// 				$("#updatepjtInfo").val(val.user_num);	
// 				var num = val.user_num;
// 				alert(num);
				//var user_num = num.split(",");
				
				$("#updatepjtStartDate").val(val.p_startdate);	//시작일
				$("#updatepjtEndDate").val(val.p_enddate);		//종료일
			});

		},
		error: function() {
			alert("실패");
		}
	});
}

$(function(){
 	// submit시 프로젝트 수정
    $("#modalUpdate").submit(function(){
		// 프로젝트 기간 제한설정
        var startDate = $('#updatepjtStartDate').val();
        var endDate = $('#updatepjtEndDate').val();
        //-을 구분자로 연,월,일로 잘라내어 배열로 반환
        var startArray = startDate.split('-');
        var endArray = endDate.split('-');   
        //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);
        //날짜를 숫자형태의 날짜 정보로 변환하여 비교
        if(start_date.getTime() >= end_date.getTime()) {
            alert("종료일은 시작일 이후 날짜여야 합니다.");
            $("#updatepjtEndDate").focus();
            return false;
        }
        
        var pjtId = $("#updatdpjtId").val();
        var pjtName = $("#updatepjtName").val();
    	var pjtInfo = $("#updatepjtInfo").val();
    	var p_pub = $("input[name=p_pub]:checked").attr("value");
		var user_num = "";
        $("input:checkbox[name='user_num']:checked").each(function(index) {
            if(index != 0) {
            	user_num += ',';
            }
            user_num += $(this).val();		// 1,2,3 형태로 삽입
        });
    	var pjtStartDate = $("#updatepjtStartDate").val();
    	var pjtEndDate = $("#updatepjtEndDate").val();
    	
    	var pjtVal = {
    		"p_id":pjtId,
    		"p_title":pjtName, 
    		"p_info":pjtInfo, 
    		"p_pub":p_pub, 
    		"user_num":user_num, 
    		"p_startdate":pjtStartDate, 
    		"p_enddate":pjtEndDate
    	};

    	$.ajax({
			type: "post",
			url: "update.do",
			data: JSON.stringify(pjtVal),
			contentType: "application/json",
			dataType: "json", 
			success: function(msg) {
				if(msg.check == true) {
					location.href = "project.do";
				}
			},
			error: function() {
				alert("실패");
			}
		});
    	
    });
 	
 	
 	// 모달 타영역 클릭시 checkbox 영역 닫힘 안에 div가 있으면 안되나봄
 	// 코드좀 줄이기 //////////////////////////////////////////////////////////
    $(".modal-footer").click(function(){
    	$("#testVal").css("visibility", "hidden");
     	$("#selMember").css("border","1px solid gray");
    	$("#updatetestVal").css("visibility", "hidden");
     	$("#updateselMember").css("border","1px solid gray");
    });
 	
 	$("#pjtStartDate").click(function(){
    	$("#testVal").css("visibility", "hidden");
     	$("#selMember").css("border","1px solid gray");
    	$("#updatetestVal").css("visibility", "hidden");
     	$("#updateselMember").css("border","1px solid gray");
 	});
 	
 	$("#pjtEndDate").click(function(){
    	$("#testVal").css("visibility", "hidden");
     	$("#selMember").css("border","1px solid gray");
    	$("#updatetestVal").css("visibility", "hidden");
     	$("#updateselMember").css("border","1px solid gray");
 	});

 	$("#updatepjtStartDate").click(function(){
    	$("#testVal").css("visibility", "hidden");
     	$("#selMember").css("border","1px solid gray");
    	$("#updatetestVal").css("visibility", "hidden");
     	$("#updateselMember").css("border","1px solid gray");
 	});
 	
 	$("#updatepjtEndDate").click(function(){
    	$("#testVal").css("visibility", "hidden");
     	$("#selMember").css("border","1px solid gray");
    	$("#updatetestVal").css("visibility", "hidden");
     	$("#updateselMember").css("border","1px solid gray");
 	});
});

function pjtDelete(pid) {
/* x(id='pjtdel') 클릭시 부모요소 가져와서 div삭제 및 db에서 delete */
	var pjtId = {"p_id":pid};
	
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type: "post",
			url: "delete.do",
			data: JSON.stringify(pjtId),
			contentType: "application/json",
			dataType: "json", 
			success: function(msg) {
				if(msg.check == true) {
					alert("삭제 성공");
					location.href = "project.do";
				}
			},
			error: function() {
				alert("실패");
			}
		});
	}
}


function choiceSelectBox(obj){
/* select 안에 checkbox */
	var nWidth = parseInt( obj.offsetWidth );
	var nHeight = parseInt( obj.offsetHeight  );
	var nLeft =  obj.offsetLeft;
	var nTop = obj.offsetTop+obj.offsetHeight+2;
	
	if(navigator.appName=="Microsoft Internet Explorer"){
		nLeft += obj.offsetParent.offsetParent.offsetLeft + obj.offsetParent.offsetLeft;
		nTop += obj.offsetParent.offsetParent.offsetTop + obj.offsetParent.offsetTop;
	}
	
	if( $("#testVal").css("visibility") == "hidden" || $("#updatetestVal").css("visibility") == "hidden" ){
		$("#testVal").css("left", nLeft) ; 
		$("#testVal").css("top", nTop) ;
		$("#testVal").css("padding-left", "0px");
		$("#testVal").css("width", nWidth);   
		$("#testVal").css("visibility", "visible");
		$("#selMember").css("border","2px solid #4e73df");
		
		$("#updatetestVal").css("left", nLeft) ; 
		$("#updatetestVal").css("top", nTop) ;
		$("#updatetestVal").css("padding-left", "0px");
		$("#updatetestVal").css("width", nWidth);   
		$("#updatetestVal").css("visibility", "visible");
		$("#updateselMember").css("border","2px solid #4e73df");
	} else { 
		$("#testVal").css("visibility", "hidden");
		$("#selMember").css("border","1px solid gray");
		
		$("#updatetestVal").css("visibility", "hidden");
		$("#updateselMember").css("border","1px solid gray");
	}

}


function radioBtnSelect(val) {
/* div 태그로 라디오버튼 체크하기 */
	var value = val;
	console.log(value);
	
	if(value == "pub") {
		$("#pri").removeAttr("checked");
		$("#updatepri").removeAttr("checked");
		$("#pub").attr("checked", true);
		$("#updatepub").attr("checked", true);
		
		$(".radioBtn:eq(0)").css({"border":"1.5px solid #4e73df", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
		$(".radioBtn:eq(2)").css({"border":"1.5px solid #4e73df", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
		$(".radioBtn:eq(1)").removeAttr("style");
		$(".radioBtn:eq(3)").removeAttr("style");
	} else if(value == "pri"){
		$("#pub").removeAttr("checked");
		$("#updatepub").removeAttr("checked");
		$("#pri").attr("checked", true);
		$("#updatepri").attr("checked", true);
		
		$(".radioBtn:eq(1)").css({"border":"1.5px solid #4e73df", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
		$(".radioBtn:eq(3)").css({"border":"1.5px solid #4e73df", "border-radius":"5px 5px 5px 5px", "background-color":"#F8F6F6"});
		$(".radioBtn:eq(0)").removeAttr("style");
		$(".radioBtn:eq(2)").removeAttr("style");
	}
}


function modalReset() {
/* 프로젝트 생성모달창 초기화  */
	$("#myModal").on("hidden.bs.modal", function(e) {
		$(this).find('form')[0].reset();
		$("#pri").removeAttr("checked");
		$("#pub").removeAttr("checked");
		$(".radioBtn:eq(0)").removeAttr("style");
		$(".radioBtn:eq(1)").removeAttr("style");
		$("#testVal").css("visibility", "hidden");
		$("#selMember").css("border","1px solid gray");
	});

	/* 프로젝트 기간 - 시작일 설정(오늘 날짜) */
	document.getElementById("pjtStartDate").value = new Date().toISOString().substring(0, 10);
}
</script>


<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

	<!-- 메뉴 -->
     <%@ include file="./menu_side.jsp"%>
 
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
          <div class="contentTopArea" style="width:35%;">
          	<h1 class="h6 mb-1 text-gray-900" style="padding-top:16px; padding-left:35px; font-weight:bold; font-size:20px;">
          		<i class="fas fa-list"></i>&nbsp;&nbsp;삽입내용 미정</h1>
          </div>
          <div class="contentTopArea" style="width:35%;">
          	<ul class="h6 mb-1 text-gray-800" style="padding-top:20px; font-weight:bold; font-size:13px;">
	          	<li style="float:left; margin-left:90px;"><a href="#"><i class="fas fa-clipboard-list"></i>&nbsp;미정</a></li>
	          	<li style="float:left; margin-left:60px;"><a href="#"><i class="fas fa-paperclip"></i>&nbsp;미정</a></li>
          	</ul>
          </div>
          <div class="contentTopArea" style="width:30%;">
          	<h1 class="h6 mb-1 text-gray-800" style="padding-top:19px; padding-right:35px; font-weight:bold; text-align:right;">미정</h1>
          </div>
          <br><br><br>
        
        <div class="container-fluid" style="margin-top:-2.5rem;">
        <br>

          <!-- Content Row -->
          <div class="row">

			<div class="card-body-container">
              <div class="card mb-4 py-3 border-bottom-primary">
                <div class="card-body">
                	<a data-toggle="modal" href="#myModal" id="myBtn" style="text-decoration:none; color:#828181;" onclick="modalReset();">
                	<i class="fas fa-plus" style="font-size:20px;"></i>&nbsp;새 프로젝트</a>
                </div>
              </div>
              
              <c:choose>
				<c:when test="${empty list }">
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
			            <div class="card mb-4 py-3 border-bottom-primary" name="configparent" id="${dto.p_id }">
							<div class="card-body-2">
								<a style="display:inline-block; color:#828181; width:245px; height:15px; text-align:right; vertical-align:top;">
									<sup><i data-toggle="modal" href="#updateModal" id="config" class="fas fa-cog" style="font-size:12px; cursor:pointer;" onclick="pjtUpdate(${dto.p_id });"></i>
										&nbsp;&nbsp;<i class="fas fa-times" id="pjtdel" style="font-size:13px; cursor:pointer;" onclick="pjtDelete(${dto.p_id });"></i></sup></a>
								<a href="tasklist.do" style="text-decoration:none; color:#828181; display:inline-block; margin-top:-10px;">
									<i class="fas fa-check"></i>&nbsp;${dto.p_title }</a>
							</div>
						</div>
            		</c:forEach>
				</c:otherwise>
			  </c:choose>
            </div>
              
            <!-- ============================================== 프로젝트 생성모달 ============================================== -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header" style="border-bottom: 1px solid #ffffff;">
			        <h5 class="modal-title" id="myModalLabel" style="font-weight:bold; color:black; padding-left:10px; padding-top:10px;">새 프로젝트 생성하기</h5>
			        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			      </div>
			     <form action="" method="post" id="modalSubmit">
				      <div class="modal-body">
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">제목</h6>
				        	<input type="text" name="p_title" id="pjtName" placeholder="예) 파이널 프로젝트"
				        		style="font-size:12px; width:430px; height:30px; margin-left:15px; padding:5px;" required><br><br>
				        		
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">설명(선택사항)</h6>
				        	<input type="text" name="p_info" id="pjtInfo"
				        		style="font-size:12px; width:430px; height:30px; margin-left:15px; padding:5px;"><br><br>
				        		
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">공개범위</h6>
				        	<div class="radioBtn" onclick="radioBtnSelect(pub.value);">
				        		<input type="radio" value="pub" name="p_pub" id="pub" required ><label for="" style="margin-bottom:0rem;">&nbsp;&nbsp;전체공개</label>
				        	</div> 
				        	<div class="radioBtn" onclick="radioBtnSelect(pri.value);">
				        		<input type="radio" value="pri" name="p_pub" id="pri"><label for="" style="margin-bottom:0rem;">&nbsp;&nbsp;멤버공개</label>
				        	</div>
				        	<br><br><br><br>
				        	
				        	<span style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">참여멤버</span>
				        	
				        	<span style="color:black; font-size:13px; font-weight:bold; margin-left:95px;">프로젝트 기간</span><br>
	
							 <div id="selMember" style="margin-left:15px; margin-top:5px; margin-right:0px; width:95px;">
							 	<span id="selectBox1" style="font-size:12px; margin-left:5px;" onClick="choiceSelectBox(this);">멤버리스트　▼</span>
							 	<div id="testVal" class="testVal" style="width:82px; left:37px; top:343px; padding-left:0px;;">
							 		<!-- 전체 멤버리스트 뿌리기. value에 user_num 받아오기. id, 라벨 for,text 값에 이름 받아오기 -->
							 		<c:forEach items="${member }" var="m">
							  			<input type="checkbox" name="user_num" id="${m.name }" style="margin-left:5px; margin-right:5px;" value="${m.user_num }"><label for="${m.name }" style="font-size:11px; margin-bottom:0;">${m.name }</label>
							 		</c:forEach>
							 	</div>
							 </div>
							 
							<input type="date" name="p_startdate" id="pjtStartDate" style="font-size:12px; width:125px; height:25px; margin-left:55px; margin-top:5px;">
					       		~ 
					       		<input type="date" name="p_enddate" id="pjtEndDate" style="font-size:12px; width:125px; height:25px; margin-top:5px;" required>
					       		<!-- 2020-09-21 형태로 넘어감 -->
				      </div>
				      
				      <div class="modal-footer" style="border-top: 1px solid #ffffff;">
				        <button type="submit" class="btn btn-primary" id="submitBtn" style="font-size:13px; font-weight:bold;">생성</button>
				      </div>
			      </form>
			    </div>
			  </div>
			</div>
            <!-- ============================================== 프로젝트 생성모달 ============================================== --> 
            
            <!-- ============================================== 프로젝트 수정모달 ============================================== -->
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header" style="border-bottom: 1px solid #ffffff;">
			        <h5 class="modal-title" id="myModalLabel" style="font-weight:bold; color:black; padding-left:10px; padding-top:10px;">프로젝트 수정하기</h5>
			        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			      </div>
			     <form action="" method="post" id="modalUpdate">
			     <!-- 서브밋 = method="post" 설정 안됨-->
				      <div class="modal-body">
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">제목</h6>
				        	<input type="text" name="p_title" id="updatepjtName" placeholder="예) 파이널 프로젝트"
				        		style="font-size:12px; width:430px; height:30px; margin-left:15px; padding:5px;" required><br><br>
				        		
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">설명(선택사항)</h6>
				        	<input type="text" name="p_info" id="updatepjtInfo"
				        		style="font-size:12px; width:430px; height:30px; margin-left:15px; padding:5px;"><br><br>
				        		
				        	<h6 style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">공개범위</h6>
				        	<div class="radioBtn" onclick="radioBtnSelect(pub.value);">
				        		<input type="radio" value="pub" name="p_pub" id="updatepub" required ><label for="" style="margin-bottom:0rem;">&nbsp;&nbsp;전체공개</label>
				        	</div> 
				        	<div class="radioBtn" onclick="radioBtnSelect(pri.value);">
				        		<input type="radio" value="pri" name="p_pub" id="updatepri"><label for="" style="margin-bottom:0rem;">&nbsp;&nbsp;멤버공개</label>
				        	</div>
				        	<br><br><br><br>
				        	
				        	<span style="color:black; font-size:13px; font-weight:bold; margin-left:10px;">참여멤버</span>
				        	
				        	<span style="color:black; font-size:13px; font-weight:bold; margin-left:95px;">프로젝트 기간</span><br>

							 <div id="updateselMember" style="margin-left:15px; margin-top:5px; margin-right:0px; width:95px;">
							 	<span id="updateselectBox1" style="font-size:12px; margin-left:5px;" onClick="choiceSelectBox(this);">멤버리스트　▼</span>
							 	<div id="updatetestVal" class="testVal" style="width:82px; left:37px; top:343px; padding-left:0px;;">
							 		<!-- 전체 멤버리스트 뿌리기. value에 user_num 받아오기. id, 라벨 for,text 값에 이름 받아오기 -->
							 		<c:forEach items="${member }" var="m">
							  			<input type="checkbox" name="user_num" id="${m.name }" style="margin-left:5px; margin-right:5px;" value="${m.user_num }"><label for="${m.name }" style="font-size:11px; margin-bottom:0;">${m.name }</label>
							 		</c:forEach>
							 	</div>
							 </div>
							 
							<input type="date" name="p_startdate" id="updatepjtStartDate" style="font-size:12px; width:125px; height:25px; margin-left:55px; margin-top:5px;">
 				       		~ 
 				       		<input type="date" name="p_enddate" id="updatepjtEndDate" style="font-size:12px; width:125px; height:25px; margin-top:5px;" required>
 				       		<!-- 2020-09-21 형태로 넘어감 -->
				       		
				      </div>
				      <div class="modal-footer" style="border-top: 1px solid #ffffff;">
				      	<input type="hidden" name="updatdpjtId" id="updatdpjtId" style="width:50px; height:20px; font-size:10px; margin-left:15px;">
				        <button type="submit" class="btn btn-primary" id="updateBtn" style="font-size:13px; font-weight:bold;">수정</button>
				      </div>
			      </form>
			    </div>
			  </div>
			</div>
            <!-- ============================================== 프로젝트 수정모달 ============================================== --> 

          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
   		<%@ include file="./footer.jsp" %>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
	<%@ include file="./logout.jsp" %>

  <!-- Bootstrap core JavaScript-->
  <script src="./resources/resource/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./resources/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources/resource/js/sb-admin-2.min.js"></script>

</body>
</html>