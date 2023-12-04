<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="com.hangsung.travel.domain.TravelPackage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<div class="container px-4 px-lg-5 mt-5">
    <div class="card-header bg-transparent pb-3 border-0">
        <h3 class="fw-bold text-start mb-0 ps-0"> 최근에 작성된 여행들이에요</h3><br>
    </div>
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center">

        <c:forEach var="pkg" items="${recentPackages}">
            <div class="col mb-5">
                <div class="card h-100">
                    <div class="badge bg-dark text-white position-absolute"
                         style="top: 0.5rem; right: 0.5rem">New
                    </div>
                    <img class="card-img-top" src="/upload/${pkg.getFilename()}" alt="..."/>
                    <div class="card-body p-4">
                        <div class="text-center">
                            <h5 class="fw-bolder">${pkg.getTitle()}</h5>
                        </div>
                        <div class="text-center">
                            <%
                                LocalDateTime current = LocalDateTime.now();
                                TravelPackage packageItem = (TravelPackage) pageContext.getAttribute(
                                        "pkg");
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
                            %>
                            <h6>⏰ <%= timeAgo %>
                            </h6>
                        </div>
                    </div>
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
