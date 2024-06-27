window.onload = function() {
    checkLogin();
}


/**
 * 로그인
 */
function doLogin() {
    let frm = document.getElementById("loginForm");
    let frmData = new FormData(frm);

    // 폼요소
    let userId = frmData.get("userId");
    let userPw = frmData.get("userPw");

    // 로컬스토리지에서 멤버 리스트 가져오기
    let memberListStr = localStorage.getItem("memberList");
    let memberList = JSON.parse(memberListStr);
    
    console.log(memberList);
    if(memberList !== null) {
        for(let i = 0; i < memberList.length; i++) {
            // 정상적으로 로그인된 경우
            if(memberList[i].userId === userId && memberList[i].userPw === userPw) {
                sessionStorage.setItem('userId', memberList[i].userId);
                sessionStorage.setItem('userName', memberList[i].userName);
                
                window.location.href = "../../index.html";
                return;
            }

            // 비밀번호가 틀린 경우
            else if(memberList[i].userId === userId && memberList[i].userPw !== userPw) {
                alert("비밀번호가 틀렸습니다");
            }
        }
    }
    alert("가입되어 있지 않은 계정입니다");
}

/**
 * 로그인이 되어있는지 확인
 */
function checkLogin() {
    let userId = sessionStorage.getItem('userId');
    let userName = sessionStorage.getItem('userName');

    // 로그인 상태
    if(userId !== null) {
        let loginStatus = document.getElementById('header_nav_confirm_on');
        let logoutStatus = document.getElementById('header_nav_confirm_off');
        
        loginStatus.classList.remove('d-none');
        logoutStatus.classList.add('d-none');

        if(userId === 'admin') {
            let adminNav = document.getElementById('adminNav');
            adminNav.classList.remove('d-none');        
        }

    }

    // 비로그인 상태
    if(userId === null) {
        let loginStatus = document.getElementById('header_nav_confirm_on');
        let logoutStatus = document.getElementById('header_nav_confirm_off');
        
        loginStatus.classList.add('d-none');
        logoutStatus.classList.remove('d-none');
    }
}

/**
 * 로그아웃
 */
function logout() {
    sessionStorage.removeItem('userId');
    sessionStorage.removeItem('userPw');

    let adminNav = document.getElementById('adminNav');
    adminNav.classList.add('d-none');
    
    window.location.reload();
}