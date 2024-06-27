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
        <section class="noticeForm">
            <h4>공지사항 수정</h4>
            
			  <div class="container" style="text-align: left">
			    <form action="${root}/notice/modifyNotice" method="post">
			    	<input type="hidden" name="id" value="${notice.id}">
			      <div class="mb-3">
			        <label for="title" class="form-label">글 제목</label>
			        <input type="text" class="form-control" id="title" name="title" value="${notice.title}">
			      </div>
			      <div class="mb-3">
			        <label for="content" class="form-label">글 내용</label>
			        <textarea class="form-control" id="content" name="contents" rows="5" >${notice.contents}</textarea>
			      </div>
			      <button type="submit" class="btn btn-primary" style="float: right">수정 완료</button>
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
  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>