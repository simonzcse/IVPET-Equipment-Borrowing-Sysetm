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

    <title>Add Equipment</title>

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
                        <h1 class="h3 mb-0 text-gray-800">Add Equipment</h1>
                        <!--
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        -->
                    </div>
                    <div class="row">
                      <div class="container-fluid  py-3">
                        <div class="row">
                            <div class="col-8 mx-auto">
                              <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-primary">
                                  <input type="radio" name="options" id="option1" checked> New Equipment
                                </label>
                                <label class="btn btn-primary">
                                  <input type="radio" name="options" id="option2"> Add Equipment with exist Type
                                </label>
                              </div>
                      </div>
                        </div>
                        </div>
                    </div>
                    <!-- Content Row -->
                    <div class="row" id="New_Equipment" >
                      <div class="container-fluid  py-3">
                        <div class="row">
                            <div class="col-8 mx-auto">
                                    <div class="card card-body">
                                        <h3 class="text-center mb-4">New Equipment</h3>
                                        <fieldset>
                                            <form id="createAgentForm" method="POST" action="handleEquipmentManangement">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col"><input type="text" class="form-control" id="Equipment_Name" name="Equipment_Name" placeholder="Equipment Name" required="required">
                                                        </div>
                                                    <div class="col"><input type="text" class="form-control" id="Equipment_Type" name="Equipment_Type" placeholder="Equipment Type" required="required"></div>
                                                </div>        	
                                            </div>
                                            
                                              <div class="checkbox">
                                                <label class="middle" style="color: red;">
                                                    **Please Fill All Text Box
                                                </label>
                                            </div>
                                            <input type="hidden" name="Action" value="handleNewEquipment">
                                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn_login">Create</button>
                                        </form>
                                        </fieldset>
                                    </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

                <div class="row" id="Esist_Equipment" hidden>
                    <div class="container-fluid  py-3">
                      <div class="row">
                          <div class="col-8 mx-auto">
                                  <div class="card card-body">
                                    <h3 class="text-center mb-4">Add Equipment with exist Type</h3>
                    <table class="table table-striped" >
                   <thead>
                     <tr>
                       <th scope="col">ID</th>
                       <th scope="col">Item Name</th>
                       <th scope="col">Type</th>
                       <th scope="col">Count</th>
                       <th scope="col">Action</th>
                     </tr>
                   </thead>
                   <tbody>
                    <%
                    ArrayList<EquipmentBean> equipmentBeans = (ArrayList<EquipmentBean>)request.getAttribute("equipmentBeans");
                        for (EquipmentBean b :equipmentBeans) {
                        out.print("<tr >");
                        out.print("<td>"+b.getEquipment_ID()+"</td>");
                        out.print("<td>"+b.getEquipment_Name()+"</td>");
                        out.print("<td>"+b.getEquipment_Type()+"</td>");
                        out.print("<td><input class='numText' type='number' value='0' min='1' id='count_"+b.getEquipment_ID()+"'/></td>");
                        out.print("<td><button type=\"button\" class=\"btn btn-primary \" onclick='submit("+b.getEquipment_ID()+")'>Add</button></td>");
                        out.print("</tr>");
                    }
                    %>
                   </tbody>
                 </table>
                </div>
            </div>
        </div>
    </div>
               </div>

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; IVPET 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

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


    <script>
        $(document).ready(function () {
            $("#option2").click(function (e) { 
                e.preventDefault();
                $("#New_Equipment").attr("hidden",true);
                $("#Esist_Equipment").removeAttr("hidden");
            });
            $("#option1").click(function (e) { 
                e.preventDefault();
                $("#Esist_Equipment").attr("hidden",true);
                $("#New_Equipment").removeAttr("hidden");
            });
        });
        function submit(id){
        var count = document.getElementById("count_"+id).value;
        if(count<1){alert("Count can not=0")}
        else{var r=confirm("Add Equipment ID: " + id+"\nCount: "+count)
            if (r==true){
             $(function () {
              $.ajax({
              type: "post",
                                               url: "handleEquipmentManangement",
                                              data:{    
                                                Equipment_ID : id,
                                                Count : count,
                                                Action : "handleNewExistEquipment"    
                                              }, 
                                              dataType:'text',
                                              success: function (response) {
                                                    alert(response);
                                                    window.location.href = "handleEquipmentManangement?Action=List";
                                                    }
                                        });
                                          });
                                          }
                                        else{}
                                        }  }
        
    </script>


</body>
</html>