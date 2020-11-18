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
    <link href="../../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../../../../resources/bootstrap/css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../../../../resources/bootstrap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="../../../../resources/bootstrap/css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../../resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../../../../resources/bootstrap/css/_all-skins.min.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
    <script type="text/javascript">
      $(document).ready( function () {
        $('#myTable').DataTable();
      } );
    </script>    

  </head>
<body>
    <section class="content-header">
        <h1>
            Thời Khóa Biểu
            <small>Version 2.0</small>
        </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
            <li class="active">Học tập</li>
            <li class="active">Thời khóa biểu</li>            
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <!--Thoi Khoa Bieu -->
          <div class="row">
            <div class="col-md-12">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Thời Khóa Biểu</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="row">
                    <div class="col-md-12">
                        <!-- Sales Chart Canvas -->
                      <div class="box-body">
                        <div class="table-responsive">
                          <table id="table_id" class="display">
                            <thead>
                            <tr>
                          <th>STT</th>
                          <th>Ngày</th>
                          <th>Phòng</th>
                          <th>Giản đường</th>
                          <th>Mã Môn</th>
                          <th>Môn</th>
                          <th>Giảng Viên</th>
                          <th>Ca</th>
                          <th>Thời gian</th>                        
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>${bd.hk}</td>
                          <td>${sp.name}</td>
                          <td>${bd.hk}</td>
                          <td>${sp.name}</td>
                          <td>${bd.hk}</td>
                          <td>${sp.name}</td>  
                          <td>${sp.name}</td>
                          <td>${bd.hk}</td>
                          <td>${sp.name}</td>                          
                        </tr>
                      </tbody>
                    </table>
                  </div><!-- /.table-responsive -->
                </div>
                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </div><!-- ./box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
          </section>    
    <script src="../../../../resources/js/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../../../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../../../../resources/js/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../../../../resources/js/app.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="../../../../resources/js/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="../../../../resources/js/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="../../../../resources/js/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="../../../../resources/js/daterangepicker.js" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="../../../../resources/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="../../../../resources/js/icheck.min.js" type="text/javascript"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="../../../../resources/js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src=".../../../../resources/js/Chart.min.js" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="../../../../resources/js/dashboard2.js" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="../../../../resources/js/demo.js" type="text/javascript"></script>      
</body>
</html>    