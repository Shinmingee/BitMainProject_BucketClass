<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.pap.bucketclass.entity.Role" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.pap.bucketclass.entity.Member" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	Set<Role> userRole = new HashSet<>();

	if(principal != null && principal instanceof Member){
		userRole = ((Member)principal).getRoles();
	}
	String roleStr = null;
	Iterator<Role> itr = userRole.iterator();
	while(itr.hasNext()){
		roleStr = itr.next().getRoleName();
	}

%>

<a href="#" class="dashboard-responsive-nav-trigger"><i class="fa fa-reorder"></i> Dashboard Navigation</a>

<div class="dashboard-nav">
		<div class="dashboard-nav-inner">
			<ul id="sidebar">
			<!------------------------------------------------->
			<!------------- side bar content ------------------>
			<!------------------------------------------------->
			</ul>
		</div>
</div>

	<!-- Navigation / End -->

<script type="text/javascript">
	// 세션에서 받은 유저 권한
	var userRole ="<%=roleStr%>";
	console.log("사이드바>>>", userRole);

	if(userRole === "ROLE_CUSTOMER"){

		var customerSideBarContent =
				'<ul data-submenu-title="">'
				+'<li><a id="sideBarBookmarks" href="#"><i class="sl sl-icon-heart"></i> 나의 수강 관리</a></li>'
				+'<li class="active"><a id="sideBarMyPage" href="/customer/mypage"><i class="sl sl-icon-user"></i> 마이페이지</a></li>'
				+'<li><a id="sideBarLogout" href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

		document.querySelector('#sidebar').innerHTML = customerSideBarContent;

	} else if(userRole === "ROLE_PROVIDER"){

		var providerSideBarContent =

				'<ul data-submenu-title="">'
				+'<li class="active"><a><i class="sl sl-icon-layers"></i> 나의 수업 관리</a>'
				+'<ul><li><a href="/provider/pending-listing"><span class="nav-tag green"></span>&nbsp;&nbsp;&nbsp;&nbsp;대기중 </a></li>'
				+'<li><a href="/provider/active-listing"><span class="nav-tag yellow"></span>&nbsp;&nbsp;&nbsp;&nbsp;진행중 </a></li>'
				+'<li><a href="/provider/expired-listing"><span class="nav-tag red"></span>&nbsp;&nbsp;&nbsp;&nbsp;완료  </a></li></ul></li>'
				+'<li><a id="sideBarAddListing" href="/provider/add-service"><i class="sl sl-icon-plus"></i> 수업 추가하기</a></li>'
				+'<li class="active"><a id="sideBarMyPage" href="/provider/mypage"><i class="sl sl-icon-user"></i>마이페이지</a></li>'
				+'<li><a id="sideBarLogout" href="/logout"><i class="sl sl-icon-power"></i> 로그아웃</a></li></ul>';

		document.querySelector('#sidebar').innerHTML = providerSideBarContent;
	}
</script>