<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row pt-4">
    <h2>Classic Model Offices ::</h2>
</div>
<div class="row">
    <c:forEach items="${offices}" var="office">
        <div class="col-2 border border-secondary p-2 m-2 div-link
            ${office.id == selectedOffice.id ? 'bg-warning' : ''}"
             onclick="loadOffice(${office.id})">
            <div>
                    ${office.city}, ${office.country}
            </div>
            <div> ${office.phone}</div>
        </div>
    </c:forEach>
</div>
<br>
<hr>
<br>
<div class="row bg-light">
    <b>Employees ::</b>
</div>
<div class="row">
    <c:forEach items="${selectedOffice.employeeList}" var="employee">
        <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">
            <div> ${employee.firstName} ${employee.lastName} - ${employee.jobTitle}</div>
        </div>
    </c:forEach>
</div>
