<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  헤더 start -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!--  헤더 end -->

<script src="${root}/resource/js/login.js"></script>

<script>
    window.onload = function() {

        // 다음 post api 실행
        document.getElementById('userAddress').addEventListener('click', execDaumPostcode);
    }

    function editMyInfo() {

        if(confirm("정보를 변경하시겠습니까?")) {

            let frm = document.getElementById("editMemberInfoForm");
            let frmData = new FormData(frm);
        	
            const url = '${root}/member/memberEdit';

            fetch(url, {
              method: 'POST',
              body: frmData
            })
          	.then((response) => response.json())
          	.then((data) => alert(data.msg))
            .catch(error => {
              // 오류 처리
          	  // alert(error);
            });
        } 
    }

    function mainPageLogout() {
        logout();
        window.location.href='../../index.html';
    }

</script>
<body>
	<!-- 상단 navbar start -->
	<%@ include file="/WEB-INF/views/common/topNav.jsp"%>
	<!-- 상단 navbar end -->


	<main class="main col-xl-10 offset-xl-1">
		<div class="member-edit-title-box d-flex align-items-center">
			<h3 class="member-edit-title" style="">계정정보</h3>
			<button class="btn btn-outline-danger btn-sm ms-3 mb-1"
					onclick="checkDelete();">탈퇴</button>
			<form action="${root}/member/delete" method="POST" id="deleteForm">
					<input type="hidden" name="userId" value="${memberDto.userId}">
			</form>
		</div>

		<div class="member-info-box">

			<form id="editMemberInfoForm">
				<table class="member-info-table">
					<tr>
						<th>아이디</th>
						<td><p id="userId">
								<c:out value="${memberDto.userId}"></c:out>
							</p></td>
						<input type="hidden" id="userId" name="userId"
							value="${memberDto.userId}" />
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="userEmail" name="userEmail"
							value="${memberDto.userEmail}" /></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="userName" name="userName"
							value="${memberDto.userName}" /></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="userAddress" name="userAddress"
							value="${memberDto.userAddress}" readonly /></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" id="userMobile" name="userMobile"
							value="${memberDto.userMobile}" /></td>
					</tr>
				</table>
			</form>
			<div class="d-grid gap-2">
				<button class="btn btn-primary btn-lg mt-5 custom-btn-color"
					onclick="editMyInfo()" style="padding: 1rem 1rem;">수정</button>
			</div>

		</div>


	</main>
	<!-- 하단 footer start -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- 하단 footer end -->

	<!-- 로그인 모달 창 start-->
	<%@ include file="/WEB-INF/views/common/loginModal.jsp"%>
	<!-- 로그인 모달 창 end -->



	<script>
	
		function checkDelete() {
			if(confirm("정말 탈퇴하시겠습니까?")) {
				document.querySelector("#deleteForm").submit();
			}
		}
	
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("userAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("userAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('userAddress').value = data.zonecode;
                    document.getElementById("userAddress").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("userAddress").focus();
                }
            }).open();
        }
    </script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>