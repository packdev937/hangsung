<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="com.hangsung.travel.domain.TravelPackage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<div class="container px-4 px-lg-5 mt-5">
    <div class="card-header bg-transparent pb-3 border-0">
        <h3 class="fw-bold text-start mb-0 ps-0"> 최근에 작성된 여행들이에요</h3><br>
    </div>
    <div class="row gx-3 gx-lg-4 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach var="pkg" items="${recentPackages}">
            <div class="col mb-5">
                <div class="card h-100">
                    <div class="badge bg-warning text-white position-absolute"
                         style="top: 0.5rem; right: 0.5rem">New
                    </div>
                    <img class="card-img-top" src="/upload/${pkg.getFilename()}" alt="..." style="height : 200px"/>
                    <div class="card-body mb-0 pb-0">
                        <div class="text-left">
                            <!-- Package name -->
                            <h5 class="fw-bolder">${pkg.getTitle()}</h5>
                        </div>
                    </div>
                    <!-- Product details & actions -->
                    <div class="card-footer pt-0 mt-0 border-top-0 bg-transparent">
                        <div class="row">
                            <!-- 왼쪽 열: 텍스트 -->
                            <div class="col-md-6 mr-0 d-flex flex-column align-items-start">
                                <h6 class="d-flex small mb-2">
                                    <%
                                        LocalDateTime current = LocalDateTime.now();
                                        TravelPackage packageItem = (TravelPackage) pageContext.getAttribute("pkg");
                                        LocalDateTime pkgTime = packageItem.getCreatedAt();
                                        long hours = ChronoUnit.HOURS.between(pkgTime, current);
                                        long days = ChronoUnit.DAYS.between(pkgTime, current);
                                        long minutes = ChronoUnit.MINUTES.between(pkgTime, current);

                                        String timeAgo = "";
                                        if (days > 0) {
                                            timeAgo = days + " 일 전";
                                        } else if (hours > 0) {
                                            timeAgo = hours + " 시간 전";
                                        } else if (minutes > 0) {
                                            timeAgo = minutes + " 분 전";
                                        } else {
                                            timeAgo = "방금 전";
                                        }
                                    %><%= timeAgo %>
                                </h6>
                                </a>
                                <h6 class="text-secondary"
                                    style="font-size: 0.9rem;">${String.format("%,d",pkg.getPrice() - 10000)}원
                                    / ${pkg.getPeople()}명</h6>
                            </div>

                            <!-- 오른쪽 열: 버튼 -->
                            <div class="col d-flex justify-content-end align-items-end">
                                <a class="btn btn-outline-dark mt-0 btn-sm" href="/travel/${pkg.getId()}">자세히보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
