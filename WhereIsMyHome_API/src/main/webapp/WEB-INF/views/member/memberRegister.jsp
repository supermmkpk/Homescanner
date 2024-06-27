<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
	
<!--  헤더 start -->	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!--  헤더 end -->


<script>
window.onload = function() {
    initControl();
}

function initControl() {
    document.getElementById('userId').addEventListener('keyup', validateUserId);
    document.getElementById('userPw').addEventListener('keyup', validateUserPw);
    document.getElementById('userPwCheck').addEventListener('keyup', validateUserPwCheck);
    document.getElementById('userEmail').addEventListener('keyup', validateUserEmail);
    document.getElementById('userName').addEventListener('keyup', validateUserName);
    document.getElementById('userMobile').addEventListener('keyup', validateUserMobile);
    
}

/**
 * 유저아이디 유효성 검사
 */
function validateUserId() {
    let pattern = /^[a-zA-Z0-9]{8,20}$/;
    let userId = document.getElementById('userId');
    let warnMsg = userId.nextElementSibling;

    if(pattern.test(userId.value) || isEmpty(userId.value)) {
        warnMsg.style.display = 'none';
    } else {
        warnMsg.style.display = 'block'; 
    }

    return(pattern.test(userId.value));
}

/**
 * 비밀번호 유효성 검사
 */
function validateUserPw() {
    let pattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()\-_=+\\|[\]{};:'",.<>?/]).{8,20}$/;
    let userPw = document.getElementById('userPw');
    let warnMsg = userPw.nextElementSibling;

    if(pattern.test(userPw.value) || isEmpty(userPw.value)) {
        warnMsg.style.display = 'none';
    } else {
        warnMsg.style.display = 'block'; 
    }

    return(pattern.test(userPw.value));
}

/**
 * 비밀번호 동일한지 유효성 검사
 */
function validateUserPwCheck() {
    let userPw = document.getElementById('userPw');
    let userPwCheck = document.getElementById('userPwCheck');
    let warnMsg = userPwCheck.nextElementSibling;

    if(userPw.value === userPwCheck.value || isEmpty(userPwCheck)) {
        warnMsg.style.display = 'none';
    } else {
        warnMsg.style.display = 'block'; 
    }
    
    return(userPw.value === userPwCheck.value);
}

/**
 * 이메일 유효성 검사
 */
function validateUserEmail() {
    let pattern = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    let userEmail = document.getElementById('userEmail');
    let warnMsg = userEmail.nextElementSibling;

    if(pattern.test(userEmail.value) || isEmpty(userEmail.value)) {
        warnMsg.style.display = 'none';
    } else {
        warnMsg.style.display = 'block'; 
    }

    return(pattern.test(userEmail.value));
}

/**
 * 이름 유효성 검사
 */
function validateUserName() {
    let pattern = /^[가-힣]{2,20}$/;
    let userName = document.getElementById('userName');
    let warnMsg = userName.nextElementSibling;

    if(pattern.test(userName.value) || isEmpty(userName.value)) {
        warnMsg.style.display = 'none';
    } else {
        warnMsg.style.display = 'block'; 
    }

    return(pattern.test(userName.value));
}

/**
 * 핸드폰번호 유효성 검사
 */
function validateUserMobile() {
    let pattern = /^01(0|1|[6-9])[0-9]{3,4}[0-9]{4}$/;
    let userMobile = document.getElementById('userMobile');
    let warnMsg = userMobile.nextElementSibling;

    if(pattern.test(userMobile.value) || isEmpty(userMobile.value)) {
        warnMsg.style.display = 'none';
    } else {
        warnMsg.style.display = 'block'; 
    }

    return(pattern.test(userMobile.value));
}

/**
 * 회원가입
 */
function memberRegister() {
    
    let frm = document.getElementById("signupForm");
    let frmData = new FormData(frm);

    // 폼요소
    let userId = frmData.get("userId");
    let userPw = frmData.get("userPw");
    let userPwCheck = frmData.get("userPwCheck");
    let userEmail = frmData.get("userEmail");
    let userName = frmData.get("userName");
    let userAddress = frmData.get("userAddress");
    let userMobile = frmData.get("userMobile");

    // 유효성 검사
    if(isEmpty(userId.trim()) || !validateUserId()) {
        alert("아이디를 확인해주세요");
        frm.elements["userId"].focus();
        return;
    }

    if(isEmpty(userPw.trim()) || !validateUserPw()) {
        alert("비밀번호를 확인해주세요");
        frm.elements["userPw"].focus();
        return;
    }

    if(isEmpty(userPwCheck.trim()) || !validateUserPwCheck()) {
        alert("비밀번호가 동일한지 확인해주세요");
        frm.elements["userPwCheck"].focus();
        return;
    }

    if(isEmpty(userEmail.trim()) || !validateUserEmail()) {
        alert("이메일을 확인해주세요");
        frm.elements["userEmail"].focus();
        return;
    }

    if(isEmpty(userName.trim()) || !validateUserName()) {
        alert("이름을 확인해주세요");
        frm.elements["userName"].focus();
        return;
    }

    if(isEmpty(userAddress.trim())) {
        alert("주소를 확인해주세요");
        frm.elements["userAddress"].focus();
        return;
    }

    if(isEmpty(userMobile.trim()) || !validateUserMobile()) {
        alert("핸드폰 번호를 확인해주세요");
        frm.elements["userMobile"].focus();
        return;
    }


    const url = '${root}/member/regist';

    fetch(url, {
      method: 'POST',
      body: frmData
    })
  	.then((response) => response.json())
  	.then((data) => alert(data.msg))
    .catch(error => {
      // 오류 처리
  	  alert(error);
    });

    window.location.href = "${root}/";
}

function isEmpty(value) {
    if(value === '' || value === null  || value === undefined) return true;
    return false;
}

</script>
<script type="text/javascript" src="${root}/resource/js/login.js"></script>
<body> 
  <!-- 상단 navbar start -->
  <%@ include file="/WEB-INF/views/common/topNav.jsp" %>
  <!-- 상단 navbar end -->

    
    <main class="main">
        <section class="signup">
            <h4>회원가입</h4>
            <aside>구해줘 홈즈 이용을 위해서 회원가입을 해주세요</aside>
            
            <div class="signup_main">
                <form class="signup_form" id="signupForm">

                    <div class="form_input_block">
                        <label for="userId" class="form_label">아이디</label>
                        <input class="form-control" type="text" id="userId" name="userId" placeholder="" autocomplete="off">
                        <span class="form_error">아이디는 알파벳과 숫자로 이루어진 8자에서 20자입니다.</span>
                    </div>

                    <div class="form_input_block">
                        <label for="userPw" class="form_label">비밀번호</label>
                        <input class="form-control" type="password" id="userPw" name="userPw" placeholder="">
                        <span class="form_error">비밀번호는 알파벳, 숫자, 특수문자로 이루어진 8자에서 20자입니다.</span>
                    </div>

                    <div class="form_input_block">
                        <label for="userPwCheck" class="form_label">비밀번호 확인</label>
                        <input class="form-control" type="password" id="userPwCheck" name="userPwCheck" placeholder="">
                        <span class="form_error">비밀번호가 동일하지 않습니다.</span>
                    </div>

                    <div class="form_input_block">
                        <label for="userEmail" class="form_label">이메일</label>
                        <input class="form-control" type="text" id="userEmail" name="userEmail" placeholder="example@homes.com" autocomplete="off">
                        <span class="form_error">이메일 형식이 올바르지 않습니다.</span>
                    </div>

                    <div class="form_input_block">
                        <label for="userName" class="form_label">이름</label>
                        <input class="form-control" type="text" id="userName" name="userName" placeholder="" autocomplete="off">
                        <span class="form_error">이름이 올바르지 않습니다.</span>
                    </div>

                    <div class="form_input_block">
                        <label for="userAddress" class="form_label">주소</label>
                        <input class="form-control" type="text" id="userAddress" name="userAddress" style="background-color: #fff" readonly onclick="execDaumPostcode()">
                        <span class="form_error">주소가 올바르지 않습니다.</span>
                    </div>

                    <div class="form_input_block">
                        <label for="userMobile" class="form_label">핸드폰 번호</label>
                        <input class="form-control" type="text" id="userMobile" name="userMobile" placeholder="01012341234" autocomplete="off">
                        <span class="form_error">번호가 올바르지 않습니다.</span>
                    </div>

                    <button type="button" class="btn btn-primary btn-lg mt-3 custom_input_btn" onclick="memberRegister()" style="padding: 1rem 1rem;">회원가입</button>


                </form>
            </div>

        </section>

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