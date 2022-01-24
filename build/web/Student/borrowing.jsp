<%-- 
    Document   : tech
    Created on : 2020年11月28日, 下午10:48:37
    Author     : simon
--%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tech</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" >
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        
        <jsp:include page="sidebar.jsp"></jsp:include>
        <jsp:include page="../upperBar.jsp"></jsp:include>
        <!-- Content Wrapper id="content-wrapper"-->
        
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <h1 class="h3 mb-0 text-gray-800"> Reservation</h1>
                     <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Item</th>
                        <th scope="col">Type</th>
                        <th scope="col">Left</th>
                        <th scope="col">Static</th>
                        <th scope="col"></th>
                        <th scope="col" style="width: 10%;"></th>
                      </tr>
                    </thead>
                    <tbody>
<%  
ResultSet rs = (ResultSet)request.getAttribute("ResultSet");
int i = 0;
try{
        while (rs.next())
            {
               i++;
               out.print("<tr>");
               out.print("<th scope='row'>" + i + "</th>");
               out.print("<td>" + rs.getString(2) + "</td>");
               out.print("<td>" + rs.getString(3) + "</td>");
               out.print("<td>" + rs.getString(4) + "</td>");
               if(Integer.parseInt(rs.getString(4))>0)out.print("<td>Avaliable</td>");
               else out.print("<td>Unavaliable</td>");
               out.print("<td><button type='button' class='btn btn-primary picker' id='" + rs.getString(1) + "' >Pick it!</button></td>");
               out.print("<td><input class='numText' type='number' value='0' min='1' max='" + rs.getString(4) + "' disabled/></td>");
               out.print("</tr>");
             
            }
        }catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        }

%>
                    </tbody>
                  </table>
                    <button type="button" class="btn btn-primary " onclick="submit()">Submit</button>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
    <div id="load"></div>
    

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
    
    <script>
        $(document).on('click', '.cancel', function () {
                $(this).html("Pick it!");
                $(this).attr('class', 'btn btn-primary picker');
                $(this).parent().next().children().attr("disabled","disabled").val(0);
                
            });

        $(document).on('click', '.picker', function () {                
                $(this).html("X");
                $(this).attr('class', 'btn btn-danger cancel');
                $(this).parent().next().children().removeAttr('disabled').val(1);
            });
            
        function submit(){
            if(confirm("Do you comfirm?")){
                
                var html;
                var id ;
                var val;
                var count;
                
                    $("#load").load("addReversion");
                    $.each($(".cancel"), function(index,val) {
                        html = "addReversionEQ?";

                        id = $(val).attr('id');
                        count = $(val).parent().next().children().val();

                        html += "id=" + id + "&count=" + count;

                        $("#load").load(html);
                    });
                
            }
            
        }
           
        function check_cookie_name(name) //getCookie 
                {
                  var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
                  if (match) {
                    console.log(match[2]);
                    return match[2];
                  }
                  else{
                       console.log('--something went wrong---');
                       return null;
                  }
               }
    </script>

</body>

</html>