<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
	  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- <table class="container">
	<tbody>
	<tr>
		<td onClick="document.location.href='${pageContext.request.contextPath}/'">Home</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/userInfo'">Account</td>
		<c:if test="${user.user_type=='1'}" >
		<td onClick="document.location.href='${pageContext.request.contextPath}/UserAccountList'">Users</td>
		</c:if>
		<c:if test="${user.user_type=='1' || user.user_type=='0'}" >
		<td onClick="document.location.href='${pageContext.request.contextPath}/CurriculumList'">Curriculums</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/DepartmentList'">Departments</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/DisciplineList'">Disciplines</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/FacultyList'">Faculties</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/GroupList'">Groups</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/SpecialtyList'">Specialties</td>
		<td onClick="document.location.href='${pageContext.request.contextPath}/DisciplineCurriculumList'">Discipline curriculums</td>
		</c:if>		
	</tr>
	</tbody>
	</table> -->
	<div class="menu">
	<ul>
	<c:if test="${loginedUser.user_type=='2'}" >
		<li><a href="${pageContext.request.contextPath}/UserAccountList"><i class="fa fa-user"></i> Users</a>
	</c:if>
	<c:if test="${loginedUser.user_type=='2' || loginedUser.user_type=='1' || loginedUser.user_type=='0' || loginedUser.user_type==null}" >
		<li><a href="${pageContext.request.contextPath}/CurriculumList">Curriculums</a></li>
		<li><a href="${pageContext.request.contextPath}/DepartmentList">Departments</a></li>
		<li><a href="${pageContext.request.contextPath}/DisciplineList">Disciplines</a></li>
		<li><a href="${pageContext.request.contextPath}/FacultyList">Faculties</a></li>
		<li><a href="${pageContext.request.contextPath}/GroupList">Groups</a></li>
		<li><a href="${pageContext.request.contextPath}/SpecialtyList">Specialties</a></li>
		<li><a href="${pageContext.request.contextPath}/DisciplineCurriculumList">Discipline curriculums</a></li>
	</c:if>
	</ul>
	</div>
  