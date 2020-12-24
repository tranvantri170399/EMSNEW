<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="../../../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../../../../../resources/bootstrap/css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../../../../../resources/bootstrap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="../../../../../resources/bootstrap/css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../../../resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../../../../../resources/bootstrap/css/_all-skins.min.css" rel="stylesheet" type="text/css" />

  </head>
<body >
    <section class="content-header">
        <h1>
            THÔNG TIN
        </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
            <li class="active">Thông Tin Người Dùng</li>                     
          </ol>        
    </section>

        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <!--Thoi Khoa Bieu -->
          <c:forEach var="sp" items="${List}">
          <div class="row">
            <div class="col-md-12">
              <div class="box box-primary">
                <img src="../../../../../resources/FileUpload/${sp.image}" name="" style="background: blue;width: 150px;height: 200px;">
              <form:form role="form">
             	 
                <div class="box-body">
                  <div class="form-group">
                    <input type="hidden" id="custId" name="custId" value="3487">
                  </div>                                   
                  <div class="form-group">
                    <label for="exampleInputName">Họ và Tên</label>
                    <div class="input-group">
                      <span class="input-group-addon">Họ</span> 
                      <input type="text" class="form-control" id="InputLastname" name="" value="${sp.lname}" readonly/>
                      <span class="input-group-addon">Tên</span> 
                      <input type="text" class="form-control"  id="InputFirstname" name="" value="${sp.fname}" readonly/>            
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="InputDob">Ngày sinh</label>
                    <input type="date" class="form-control" id="InputDob" min="1980-1-1" max="2020-12-31" name="" value="${sp.dob}" readonly/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail">Email</label>
                    <input type="text" class="form-control" id="InputEmail" name="" value="${sp.email}" readonly/>
                  </div>        
                  <div class="form-group">
                    <label for="InputPhone">Số Điện Thoại</label>
                    <input type="text" class="form-control" id="InputPhone" name="" value="${sp.phone}" readonly/>
                  </div>      
                  <div class="form-group">
                    <label for="InputPhone">Địa chỉ</label>
                    <input type="text" class="form-control" id="InputAddress" name="" value="${sp.address}" readonly/>
                  </div>                                               
                  <div class="form-group">
                    <label for="InputPhone">Trạng thái:</label>
                    <label  id="InputStatus">${sp.status}</label>
                  </div>   
                  <div class="form-group">
                    <label for="InputID">Cấp độ:</label>
                    <input name="id" class="form-control" value="${sp.level}" readonly/>
                   </div>
                  <div class="form-group">
                    <label for="InputID">Lương</label>
                    <input name="id" class="form-control" value="${sp.salary}" readonly/>
                  </div>  
                  <div class="form-group">
                    <label for="InputID">Phòng Ban: ${sp.depart.name}</label>
                    <%-- <select name="depart" items="${departList}" /> --%>
                  </div>  
                  <div class="form-group">
                    <label for="InputID">Chức vụ:  ${sp.role.roleName}</label>
                    <%-- <form:select name="role" items="${roleList}" /> --%>
                  </div>

                </div>
                
              </form:form>
            </div><!-- /.col -->
          </div><!-- /.row -->
          </div>
          </c:forEach>
          </section>    
    <script src="../../../../../resources/js/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../../../../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../../../../../resources/js/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../../../../../resources/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="../../../../../resources/js/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="../../../../../resources/js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../../../../resources/js/demo.js" type="text/javascript"></script>        
</body>
</html>    