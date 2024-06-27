<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link href="<%= application.getAttribute("root") %>/assets/css/app.css" rel="stylesheet" />
<title>SSAFYboard : 글목록</title>
</head>
<body>

  <div class="container">
	<div class="row justify-content-center">
      	<div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">글 목록</mark>
          </h2>
       	</div>
		<div class="card text-center bg-light">
            <div class="card-body">
            
              <p class="card-text fs-4 fw-semibold">
                등록된 글이 없습니다. <br>
              </p>
              <button type="button" id="btn-register" class="btn btn-secondary mt-2">
                글 등록
              </button>
              <br>
              <button type="button" id="btn-home" class="btn btn-secondary mt-2">
                홈
              </button>
            </div>
       </div>
	</div>
  </div>


	<script
	      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	      crossorigin="anonymous"
	></script>
	<script>
	 document.querySelector("#btn-register").addEventListener("click", function () {
		    location.href = "<%= application.getAttribute("root") %>/article?action=mvwrite";
	  });
	  document.querySelector("#btn-home").addEventListener("click", function () {
	      location.href = "<%= application.getAttribute("root") %>/";
	  });
	</script>

</body>
</html>