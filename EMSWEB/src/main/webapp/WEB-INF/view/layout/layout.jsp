<!doctype html>
<html>

<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Snippet - BBBootstrap</title>
<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'
	rel='stylesheet'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
body {

	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-color: #B0BEC5;
	background-repeat: no-repeat
}

.card0 {
	box-shadow: 0px 4px 8px 0px #757575;
	border-radius: 0px
}

.card2 {
	margin: 0px 40px
}

.logo {
	width: 200px;
	height: 100px;
	margin-top: 20px;
	margin-left: 35px
}

.image {
	width: 360px;
	height: 280px
}

.border-line {
	border-right: 1px solid #EEEEEE
}

.facebook {
	background-color: #3b5998;
	color: #fff;
	font-size: 18px;
	padding-top: 5px;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer
}

.twitter {
	background-color: #1DA1F2;
	color: #fff;
	font-size: 18px;
	padding-top: 5px;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer
}

.linkedin {
	background-color: #2867B2;
	color: #fff;
	font-size: 18px;
	padding-top: 5px;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer
}

.line {
	height: 1px;
	width: 45%;
	background-color: #E0E0E0;
	margin-top: 10px
}

.or {
	width: 10%;
	font-weight: bold
}

.text-sm {
	font-size: 14px !important
}

::placeholder {
	color: #BDBDBD;
	opacity: 1;
	font-weight: 300
}

:-ms-input-placeholder {
	color: #BDBDBD;
	font-weight: 300
}

::-ms-input-placeholder {
	color: #BDBDBD;
	font-weight: 300
}

input, textarea {
	padding: 10px 12px 10px 12px;
	border: 1px solid lightgrey;
	border-radius: 2px;
	margin-bottom: 5px;
	margin-top: 2px;
	width: 100%;
	box-sizing: border-box;
	color: #2C3E50;
	font-size: 14px;
	letter-spacing: 1px
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #304FFE;
	outline-width: 0
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}

a {
	color: inherit;
	cursor: pointer
}

.btn-blue {
	background-color: #1A237E;
	width: 150px;
	color: #fff;
	border-radius: 2px
}

.btn-blue:hover {
	background-color: #000;
	cursor: pointer
}

.bg-blue {
	color: #fff;
	background-color: #1A237E
}

@media screen and (max-width: 991px) {
	.logo {
		margin-left: 0px
	}
	.image {
		width: 300px;
		height: 220px
	}
	.border-line {
		border-right: none
	}
	.card2 {
		border-top: 1px solid #EEEEEE !important;
		margin: 0px 15px
	}
}
</style>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript'
	src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
<script type='text/javascript'
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>
<script type='text/javascript'></script>
</head>

<body oncontextmenu='return false' class='snippet-body'>
<form action="/txt" method="POST">
	<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
		<div class="card card0 border-0">
			<div class="row d-flex">
				<div class="col-lg-6">
					<div class="card1 pb-3 px-4 py-4">
						<div class="row px-3 justify-content-center mt-4 mb-5 px-5 border-line">
							<h1 style="text-align: center">Hướng dẫn</h1>
							<br>
							<h5>
							1. Giảng viên, cán bộ quản lý ở UEH chỉ sử dụng Email EMS (@ems.edu.vn) để đăng nhập.</br>
							2. Sinh viên, học viên sử dụng tài khoản của hệ thống Online để đăng nhập:</br>
								- Vui lòng chọn role 
							hoặc có thể dùng Email UEH (@st.ueh.edu.vn) để đăng nhập.</br>
							3. Lưu ý:</br>
							- Việc đổi mật khẩu được thực hiện tại các trang Online sẽ tự động thay đổi mật khẩu toàn hệ thống</br>
							- Nếu quên mật khẩu tại trang Online, liên hệ các đơn vị quản lý đào tạo.</br>
							- Nếu quên mật khẩu email, truy cập: tại đây</br>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card2 card border-0 px-4 py-5">
						<div class="row mb-4 px-3">
							<h6 class="mb-0 mr-4 mt-2">Select Your Role:</h6>
							<div class=" text-center mr-3">
								<button type="button" class="btn btn-outline-primary">Admin</button>
							</div>		
							<div class=" text-center mr-3">
								<button type="button" class="btn btn-outline-primary">Teacher</button>
							</div>
							<div class=" text-center mr-3">
								<button type="button" class="btn btn-outline-primary">Parent</button>
							</div>		
							<div class=" text-center mr-3">
								<button type="button" class="btn btn-outline-primary">Student</button>
							</div>																									
						</div>
						<div class="row px-3">
							<label class="mb-1">
								<h6 class="mb-0 text-sm">Email Address</h6>
							</label> <input class="mb-4" type="text" name="email"
								placeholder="Enter a valid email address">
						</div>
						<div class="row px-3">
							<label class="mb-1">
								<h6 class="mb-0 text-sm">Password</h6>
							</label> <input type="password" name="password"
								placeholder="Enter password">
						</div>
						<div class="row px-3 mb-4">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input id="chk1" type="checkbox" name="chk"
									class="custom-control-input"> <label for="chk1"
									class="custom-control-label text-sm">Remember me</label>
							</div>
							<a href="#" class="ml-auto mb-0 text-sm">Forgot Password?</a>
						</div>
						<div class="row mb-3 px-3">
							
								<button type="submit" class="btn btn-blue text-center"
									>Login</button>
							
						</div>
						<div class="row mb-4 px-3">
						<div class="row mb-4 px-3">
							<h6 class="mb-0 mr-4 mt-2">Login With:</h6>
							<button type="submit" class="btn btn-outline-primary"><span
							class="fa fa-google-plus "></span> Email...</button>
						</div>
						</div>
					</div>
				</div>
			</div>
			<div class="bg-blue py-4">
				<div class="row px-3">
					<small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2019. All
						rights reserved.</small>
					<div class="social-contact ml-4 ml-sm-auto">
						<span class="fa fa-facebook mr-4 text-sm"></span> <span
							class="fa fa-google-plus mr-4 text-sm"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>

</html>