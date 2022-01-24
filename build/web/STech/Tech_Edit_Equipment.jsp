<%-- 
    Document   : tech
    Created on : 2020年11月28日, 下午10:48:37
    Author     : simon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, ict.db.*" %>
<%@ page import="ict.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit Equipment</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" >
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>    

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>


</head>

<body id="page-top">
    <jsp:useBean id="equipmentBean" class="ict.bean.EquipmentBean"  scope="request" />
    <jsp:setProperty name="equipmentBean" property="*" />
    <!-- Page Wrapper -->
    <div id="wrapper">
        
      <jsp:include page="Tech_sidebar.jsp"></jsp:include>

        <!-- Content Wrapper id="content-wrapper"-->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

              <jsp:include page="Tech_topbar.jsp"></jsp:include>
              <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->

                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Edit Equipment</h1>
                        <!--
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        -->
                    </div>

                    <!-- Content Row -->
                    <div class="row" id="New_Equipment">
                      <div class="container-fluid  py-3">
                        <div class="row">
                            <div class="col-8 mx-auto">
                                    <div class="card card-body">
                                        <h3 class="text-center mb-4">Edit Equipment</h3>
                                        <fieldset>
                                            <form id="createAgentForm" method="POST" action="handleEquipmentManangement">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col"><input type="text" class="form-control" id="Equipment_ID" name="Equipment_ID" placeholder="Equipment_ID" required="required" disabled value="<jsp:getProperty name="equipmentBean" property="equipment_ID" />">
                                                        </div>
                                                    <div class="col"><input type="text" class="form-control" id="Equipment_DateTimeOfCreation" name="Equipment_DateTimeOfCreation" placeholder="Equipment_DateTimeOfCreation" required="required" disabled value='<jsp:getProperty name="equipmentBean" property="equipment_DateTimeOfCreation" />'></div>
                                                </div>
                                                </div>
                                                <div class="form-group"> 
                                                <div class="row">
                                                    <div class="col"><input type="text" class="form-control" id="Equipment_Name" name="newEquipmentName" placeholder="Equipment Name" required="required" value='<jsp:getProperty name="equipmentBean" property="equipment_Name" />'>
                                                        </div>
                                                    <div class="col"><input type="text" class="form-control" id="Equipment_Type" name="newEquipmentType" placeholder="Equipment Type" required="required"value='<jsp:getProperty name="equipmentBean" property="equipment_Type" />'></div>
                                                </div>   
                                            </div>     	
                                            </div>
                                            
                                              <div class="checkbox">
                                                <label class="middle" style="color: red;">
                                                    **Please Fill All Text Box
                                                </label>
                                            </div>
                                            <input type="hidden" name="eid" value="<jsp:getProperty name="equipmentBean" property="equipment_ID" />">
                                            <input type="hidden" name="Action" value="handleEditEquipment">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn_login">Edit</button>
                                        </form>
                                        </fieldset>
                                    </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



        </div>
        <!-- End of Content Wrapper -->


    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <jsp:include page="Tech_logout.jsp"></jsp:include>

</body>
</html>