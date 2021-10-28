<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classic Model</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <style>
        .div-link {
            cursor: pointer;
            border: 1px burlywood solid;
        }
        .div-link:hover {
            background-color: bisque;
        }
    </style>
    <script>
        function loadOffice(officeCode) {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "office-list?officeCode="+officeCode);
            xhttp.send();
        }
        function loadProduct(page, pageSize=document.getElementById("itemsPage").value) {
            //alert('page: '+ page + ", size: "+ pageSize)
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "product-list?page="+page+"&pageSize="+pageSize);
            xhttp.send();
        }
        function googleSearch() {
            //alert('page: '+ page + ", size: "+ pageSize)
            const xhttp = new XMLHttpRequest();
            xhttp.withCredentials = true;

            searchText = document.getElementById("searchBox").value;
            xhttp.onload = function() {
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.onerror = function() {
                document.getElementById("body-content").innerHTML = "<h2 class='text-danger'>"+
                    xhttp.statusText+ "</h2>";
            }
            xhttp.open("GET", "https://www.google.com/search?q="+searchText+ '&rlz=1C1CHZL_enTH813TH813&sxsrf=AOaemvKVIz2_rs6dXOAsLprJQGOcmU8_5A:1635095966168&ei=npV1YZDrCarbz7sP0Ja4iAE&ved=0ahUKEwiQsvKRx-PzAhWq7XMBHVALDhEQ4dUDCA4&oq=java&gs_lcp=Cgdnd3Mtd2l6EAwyBwgjELADECcyBwgjELADECcyBwgjELADECcyBwgAEEcQsAMyBwgAEEcQsAMyBwgAEEcQsAMyBwgAEEcQsAMyBwgAEEcQsAMyBwgAEEcQsAMyBwgAEEcQsANKBAhBGABQAFgAYI-cN2gBcAJ4AIABAIgBAJIBAJgBAMgBCsABAQ&sclient=gws-wiz');
            xhttp.send();
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-warning" href="javascript:void(0)">Classic Model</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOffice('')">Office</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadProduct(1,15)">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)">Order History</a>
                </li>
                <li class="nav-item ml-4">
                    <a class="nav-link text-light" href="#"><i class="bi bi-box-arrow-in-right"></i> Login</a>
                </li>
            </ul>
            <form class="d-flex">
                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search">
                <button class="btn btn-primary" type="button" onclick="googleSearch()">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container" id="body-content">
    <h3>SIT-202: Classic Model Online</h3>
    <p>SIT-202 is a global online marketplace. <br>
    <p>SIT-202 is a young and dynamic company specialized in the online sale of static collectible models and related accessories.
        Our location are distributed around the world. <br>
        Welcome to the world of classic cars and antique cars! On our marketplace, we offer a huge assortment of Classic Cars from different manufacturers and decades. Horses, flashpoints and stars are popular motives you may encounter - Classic Cars were made as lifestyle products once and not just as technical status symbols. Share some good taste on the street and show the style you identify with the most. We make it easy to obtain European and American cars including insurance and shipping issues.
        The Emergence of a new Cult in Society - Classic Cars as Status Symbols
        In 1885, Carl Benz turned over a new leaf in the history of mobility and was granted a patent for the first automobile. The technique evolved with new makes and models like the Ford Tin Lizzie and the Mercedes-Benz 300 SL over the past 100 years. Some of the tedious models from the past turned into popular classic Car models over the years - European cars like the Volkswagen Beetle, Citroen 2CV or Jaguar XK and other "oldies" are good examples for this nostalgic value.
        Over 2.500 manufacturers produced a countless number of different car models over the past 100 years. It is not that easy to tell what makes a certain car so special, even decades after the production shut down. Sometimes it depends on the car body as such, sometimes a famous driver increased the popularity of a certain car model. Good examples for cars that made an astonishing image change are the European Opel Kadett or classic muscle cars from the US. Those pragmatic but fuel consuming cars were widely disliked for years - today, there is a huge fan community for old and restored muscle cars and standard models from Europe and they are popular collectibles for every automobile fan.
    </p>
</div>
</body>
</html>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>JSP - Hello World</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Classic Model Online::</h1>--%>

<%--<br/>--%>
<%--<a href="product-list">Product List</a><br>--%>
<%--<a href="office-list">Office List</a>--%>
<%--</body>--%>
<%--</html>--%>