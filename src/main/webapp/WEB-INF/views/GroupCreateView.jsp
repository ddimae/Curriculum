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
      <title>Create Group</title>
   </head>
   <body>
       <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include> 
      <h1>Create Group</h1>
       
      <p style="color: red;">${errorString}</p>
      <div class="form-cu">
      <form method="POST" action="${pageContext.request.contextPath}/createGroup">
         <input type="hidden" name="id" value="0" />
               Code
               <input type="text" name="code" value="${Group.code}" />
               Name
               <input type="text" name="name" value="${Group.name}" />
               Year
               <input type="text" name="year" value="${Group.year}" />
            	Curriculum
            	<select name="curriculum_id">
            	<c:forEach items="${CurriculumList}" var="Curriculum" >
            	<option value="${Curriculum.id}">${Curriculum.name}</option>
            	</c:forEach>
            </select>
            	Specialty
            	<select name="specialty_id">
            	<c:forEach items="${SpecialtyList}" var="Specialty" >
            	<option value="${Specialty.id}">${Specialty.name}</option>
            	</c:forEach>
            </select>
            	Department
            	<select name="department_id">
            	<c:forEach items="${DepartmentList}" var="Department" >
            	<option value="${Department.id}">${Department.name}</option>
            	</c:forEach>
            </select>
                   <input type="submit" value="Submit" />
                   <a href="javascript:history.back()">Cancel</a>
      </form>
      </div>
       <jsp:include page="_footer.jsp"></jsp:include>
   </body>
</html>