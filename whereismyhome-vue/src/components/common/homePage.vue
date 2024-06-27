<script setup></script>

<template>
    <div>
        <body>
            <section class="col-xl-10 offset-xl-1 mt-6 mb-6">
                <div style="height: 100px"></div>
                <div class="container-fluid">
                    <div id="top-carousel" class="carousel slide" data-bs-ride="carousel">
                        <!-- <div class="header mb-6"> -->
                        <h4 class="fw-semibold fs-5" style="margin-left: 3rem">오늘의 뉴스</h4>
                        <!-- </div> -->
                        <div class="carousel-indicators">
                            <button
                                type="button"
                                data-bs-target="#top-carousel"
                                data-bs-slide-to="0"
                                class="active"
                                aria-current="true"
                                aria-label="Slide 1"
                            ></button>
                            <button
                                type="button"
                                data-bs-target="#top-carousel"
                                data-bs-slide-to="1"
                                aria-label="Slide 2"
                            ></button>
                            <button
                                type="button"
                                data-bs-target="#top-carousel"
                                data-bs-slide-to="2"
                                aria-label="Slide 3"
                            ></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <a href="https://www.hellot.net/news/article.html?no=87551" target="_blank">
                                    <img src="" class="d-block w-100 img-fluid" alt="조감도1" />
                                </a>
                            </div>
                            z``
                            <div class="carousel-item">
                                <a href="https://www.mk.co.kr/news/realestate/10955132" target="_blank">
                                    <img src="" class="d-block w-100 img-fluid" alt="조감도2" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a href="https://www.jayupress.com/news/articleView.html?idxno=27246" target="_blank">
                                    <img src="" class="d-block w-100 img-fluid" alt="조감도3" />
                                </a>
                            </div>
                        </div>
                        <button
                            class="carousel-control-prev"
                            type="button"
                            data-bs-target="#top-carousel"
                            data-bs-slide="prev"
                        >
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button
                            class="carousel-control-next"
                            type="button"
                            data-bs-target="#top-carousel"
                            data-bs-slide="next"
                            data-bs-interval="1000"
                        >
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </section>
            <!-- 상단 이미지 carousel end -->

            <!-- 중앙 center content start -->
            <main class="col-xl-10 offset-xl-1 mt-6 mb-6">
                <!-- 검색 기능 start -->
                <section class="text-center mt-4">
                    <p class="fs-5 fw-light">구해줘홈즈에서 주택 정보를 바로 확인하세요</p>
                    <div class="container d-flex justify-content-center">
                        <form class="d-flex col-8" method="GET" action="${root}/homeInfo/list">
                            <input type="hidden" name="pageno" value="1" />
                            <select class="form-select me-2" id="sido" name="sido" aria-label="Default select">
                                <option value="">시/도</option>
                            </select>
                            <select class="form-select me-2" id="gugun" name="gugun" aria-label="Default select">
                                <option value="">구/군</option>
                            </select>
                            <select class="form-select me-2" id="dong" name="dong" aria-label="Default select">
                                <option value="">동</option>
                            </select>
                            <select class="form-select me-2" id="year" name="year" aria-label="Default select">
                                <option value="">매매연도</option>
                            </select>
                            <select class="form-select me-2" id="month" name="month" aria-label="Default select">
                                <option value=" ">매매월</option>
                            </select>
                            <button type="submit" class="btn btn-outline-primary custom-btn-primary" id="list-btn">
                                <i class="bi bi-search"></i>
                            </button>
                        </form>
                    </div>
                </section>
                <!-- 검색 기능 end -->

                <section class="news m-5">
                    <div class="header mb-3">
                        <a class="link-dark link-underline-opacity-0 fs-5 fw-semibold" href="#">
                            오늘의 분양소식 <i class="bi bi-chevron-right"></i>
                        </a>
                    </div>

                    <div class="row d-flex justify-content-start g-3">
                        <div class="col-lg-3 col-md-6 col-sm-10">
                            <div class="card">
                                <a
                                    href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6025911&supp_cd=9035208&DetailType=Complex&SYMap=37.486358,127.013226,16&a="
                                    target="_blank"
                                >
                                    <img src="" class="card-img-top" alt="" />
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a
                                            class="link-dark link-underline-opacity-0 fw-bold"
                                            href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6025911&supp_cd=9035208&DetailType=Complex&SYMap=37.486358,127.013226,16&a="
                                        >
                                            지젤 라이프그라피 서초
                                        </a>
                                    </h5>
                                    <p class="card-text">
                                        <a class="link-primary link-underline-opacity-0"> 17억 2,201 ~ 21억 7,992 </a>
                                        <br />
                                        서울시 서초구 서초동
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-10">
                            <div class="card">
                                <a
                                    href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6027261&supp_cd=9040228&DetailType=Complex&SYMap=35.128753,129.070612,16&a="
                                    target="_blank"
                                >
                                    <a
                                        href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6027261&supp_cd=9040228&DetailType=Complex&SYMap=35.128753,129.070612,16&a="
                                        target="_blank"
                                    >
                                        <img src="" class="card-img-top" alt="" />
                                    </a>
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a
                                            class="link-dark link-underline-opacity-0 fw-bold"
                                            href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6027261&supp_cd=9040228&DetailType=Complex&SYMap=35.128753,129.070612,16&a="
                                        >
                                            해링턴마레
                                        </a>
                                    </h5>
                                    <p class="card-text">
                                        <a class="link-primary link-underline-opacity-0"> 5억 3,300 ~ 8억 3,800 </a>
                                        <br />
                                        부산시 남구 우암동
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-10">
                            <div class="card">
                                <a
                                    href="https://isale.land.naver.com/iSale/Map/?#SYDetail?build_dtl_cd=6027153&supp_cd=9039673&DetailType=Complex&SYMap=37.557933,126.840536,16&a=IA01"
                                    target="_blank"
                                >
                                    <img src="" class="card-img-top" alt="" />
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a
                                            class="link-dark link-underline-opacity-0 fw-bold"
                                            href="https://isale.land.naver.com/iSale/Map/?#SYDetail?build_dtl_cd=6027153&supp_cd=9039673&DetailType=Complex&SYMap=37.557933,126.840536,16&a=IA01"
                                        >
                                            매교역 팰루시드
                                        </a>
                                    </h5>
                                    <p class="card-text">
                                        <a class="link-primary link-underline-opacity-0"> 5억 9,100 ~ 11억 9,800 </a>
                                        <br />
                                        경기도 수원시 권선구 세류동
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-10">
                            <div class="card">
                                <a
                                    href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6027153&supp_cd=9039673&DetailType=Complex&SYMap=37.557933,126.840536,16&a="
                                    target="_blank"
                                >
                                    <img src="" class="card-img-top" alt="" />
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a
                                            class="link-dark link-underline-opacity-0 fw-bold"
                                            href="https://isale.land.naver.com/iSale/Map/#SYDetail?build_dtl_cd=6027153&supp_cd=9039673&DetailType=Complex&SYMap=37.557933,126.840536,16&a="
                                        >
                                            DH647 더 마곡테라스
                                        </a>
                                    </h5>
                                    <p class="card-text">
                                        <a class="link-primary link-underline-opacity-0"> 9억 2,680 ~ 10억 6,050 </a>
                                        <br />
                                        서울시 강서구 내발산동
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <!-- 중앙 content end -->
        </body>
    </div>
</template>

<style scoped></style>
