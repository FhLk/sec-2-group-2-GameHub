<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page import="java.util.Collection" %>--%>
<%--<%@ page import="sit.int202.demo.models.Student" %>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: natas--%>
<%--  Date: 27/9/2564--%>
<%--  Time: 3:46--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Listing::</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
    <div class="container">
        <p class="h1">Student Listing:: </p>
        <div class="row">
<%--            <%--%>
<%--                Collection<Student> students= (Collection<Student>) request.getAttribute("students");--%>
<%--                int i = 1;--%>
<%--                String bg = null;--%>
<%--                for(Student st : students) {--%>
<%--                        if (i++%2==0)--%>
<%--                            bg = "bg-light";--%>
<%--                        else--%>
<%--                            bg = "bg-secondary";--%>
<%--            %>--%>
    <c:forEach items="${students}" var="student" varStatus="vs">
<%--    <div class="col-2 bg-light p-3 m-3 border-1 border-secondary <%=bg%>">--%>
           <div class="col-3 p-3 m-3 border border-secondary ${vs.count%5==1 || vs.count%5==3 ? 'bg-primary':'bg-light'}">
            <div>Id:${student.id}</div>
            <div>Name:${student.name}</div>
            <div>Gpax:${student.gpax}</div>
<%--                    <div>Id:<%=st.getId()%></div>--%>
<%--                    <div>Name<%=st.getName()%></div>--%>
<%--                    <div>Gpax:<%=st.getGpax()%></div>--%>
    </div>
    </c:forEach>
<%--                <%}%>--%>

            </div>

    </div>

</body>
</html>