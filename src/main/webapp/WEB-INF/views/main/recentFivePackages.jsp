<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<div class="container px-4 px-lg-5 mt-5">
    <div class="card-header bg-transparent pb-3 border-0">
        <h3 class="fw-bold text-start mb-0 ps-0">✈️ 최근에 작성된 여행 패키지</h3><br>
    </div>
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center">

        <%-- 패키지 리스트 반복 --%>
        <c:forEach var="pkg" items="${recentPackages}">
            <div class="col mb-5">
                <div class="card h-100">
                    <div class="badge bg-dark text-white position-absolute"
                         style="top: 0.5rem; right: 0.5rem">New
                    </div>
                    <!-- Package image -->
                    <img class="card-img-top" src="/upload/${pkg.getFilename()}" alt="..."/>
                    <!-- Package details -->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Package name -->
                            <h5 class="fw-bolder">${pkg.getTitle()}</h5>
                        </div>
                        <div class="text-center">
                            <!-- Package Creation Time 시계 옆에 시간띄우는 로직만 넣으면 됨 -->
                            <h6>⏰ </h6>-
                        </div>
                    </div>
                    <!-- Product actions -->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-outline-dark mt-auto" href="/travel/${pkg.getId()}">자세히보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
