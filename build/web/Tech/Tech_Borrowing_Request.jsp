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

    <title>Borrowing Request</title>

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
                        <h1 class="h3 mb-0 text-gray-800">Borrowing Request</h1>
                        <!--
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        -->
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row">

                        <div class="alert alert-light" role="alert">
                            <table>
                              <tr>
                                <td><button type='button' class='btn btn-primary'><i class='far fa-eye'></i></button></td>
                                <td>View Borrowing Request Details</td>
                              </tr>
                              <tr>
                                <td><button type='button' class='btn btn-danger' ><i class="fas fa-times    "></i></button></td>
                                <td>Reject Request</td>
                              </tr>
                              <tr>
                                <td><button type='button' class='btn btn-success' ><i class="fas fa-check"></i></button></td>
                                <td>Approve Request</td>
                              </tr>
                            </table>  
                          </div>
                                    <div class="table-responsive">
                                      <!-- Search form -->
                                      <div class="md-form mt-0">
                                        <input class="form-control" type="text" placeholder="Search" aria-label="Search" id="userInfo_search">
                                      </div>
                                      <table class="table table-striped table-m">
                                        <thead>
                                          <tr>
                                            <th>Reversion ID</th>
                                            <th>Student ID</th>
                                            <th>Student Name</th>
                                            <th>Date Time Of Creation</th>
                                            <th>Action</th>
                                          </tr>
                                        </thead>
                                        <tbody id="userInfo_tbody">
                                           <%
                                            ArrayList<ReversionBean> reversionBeans = (ArrayList<ReversionBean>)request.getAttribute("reversionBeans");
                                            for (ReversionBean b :reversionBeans) {
                                                out.println("<tr>");
                                                out.println("<td>" + b.getReversionId() + "</td>");
                                                out.println("<td>" + b.getStudentName() + "</td>");
                                                out.println("<td>" + b.getStudentID() + "</td>");
                                                out.println("<td>" + b.getCreationDateTime() + "</td>");
                                                out.println("<td><button type='button' class='btn btn-primary'  onclick='getReversion_Equipment("+b.getReversionId()+")'><i class='far fa-eye'></i></button>");
                                                out.println("<button type='button' class='btn btn-danger'  onclick='reject_Request("+b.getReversionId()+")'><i class='fas fa-times'></i></button>");
                                                out.println("<button type='button' class='btn btn-success'  onclick='approve_Request("+b.getReversionId()+")'><i class='fas fa-check'></i></button></td>");
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
                                       function reject_Request(id){
                                        var r=confirm("Are you sure Reject Borrowing Request Reversion ID: " + id+"?")
                                        if (r==true){
                                          $(function () {
                                            $.ajax({
                                               type: "post",
                                               url: "handleReversion",
                                              data:{    
                                                Reversion_ID : id,
                                                Action : "Reject"    
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
                                        function approve_Request(id){
                                        var r=confirm("Approve Borrowing Request Reversion ID: " + id+"?")
                                        if (r==true){
                                          $(document).ready(function () {
                                            $(function () {
                                            $.ajax({
                                               type: "post",
                                               url: "handleReversion",
                                              data:{    
                                                Reversion_ID : id,
                                                Action : "Approve"    
                                              }, 
                                              dataType:'text',
                                              success: function (response) {
                                                    alert(response);
                                                    location.reload();
                                                    }
                                        });
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