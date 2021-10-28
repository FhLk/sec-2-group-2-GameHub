<%--
  Created by IntelliJ IDEA.
  User: natas
  Date: 24/8/2564
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Student</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="d-flex  w-100 justify-content-center">
    <div class="d-flex flex-row w-50 my-4"><strong>Add New Student From::</strong></div>
</div>

<div class="d-flex  w-100 justify-content-center">
    <div class="d-flex flex-row border-1 border-dark bg-light w-50 p-4">
        <form action="add-new-student" method="post">
            <div class="form-group">
                <label for="id">Student Id:</label>
                <input type="number" class="form-control" id="id" name="id" required maxlength="6" minlength="6">
            </div>
            <div class="form-group mt-2">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" size="50" required>
            </div>
            <div class="form-group mt-2 mb-4">
                <label for="gpax">Gpax:</label>
                <input type="number" class="form-control" id="gpax" name="gpax"
                       min="0" max="4.0" step="0.05" required>
            </div>
            <input type="submit" value="Save">
        </form>
    </div>
</div>
<div class="d-flex  w-100 justify-content-center">
    <div class="d-flex flex-row w-50 my-4 text-danger"><strong>${msg}</strong></div>
</div>
</body>
</html>


