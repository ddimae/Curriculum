<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE xhtml>
<html>
   <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/stool.css" title="default" />
      <link rel="alternate stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/stool_light.css" title="alternate" />
      <script src="https://kit.fontawesome.com/982c488da8.js"></script>
      <script type="text/javascript" src="${pageContext.request.contextPath}/styles/styleswitcher.js"></script>
      <title>Update Faculty</title>
   </head>
   <body>
  <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
      <h1>Update Faculty</h1>
 
      <p style="color: red;">${errorString}</p>
 
      <c:if test="${not empty Faculty}">
      <div class="form-cu">
         <form method="POST" action="${pageContext.request.contextPath}/editFaculty">
            <input type="hidden" name="id" value="${Faculty.id}" />
               <p>ID <span style="color:red;">${Faculty.id}</span></p>
                  Code
                  <input type="text" name="code" value="${Faculty.code}" />
                  Name
                  <input type="text" name="name" value="${Faculty.name}" />
                      <input type="submit" value="Submit" />
                      <a href="${pageContext.request.contextPath}/FacultyList">Cancel</a>
         </form>
      </div>
      </c:if>
 <jsp:include page="_footer.jsp"></jsp:include>
   </body>
</html>