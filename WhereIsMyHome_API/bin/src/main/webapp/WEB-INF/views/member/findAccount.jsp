<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--  헤더 end -->	

<script src="${root}/resource/js/login.js"></script>
<script>
    window.onload = function() {
        checkLogin();
    }

    function findMyPwd() {
      let userId = document.getElementById('userId').value;
      let userName = document.getElementById('userName').value;
      let userEmail = document.getElementById('userEmail').value;

      // 로컬스토리지에서 멤버 리스트 가져오기
      let memberListStr = localStorage.getItem("memberList");
      let memberList = JSON.parse(memberListStr);

      for(let i = 0; i < memberList.length; i++) {
        if(memberList[i].userId === userId && memberList[i].userName === userName && memberList[i].userEmail === userEmail) {
            alert("가입하신 이메일 정보로 임시 비밀번호가 전송되었습니다.");
            window.location.href = "../../index.html";
            return;
          }
      alert('일치하는 정보가 없습니다.');
      }
    }

</script>

<body> 
  <!-- 상단 navbar start -->
  <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
  <!-- 상단 navbar end -->

    
<main class="main col-xl-10 offset-xl-1" style="height: 350px">
    <div class="member-edit-title-box text-start">
        <h4 class="member-edit-title" style="">비밀번호찾기</h4>
    </div>

    <div class="member-info-box">
        <table class="member-info-table member-find-table">
            <tr>
                <th>아이디</th>
                <td><input type="text" id="userId"/> </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" id="userName"/></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" id="userEmail"/></td>
            </tr>
        </table>

        <div class="d-grid gap-2">
            <button class="btn btn-primary btn-lg mt-5 custom-btn-color" onclick="findMyPwd()" style="padding: 1rem 1rem;">비밀번호 찾기</button>
        </div>
    </div>


</main>
  <!-- 하단 footer start -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
  <!-- 하단 footer end -->

  <!-- 로그인 모달 창 start-->
  <%@ include file="/WEB-INF/views/common/loginModal.jsp" %>
  <!-- 로그인 모달 창 end -->


<script>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>