<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE xhtml>
<html>
 <head>
    <meta charset="UTF-8">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/stool.css" title="default" />
      <link rel="alternate stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/stool_light.css" title="alternate" />
      <script src="https://kit.fontawesome.com/982c488da8.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/styles/styleswitcher.js"></script>
      <script src="https://kit.fontawesome.com/982c488da8.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/styles/styleswitcher.js"></script>
    <title>Факультети - StudyPlans</title>
 </head>
 <body>
 
  <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
    <h1>Список факультетів</h1>
    <div class="search">
		<form method="POST" action="${pageContext.request.contextPath}/searchFaculty">
			<ul>
				<li>
					<div class="link__block">
			<c:if test="${loginedUser.user_type=='2' || loginedUser.user_type=='1'}" >
				<a href="${pageContext.request.contextPath}/createFaculty"><i class="fas fa-plus-square"></i> Create Faculty</a>
			</c:if>
				<a href="javascript:history.back()">Back</a>
					</div>
				</li>
				<li>
					<div class="search__block">
	    				<input type="text" name="search" placeholder="Search..." />
	    				<button type="submit"><i class="fa fa-search"></i></button>
	    			</div>
	    		</li>
			</ul>
		</form>
	</div>
 
    <p style="color: red;">${errorString}</p>
 
    <table class="container">
    <thead>
       <tr>
       <c:if test="${loginedUser.user_type=='2' || loginedUser.user_type=='1'}" >
          <th><h5>ID</h5></th>
       </c:if>
          <th><h5>Код</h5></th>
          <th><h5>Назва</h5></th>
       </tr>
       </thead>
       <tbody>
       <c:forEach items="${FacultyList}" var="Faculty" >
          <tr>
          <c:if test="${loginedUser.user_type=='2' || loginedUser.user_type=='1'}" >
             <td>${Faculty.id}</td>
          </c:if>
             <td>${Faculty.code}</td>
             <td>${Faculty.name}</td>
             <c:if test="${loginedUser.user_type=='2' || loginedUser.user_type=='1'}" >
             <td>
                <a href="editFaculty?id=${Faculty.id}"><i class="far fa-edit"></i> Edit</a>
             </td>
             <td>
                <a href="deleteFaculty?id=${Faculty.id}"><i class="far fa-trash-alt"></i> Delete</a>
             </td>
             </c:if>
          </tr>
       </c:forEach>
       </tbody>
    </table>
    <div class="menu">
    <ul>
 	<c:if test="${currentPage != 1}">
 		<li><a href="${pageContext.request.contextPath}/FacultyList?page=${currentPage - 1}">Previous</a></li>
 	</c:if>
 	
 		<c:forEach begin="1" end="${noOfPages}" var="i">
 			<c:choose>
 				<c:when test="${currentPage eq i}">
 					<li><a class="active">${i}</a></li>
 				</c:when>
 				<c:otherwise>
 					<li><a href="${pageContext.request.contextPath}/FacultyList?page=${i}">${i}</a></li>
 				</c:otherwise>
 			</c:choose>
 		</c:forEach>
 	
 	<c:if test="${currentPage lt noOfPages}">
 		<li><a href="${pageContext.request.contextPath}/FacultyList?page=${currentPage + 1}">Next</a></li>
	</c:if>   
 	</ul>
 	</div>
 <jsp:include page="_footer.jsp"></jsp:include>
 
 </body>
</html>