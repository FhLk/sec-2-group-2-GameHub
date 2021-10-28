<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Student Listing ::</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <p class="h1">Student Listing ::</p>
  <div class="row">
    <c:forEach items="${students}" var="student" varStatus="vs">
      <div class="col-2 p-2 m-2 border border-secondary
            ${vs.count%5==1 ||vs.count%5==3 ? 'bg-primary' : 'bg-light'}">

        <div>Id: ${student.id}</div>
        <div>Name: ${student.name}</div>
        <div>gpax: ${student.gpax}</div>
      </div>
    </c:forEach>
  </div>
</div>

</body>
</html>
