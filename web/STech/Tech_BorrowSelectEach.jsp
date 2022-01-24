<%-- 
    Document   : tech
    Created on : 2020年11月28日, 下午10:48:37
    Author     : simon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, ict.bean.*, java.util.ArrayList,  ict.db.*" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Borrow</title>

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
                        <h1 class="h3 mb-0 text-gray-800">Borrow</h1>
                        <!--
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        -->
                    </div>
                    <%
                    ArrayList<ReversionEquipmentBean> reversionEquipmentBeans = (ArrayList<ReversionEquipmentBean>)request.getAttribute("reversionEquipmentBeans");
                    ArrayList<EquipmentListBean> equipmentListBeans = (ArrayList<EquipmentListBean>)request.getAttribute("equipmentListBeans");

                    %>
                    <!-- Content Row -->
                    <div class="row" >
                      <div class="container-fluid  py-3">
                        <div class="row">
                            <div class="col-8 mx-auto">
                                    <div class="card card-body">
                                        <h3 class="text-center mb-4">Equipment</h3>
                                        <%
                                        for (ReversionEquipmentBean b :reversionEquipmentBeans) {
                                        out.println("<h3 class=\"text-center mb-4\">ID:"+b.getEquipment_ID()+" Count:"+b.getEquipment_Count()+"</h3>");
                                        }
                                        %>
                                        
                                        </div>
                                        </div>
                                        </div>
                      </div>
                      </div>

                    <div class="row">

                                    <div class="table-responsive">
                                      <!-- Search form -->
                                      <div class="md-form mt-0">
                                        <input class="form-control" type="text" placeholder="Search" aria-label="Search" id="userInfo_search">
                                      </div>
                                      <table class="table table-striped table-m">
                                        <thead>
                                          <tr>
                                            <th>Equipment ID</th>
                                            <th>Equipment Each ID</th>
                                            <th>Action</th>
                                          </tr>
                                        </thead>
                                        <tbody id="userInfo_tbody">
                                           <%
                                           for (EquipmentListBean b :equipmentListBeans) {
                                            out.println("<tr>");
                                              out.println("<td>" + b.getEquipment_ID() + "</td>");
                                              out.println("<td>" + b.getEquipment_Each_ID() + "</td>");
                                              out.println("<td><button type='button' class='btn btn-primary' onclick='add("+reversionEquipmentBeans.get(0).getReversion_ID()+", "+b.getEquipment_Each_ID()+")'>Add to List</button>");
                                              out.println("</tr>"); 
                                            }
                                        %>
                                      </tbody>
                                      </table>
                                    </div>

                    </div>
                </div>
                <!-- /.container-fluid -->

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



</body>
                                    <script>
                                        function add(reversionID, equipmentEachID){
                                        window.location.href ="Tech_BorrowList.jsp?reversionID="+reversionID+"&equipmentEachID="+equipmentEachID;
                                      }
                                    $(document).ready(function(){
                                      $("#userInfo_search").on("keyup", function() {
                                        var value = $(this).val().toLowerCase();
                                        $("#userInfo_tbody tr").filter(function() {
                                          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                        });
                                      });
                                    });


                                    </script>
</html>