<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classic Model</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .div-link {
            cursor: pointer;
            border: 1px burlywood solid;
        }

        .div-link:hover {
            background-color: bisque;
        }

        .cart-info {
            margin-left: -1em;
            border-radius: 12px;
            background-color: bisque;
            position: absolute;
            z-index: 100;
            border: none;
            padding-left: 5px;
            padding-right: 5px;
            display: none;
        }
    </style>
    <script>
        var thisContent = '';

        function loadOffice(officeCode) {
            thisContent = 'office-list';
            const xhttp = new XMLHttpRequest();
            setLoading('on')
            xhttp.onload = function () {
                setLoading('off');
                if (xhttp.status== 200) {
                    document.getElementById("body-content").innerHTML = xhttp.responseText;
                } else {
                    showLoginForm();
                }
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "office-list?officeCode=" + officeCode);
            xhttp.send();
        }

        function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
            thisContent = 'product-list';
            //alert('page: '+ page + ", size: "+ pageSize)
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "product-list?page=" + page + "&pageSize=" + pageSize);
            xhttp.send();
        }

        function setLoading(on_off) {
            let loading = document.getElementById("loading");
            if (on_off == 'on') {
                loading.classList.remove("d-none");
                loading.classList.add("d-inline");
            } else {
                loading.classList.remove("d-inline");
                loading.classList.add("d-none");
            }
        }

        function search(page) {
            alert('Search from: ' + page);
        }

        function addToCart(productCode) {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                cartInfo = document.getElementById("noOfItemInCart");
                noOfItem = xhttp.responseText;
//                alert("Response = "+ noOfItem);
                if (noOfItem > 0) {
                    cartInfo.style.display = 'inline'
                } else {
                    cartInfo.style.display = 'none'
                }
                cartInfo.innerHTML = noOfItem;
            }
            xhttp.open("GET", "add-to-cart?productCode=" + productCode);
            xhttp.send();
        }

        function viewCart() {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                document.getElementById("view-cart").innerHTML = xhttp.responseText;
                $('#viewCartModal').modal('show');
            }
            xhttp.open("GET", "ViewCart.jsp");
            xhttp.send();
        }
        function showLoginForm() {
            let menu = document.getElementById("login-menu").innerHTML;
            if (menu.includes('Logout')) {
                logout();
            } else {
                $('#modalLoginForm').modal('show');
            }
        }
        function login(userName, password) {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                if (xhttp.status == 200) {
                    $('#modalLoginForm').modal('hide');
                    document.getElementById("login-menu").innerHTML="<i class='bi bi-box-arrow-left'></i> Logout"
                } else if (xhttp.status >= 500) {
                    document.getElementById("login-message").innerHTML = xhttp.statusText;
                } else {
                    document.getElementById("login-message").innerHTML = "Wrong user name or password !!!";
                }
            }
            // var params = "userName=" + userName + "&password=" + password;
            // //alert("params: " + params);
            // xhttp.open("GET", "login?" + params);
            // xhttp.send();
            let urlEncodedData = "", urlEncodedDataPairs = [];
            urlEncodedDataPairs.push( encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
            urlEncodedDataPairs.push( encodeURIComponent("password") + '=' + encodeURIComponent(password));
            urlEncodedData = urlEncodedDataPairs.join( '&' ).replace( /%20/g, '+' );
            xhttp.open("POST", "login");
            xhttp.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
            xhttp.send(urlEncodedData);
        }
        function logout() {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                location.reload();
            }
            xhttp.open("GET", "logout");
            xhttp.send();
        }
            

    </script>
</head>
<body>
<jsp:include page="WEB-INF/jsp/login-form.html"/>
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
                    <a id="login-menu" class="nav-link text-light" href="javascript:showLoginForm()"><i
                            class="bi bi-box-arrow-in-right"></i> Login</a>
                </li>
            </ul>
            <div style="margin-right: 20px">
                <img src="assets/image/cart.png" width="42" onclick="viewCart()"/>
                <button id="noOfItemInCart" class="cart-info" onclick="viewCart()"></button>
            </div>
            <form class="d-flex">
                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search">
                <button class="btn btn-primary" type="button" onclick="search(thisContent)">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container" id="body-content">
    <h3>SIT-202: Classic Model Online</h3>
    <p>SIT-202 is a global online marketplace. <br>
    <p>SIT-202 is a young and dynamic company specialized in the online sale of static collectible models and
        related
        accessories.
        Our location are distributed around the world. <br>
        Welcome to the world of classic cars and antique cars! On our marketplace, we offer a huge assortment of
        Classic
        Cars from different manufacturers and decades. Horses, flashpoints and stars are popular motives you may
        encounter - Classic Cars were made as lifestyle products once and not just as technical status symbols.
        Share
        some good taste on the street and show the style you identify with the most. We make it easy to obtain
        European
        and American cars including insurance and shipping issues.
        The Emergence of a new Cult in Society - Classic Cars as Status Symbols
        In 1885, Carl Benz turned over a new leaf in the history of mobility and was granted a patent for the first
        automobile. The technique evolved with new makes and models like the Ford Tin Lizzie and the Mercedes-Benz
        300
        SL over the past 100 years. Some of the tedious models from the past turned into popular classic Car models
        over
        the years - European cars like the Volkswagen Beetle, Citroen 2CV or Jaguar XK and other "oldies" are good
        examples for this nostalgic value.
        Over 2.500 manufacturers produced a countless number of different car models over the past 100 years. It is
        not
        that easy to tell what makes a certain car so special, even decades after the production shut down.
        Sometimes it
        depends on the car body as such, sometimes a famous driver increased the popularity of a certain car model.
        Good
        examples for cars that made an astonishing image change are the European Opel Kadett or classic muscle cars
        from
        the US. Those pragmatic but fuel consuming cars were widely disliked for years - today, there is a huge fan
        community for old and restored muscle cars and standard models from Europe and they are popular collectibles
        for
        every automobile fan.
    </p>
</div>
<div class="d-flex justify-content-center modal d-none" id="loading">
    <div class="spinner-border text-primary"
         style="margin-top: 10%; width: 6rem; height: 6rem;"></div>
</div>
<%--<c:if test="${cookie.lastpage != null}">--%>
<script>
    window.onload = (ev) => {
        <%--                ${cookie.lastpage.value ==--%>
        <%--                'office-list' ? 'loadOffice()' : 'loadProduct(1,15)'}--%>
        addToCart('');
    };
</script>
<%--</c:if>--%>
<div class="modal" tabindex="-1" id="viewCartModal">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="$('#viewCartModal').modal('hide')">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="view-cart">
                <p>Modal body text goes here.</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>