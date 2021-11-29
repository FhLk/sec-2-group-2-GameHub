
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row pt-4 align-items-center">
    <c:forEach items="${products}" var="p" varStatus="vs">
        <div class="col-2 my-1 mx-3">
            <div class="img-fluid img-thumbnail" title="${p.productDescription}">
                <img src="model-images/${p.productLine.id}/${p.id}.jpg" height="120" width="180"/>
            </div>
            <div>
                    ${p.productName} <span class="text-right">${p.msrp}</span></div>
            <span style="color: darkred;margin-left: 2px;cursor: pointer">
            <i class="bi bi-bag-plus" onclick="addToCart('${p.id}')"></i></span>
         </div>
    </c:forEach>
</div>
<hr>

<div class="d-flex flex-row">
    <div class="px-1">page:</div>
    <div class="px-1 mx-1 div-link"
         onclick="loadProduct(page=${page<=1?totalPage:page-1}, ${pageSize})"> &lt;
    </div>
    <c:forEach begin="1" end="${totalPage}" varStatus="vs"><c:choose><c:when test="${vs.count==page}">
        <div class="px-1 mx-1 div-link text-light bg-dark"> ${vs.count} </div>
    </c:when><c:otherwise>
        <div class="px-1 mx-1 div-link" onclick="loadProduct(page=${vs.count}, ${pageSize})">
                ${vs.count}                </div>
    </c:otherwise></c:choose></c:forEach>
    <div class="px-1 mx-2 div-link"
         onclick="loadProduct(page=${page>=totalPage?1:page+1}, ${pageSize})"> &gt;
    </div>
    <div class="px-4 mx-1">
        items per page:
        <select id="itemsPage" onchange="loadProduct(1)">
            <option value="5" ${pageSize==5?'selected':''}>5</option>
            <option value="10" ${pageSize==10?'selected':''}>10</option>
            <option value="15" ${pageSize==15?'selected':''}>15</option>
            <option value="20" ${pageSize==20?'selected':''}>20</option>
            <option value="50" ${pageSize==50?'selected':''}>50</option>
        </select>
    </div>
</div>
