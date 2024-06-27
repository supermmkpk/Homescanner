<script setup></script>

<template>
    <footer>
        <div class="navbar navbar-expand-sm bg-dark container-fluid navbar-dark">
            <div class="row ms-5 me-5 w-100">
                <div class="navbar-nav mt-5 mb-5">
                    <li class="nav-item col-3">
                        <span class="nav-link active">구해줘홈즈</span>
                        <!-- 소개 modal trigger -->
                        <a
                            class="nav-link text-decoration-underline"
                            data-bs-toggle="modal"
                            data-bs-target="#explainModal"
                        >
                            구해줘홈즈 소개
                        </a>
                    </li>
                    <li class="nav-item col-3">
                        <span class="nav-link active">개인정보처리방침</span>
                    </li>
                    <li class="nav-item col-3">
                        <span class="nav-link active">이용약관</span>
                    </li>
                </div>
                <hr style="color: lightgray" />
                <ul class="navbar-nav mt-3 mb-2">
                    <li class="nav-item">
                        <span class="nav-link" style="font-size: 0.9rem"
                            >&copy;SSAFY11 광주5반_박봉균_박범수. ALL RIGHTS RESERVED</span
                        >
                    </li>
                </ul>
            </div>
            <!-- 소개 Modal start -->
            <div
                class="modal fade"
                id="explainModal"
                tabindex="-1"
                aria-labelledby="explainModalLabel"
                aria-hidden="true"
            >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5 fw-semibold" id="exampleModalLabel">
                                Homescanner 소개
                            </h1>
                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                            ></button>
                        </div>
                        <div class="modal-body">
                            <p class="fs-6">
                                원하는 주택 정보(동 별, 아파트 이름 별 / 아파트 매매, 아파트 전월세
                                등) 및 주변 정보를 얻을 수 있는 웹사이트입니다.
                                <br /><br />
                                [ SpringBoot, Vue3, 알고리즘 적용 FINAL 관통 프로젝트입니다. ]
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 소개 Modal end -->
        </div>
    </footer>
</template>

<style scoped></style>
