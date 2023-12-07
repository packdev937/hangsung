<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<script>
  // 랜덤한 텍스트와 배경 색 배열
  const randomItems = [
    {text: "HOT", bgColor: "bg-danger"},
    {text: "SALE", bgColor: "bg-primary"}
  ];

  // 랜덤한 배지를 적용하는 함수
  function applyRandomBadge(element) {
    const randomIndex = Math.floor(Math.random() * randomItems.length);
    const selectedItem = randomItems[randomIndex];

    // 선택한 랜덤 아이템의 텍스트와 배경 색을 화면에 표시
    const randomBadge = element.querySelector(".random-badge");
    randomBadge.innerText = selectedItem.text;
    randomBadge.classList.add(selectedItem.bgColor);
  }
</script>

<div class="container px-4 px-lg-5 mt-5">
    <div class="card-header bg-transparent pb-3 border-0">
        <h3 class="fw-bold text-start mb-0 ps-0">지금 인기있는 여행들이에요 </h3><br>
    </div>
    <div class="row gx-3 gx-lg-4 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach var="pkg" items="${likedPackages}">
            <div class="col mb-5">
                <div class="card h-100">
                    <div class="badge text-white position-absolute random-badge"
                         style="top: 0.5rem; right: 0.5rem"></div>
                    <img class="card-img-top" src="/upload/${pkg.getFilename()}" alt="..."
                         style="height : 200px"/>
                    <div class="card-body mb-0 pb-0">
                        <div class="text-left">
                            <h5 class="fw-bolder">${pkg.getTitle()}</h5>
                        </div>
                    </div>
                    <div class="card-footer pt-0 mt-0 border-top-0 bg-transparent">
                        <div class="row">
                            <div class="col-md-6 mr-0 d-flex flex-column align-items-start">
                                <h6 class="d-flex small text-warning mb-2">
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                    <div class="bi-star-fill"></div>
                                         ${pkg.getLikes()}
                                </h6>
                                </a>
                                <h6 class="text-secondary"
                                    style="font-size: 0.9rem;">${String.format("%,d",pkg.getPrice() - 10000)}원
                                    / ${pkg.getPeople()}명</h6>
                            </div>

                            <div class="col d-flex justify-content-end align-items-end">
                                <a class="btn btn-outline-dark mt-0 btn-sm"
                                   href="/travel/${pkg.getId()}">자세히보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                  // 각각의 카드에 대해 랜덤 배지를 적용
                  applyRandomBadge(document.querySelector('.col.mb-5:last-child'));
                </script>
            </div>
        </c:forEach>
    </div>
</div>
