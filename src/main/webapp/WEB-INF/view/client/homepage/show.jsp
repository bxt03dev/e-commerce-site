<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">


    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/custom.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">

</head>

<body>

<!-- Spinner Start -->
<div id="spinner"
     class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar start -->
<jsp:include page="../layout/header.jsp"/>
<!-- Navbar End -->


<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords"
                           aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text p-3"><i
                            class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->


<!-- Hero Start -->
<jsp:include page="../layout/slider.jsp"/>
<!-- Hero End -->


<!-- Featurs Section Start -->

<!-- Featurs Section End -->


<!-- Fruits Shop Start-->
<div class="container-fluid fruite py-5">
    <div class="container py-5">
        <div class="tab-class text-center">
            <div class="row g-4">
                <div class="col-lg-4 text-start">
                    <h1>Our Quality Products</h1>
                </div>
                <div class="col-lg-8 text-end">
                    <ul class="nav nav-pills d-inline-flex text-center mb-5">
                        <li class="nav-item">
                            <a class="d-flex m-2 py-2 bg-light rounded-pill active" href="/products">
                                <span class="text-dark" style="width: 130px;">All Products</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                        <div class="col-lg-12">
                            <div class="row g-4">
                                <c:forEach var="product" items="${products}">
                                <div class="col-md-6 col-lg-4 col-xl-3">
                                    <div style="border: 1px solid #e6e6e6;" class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="/images/product/${product.image}"
                                                 class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                             style="top: 10px; left: 10px;">Laptops</div>
                                        <div style="border: none !important; " class="p-4 border   border-top-0 rounded-bottom">
                                            <h4 style="font-size: 15px;">
                                                <a href="/product/${product.id}">${product.name}</a>
                                            </h4>
                                            <p style="font-size: 13px;">${product.shortDesc}</p>
                                            <div class="d-flex flex-lg-wrap justify-content-center flex-column">
                                                <p style="font-size: 15px; text-align: center; width: 100%"
                                                   class="text-dark fw-bold mb-3"><fmt:formatNumber type="number" value="${product.price}"/>đ</p>
                                                <form action="/add-product-to-cart/${product.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <button class="mx-auto btn border border-secondary   rounded-pill px-3 primary_color"><i
                                                            class="fa fa-shopping-bag me-2 primary_color"></i>
                                                        Add to cart
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../layout/feature.jsp"/>

<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mx-auto mb-5" style="max-width: 700px;">
            <h1 class="display-4">Bestseller Products</h1>
            <p>
                BestProduct offers a wide selection of high-quality items across various categories,
                ensuring great value and excellent customer service. Shop with ease and enjoy fast delivery for all your needs!
            </p>
        </div>
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <c:forEach var="product" items="${products}" varStatus="status">
                        <c:if test="${status.index < 4}">
                            <div class="col-md-6 col-lg-4 col-xl-3">
                                <div style="border: 1px solid #e6e6e6;" class="rounded position-relative fruite-item">
                                    <div class="fruite-img">
                                        <img src="/images/product/${product.image}" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Laptops</div>
                                    <div style="border: none !important;" class="p-4 border border-top-0 rounded-bottom">
                                        <h4 style="font-size: 15px;" class="text-center">
                                            <a href="/product/${product.id}" class="text-dark">${product.name}</a>
                                        </h4>
                                        <p style="font-size: 13px;" class="text-center">${product.shortDesc}</p>
                                        <div class="d-flex flex-lg-wrap justify-content-center flex-column">
                                            <p style="font-size: 15px; text-align: center; width: 100%" class="text-dark fw-bold mb-3">
                                                <fmt:formatNumber type="number" value="${product.price}"/>đ
                                            </p>
                                            <form action="/add-product-to-cart/${product.id}" method="post" class="text-center">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button class="mx-auto btn border rounded-pill px-3 primary_color">
                                                    <i class="fa fa-shopping-bag me-2 primary_color"></i> Add to cart
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- Bestsaler Product End -->





<!-- Footer Start -->
<jsp:include page="../layout/footer.jsp"/>
<!-- Copyright End -->



<!-- Back to Top -->
<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
        class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/client/js/main.js"></script>
</body>

</html>