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
      <title>Update Specialty</title>
   </head>
   <body>
  <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
      <h1>Update Specialty</h1>
 
      <p style="color: red;">${errorString}</p>
 
      <c:if test="${not empty Specialty}">
      <div class="form-cu">
         <form method="POST" action="${pageContext.request.contextPath}/editSpecialty">
            <input type="hidden" name="id" value="${Specialty.id}" />
               ID
                  ${Specialty.id}
                  Code
                  <input type="text" name="code" value="${Specialty.code}" />
                  Name
                  <input type="text" name="name" value="${Specialty.name}" />
                  
                      <input type="submit" value="Submit" />
                      <a href="javascript:history.back()">Cancel</a>
         </form>
      </div>
      </c:if>
 <jsp:include page="_footer.jsp"></jsp:include>
   </body>
</html>