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
      <title>Create Discipline Curriculum</title>
   </head>
   <body>
       <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include> 
      <h1>Create Discipline Curriculum</h1>
       
      <p style="color: red;">${errorString}</p>
      <div class="form-cu">
      <form method="POST" action="${pageContext.request.contextPath}/createDisciplineCurriculum" enctype="multipart/form-data">
         <input type="hidden" name="id" value="0" />
            	Discipline
            	<select name="discipline_id">
            	<c:forEach items="${DisciplineList}" var="Discipline" >
            	<option value="${Discipline.id}">${Discipline.name}</option>
            	</c:forEach>
            </select>
            	Curriculum
            	<select name="curriculum_id">
            	<c:forEach items="${CurriculumList}" var="Curriculum" >
            	<option value="${Curriculum.id}">${Curriculum.name}</option>
            	</c:forEach>
            </select>
               Hours
               <input type="number" name="hours" value="${DisciplineCurriculum.hours}" />
               Audit hours
               <input type="number" name="audit_hours" value="${DisciplineCurriculum.audit_hours}" />
               Lab hours
               <input type="number" name="lab_hours" value="${DisciplineCurriculum.lab_hours}" />
               Lecture hours
               <input type="number" name="lec_hours" value="${DisciplineCurriculum.lec_hours}" />
               Practice hours
               <input type="number" name="practice_hours" value="${DisciplineCurriculum.practice_hours}" />
               Independent work hours
               <input type="number" name="independent_work_hours" value="${DisciplineCurriculum.independent_work_hours}" />
               Credits
               <input type="number" name="credits" value="${DisciplineCurriculum.credits}" />
               <p>Has exam
               <input type="radio" name="has_exam" value="true" >Yes
               <input type="radio" name="has_exam" value="false" >No
               <p>Has credit
               <input type="radio" name="has_credit" value="true" >Yes
               <input type="radio" name="has_credit" value="false" >No
               <p>Individual task type
               <input type="text" name="individual_task_type" value="${DisciplineCurriculum.individual_task_type}" />
               Semester
               <input type="number" name="semester" value="${DisciplineCurriculum.semester}" />
               Block
               <input type="text" name="block" value="${DisciplineCurriculum.block}" />
               File URL
               <p><input type="file" name="file_url" id="file_1" class="inputfile inputfile-1" /><label for="file_1"><i class="fas fa-paperclip"></i> Choose file</label>
                   </p><p><input type="submit" value="Submit" />
                   <a href="javascript:history.back()">Cancel</a>
      </form>
      </div>
       <jsp:include page="_footer.jsp"></jsp:include>
   </body>
</html>