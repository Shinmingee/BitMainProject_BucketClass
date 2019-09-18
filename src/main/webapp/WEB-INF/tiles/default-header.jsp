<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.pap.bucketclass.entity.Role" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.pap.bucketclass.entity.Member" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	Set<Role> userRole = new HashSet<>();
	String memberNickname = null;
	String memberImgUri = null;

	if(principal != null && principal instanceof Member){
		userRole = ((Member)principal).getRoles();
		memberNickname = ((Member)principal).getMemberNickname();
		memberImgUri = ((Member)principal).getMemberImg();
		System.out.println(memberImgUri);
	}
		String roleStr = null;
		Iterator<Role> itr = userRole.iterator();
		while(itr.hasNext()){
			roleStr = itr.next().getRoleName();
		}

%>

<!-- Header Container -->
<header id="header-container">

	<!-- Header -->
	<div id="header">
		<div class="container">

			<!-- Left Side Content -->
			<div class="left-side">

				<!-- Logo -->
				<div id="logo">
					<a href="/"><img src="/img/logo.png" alt=""></a>
				</div>

				<div class="clearfix"></div>
				<!-- Main Navigation / End -->
			</div>
			<!-- Left Side Content / End -->



			<!-- Right Side Content  -->
			<div class="right-side">
				<div class="header-widget">
					<div class="user-menu" id="user-menu">
						<!------------------------------------------------->
						<!------------- user menu content ----------------->
						<!------------------------------------------------->

					</div>
				</div>
			</div>
			<!-- Right Side Content / End -->

		</div>
	</div>
	<!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->
<script>

	var userRoleData ="<%=roleStr%>";
	var getNickName = "<%=memberNickname%>";
	var getImgUri = "<%=memberImgUri%>";

	console.log("디폴트버전>>>", userRoleData);
	console.log("디폴트버전>>>",getNickName);
	console.log("디폴트버전>>>",getImgUri);

	if (userRoleData === "ROLE_CUSTOMER") {

		var headerContentCustomer = '<div class="user-name"><span><img src="../img/' + getImgUri + '" alt=""></span>'
				+ getNickName
				+ '님, 안녕하세요!</div>'
				+ '<ul><li><a href="/customer/mypage"><i class="sl sl-icon-settings"></i> 마이페이지</a></li>'
				+ '<li><a href=#><i class="fa fa-calendar-check-o"></i> 나의 수강 관리</a></li>'
				+ '<li><a href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

		console.log(headerContentCustomer);
		document.querySelector('#user-menu').innerHTML = headerContentCustomer;

	} else if (userRoleData === "ROLE_PROVIDER") {

		var headerContentProvider = '<div class="user-name"><span><img src="../img/' + getImgUri + '" alt=""></span>'
				+ getNickName
				+ '님, 안녕하세요!</div>'
				+ '<ul><li><a href="/provider/mypage"><i class="sl sl-icon-settings"></i> 마이페이지</a></li>'
				+ '<li><a href="/provider/active-listing"><i class="fa fa-calendar-check-o"></i> 나의 수업 관리</a></li>'
				+ '<li><a href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

		console.log(typeof headerContentProvider, headerContentProvider);
		document.querySelector('#user-menu').innerHTML = headerContentProvider;

	} else {
		var headerContent = '<a href="/login" class="sign-in">로그인</a>'
				+ '<a href="/signup" class="sign-in">회원가입</a>';

		console.log(headerContent);
		document.querySelector('#user-menu').innerHTML = headerContent;
	}
</script>