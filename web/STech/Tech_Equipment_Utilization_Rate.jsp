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

    <title>List All Equipment</title>

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
                        <h1 class="h3 mb-0 text-gray-800">List All Equipment</h1>
                        <!--
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        -->
                    </div>
                    
                    <!-- Content Row -->
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
                                            <th>Equipment Name</th>
                                            <th>Equipment Type</th>
                                            <th>Utilization Rate</th>
                                          </tr>
                                        </thead>
                                        <tbody id="userInfo_tbody">
                                           <%
                                                TechDB db = new TechDB("jdbc:mysql://localhost:3306/itp4511_project", "root", "");
                                                ResultSet count=db.queryBySQL("SELECT COUNT(*) FROM Borrow_Equipment;");
                                                double eqCount =0;
                                                while (count.next()){eqCount=count.getInt(1);}
                                                
                                                ResultSet rs=db.queryBySQL("SELECT * FROM Equipment;");
                                                while (rs.next()){
                                                    out.println("<tr>");
                                                    out.println("<td>" + rs.getString(1) + "</td>");
                                                    out.println("<td>" + rs.getString(2) + "</td>");
                                                    out.println("<td>" + rs.getString(3) + "</td>");
                                                    ResultSet countEach=db.queryBySQL("SELECT COUNT(be.Equipment_Each_ID) FROM Equipment e, Equipment_Each ee, Borrow_Equipment be WHERE be.Equipment_Each_ID=ee.Equipment_Each_ID and e.Equipment_ID=ee.Equipment_ID and e.Equipment_ID="+rs.getString(1)+";");
                                                    double eqCountEach =0;
                                                    while (countEach.next()){eqCountEach=countEach.getInt(1);}
                                                    out.println("<td>" + eqCountEach/eqCount*100 + "%</td>");
                                                    out.println("</td>");
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
                                      function edit(id){
                                        window.location.href ="handleEquipmentManangement?Action=Edit&Equipment_ID="+id;
                                      }
                                       function unavailable(id){
                                        var r=confirm("Unavailable Equipment Each ID: " + id)
                                        if (r==true){
                                          $(function () {
                                            $.ajax({
                                               type: "post",
                                               url: "handleEquipmentManangement",
                                              data:{    
                                                Equipment_Each_ID : id,
                                                Action : "Unavailable"    
                                              }, 
                                              dataType:'text',
                                              success: function (response) {
                                                    alert(response);
                                                    location.reload();
                                                    }
                                        });
                                          });
                                          }
                                        else{}
                                        }
                                        function available(id){
                                        var r=confirm("Available Equipment Each ID: " + id)
                                        if (r==true){
                                          $(function () {
                                            $.ajax({
                                               type: "post",
                                               url: "handleEquipmentManangement",
                                              data:{    
                                                Equipment_Each_ID : id,
                                                Action : "Available"    
                                              }, 
                                              dataType:'text',
                                              success: function (response) {
                                                    alert(response);
                                                    location.reload();
                                                    }
                                        });
                                          });
                                          }
                                        else{}
                                        }

                                        function deleteEquipment(id){
                                        var r=confirm("Delete Equipment Each ID: " + id+"?")
                                        if (r==true){
                                          $(function () {
                                            $.ajax({
                                               type: "post",
                                               url: "handleEquipmentManangement",
                                              data:{    
                                                Equipment_Each_ID : id,
                                                Action : "Delete"    
                                              }, 
                                              dataType:'text',
                                              success: function (response) {
                                                    alert(response);
                                                    location.reload();
                                                    }
                                        });
                                          });
                                          }
                                        else{}
                                        }
                                    $(document).ready(function(){
                                      $("#userInfo_search").on("keyup", function() {
                                        var value = $(this).val().toLowerCase();
                                        $("#userInfo_tbody tr").filter(function() {
                                          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                        });
                                      });
                                    });

                                    function getReversion_Equipment(id){
                                    $(document).ready(function () {
                                      $.ajax({
                                               type: "post",
                                               url: "../getReversion_Equipment_ByID",
                                              data:{    
                                                Reversion_ID : id,    
                                              }, 
                                              dataType:'json',
                                              success: function (response) {
                                                var c="Reversion_ID:"+response[0].reversion_id+"\n*********\n";
                                                  for (let index = 0; index < response.length; index++) {
                                                    c+="Equipment_ID:"+response[index].equipment_id+"\n";
                                                    c+="Equipment_Name:"+response[index].equipment_name+"\n";
                                                    c+="Equipment_Type:"+response[index].equipment_type+"\n";
                                                    c+="Equipment_Count:"+response[index].equipment_count+"\n*********\n";
                                                    } 
                                                    alert(c);
                                                    }
                                        });
                                    });         
                                        }
                                    </script>
</html>