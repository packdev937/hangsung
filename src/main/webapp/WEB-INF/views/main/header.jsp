<%@page contentType="text/html; charset=utf-8" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/" style="font-size:24px; font-weight:bold">
            <img src="../.././resources/images/planet.jpg" alt="Home Icon" class="img-fluid" style="width:40px; height:40px">
            <%-- <a class="navbar-brand" href="/" style="font-size:24px; font-weight:bold">행성</a> --%>
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active"
                                        aria-current="page" href="/">홈</a></li>
                <li class="nav-item"><a class="nav-link"
                                        href="/travel/create">패키지 작성하기</a></li>
                <li class="nav-item"><a class="nav-link" href="/cart">장바구니</a></li>
                <li class="nav-item"><a class="nav-link" href="/mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>
