let ctxPath = document.querySelector('meta[name="ctxPath"]').getAttribute('content');
/**
 * 로그인
 */
function doLogin() {
    let frm = document.getElementById("loginForm");
    let frmData = new FormData(frm);

    // 폼요소
    let userId = frmData.get("userId");
    let userPw = frmData.get("userPw"); 
    
	
    const url = ctxPath+'/member/login';
    fetch(url, {
		method: 'POST',
		body : frmData
	})
	
	.then((response) => {
		if(response.ok) {
			//return response.text();
			window.location.reload();
			return;
		} else {
			return response.text();
		}
	})
  	.then((data) => {
		  
		  if(!data.ok) {
			  alert(data);
		  }
	  })
	
	.catch((error)=> {
		//alert(error)
	})
	
	//
}
