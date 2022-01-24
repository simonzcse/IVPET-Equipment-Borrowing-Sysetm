<%-- 
    Document   : tech
    Created on : 2020年11月28日, 下午10:48:37
    Author     : simon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet, ict.bean.*, java.util.ArrayList,  ict.db.*" %>

<jsp:useBean id="borrowBeans" class="ict.bean.BorrowBeans"  scope="session" />
<jsp:useBean id="borrow" class="ict.bean.BorrowBean"  scope="request" />

<jsp:setProperty name="borrow" property="*" />
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

                    <!-- Content Row -->
                    <div class="row" >
                      <div class="container-fluid  py-3">
                        <div class="row">
                            <div class="col-8 mx-auto">
                                    <div class="card card-body">
                                        <h3 class="text-center mb-4">Equipment</h3>
                                        <p>The Borrow Each information are as follows:</p>
                                            <p>
                                                reversionID : <jsp:getProperty name="borrow" property="reversionID" /> <br/>
                                                equipmentEachID : <jsp:getProperty name="borrow" property="equipmentEachID" /> <br/>
                                            </p>
                                            <label for="start">Expiration Date:</label>
                                            <form>
                                            <input type="date" name="ExpirationDate" id="xyz" value="2021-12-01"/><br>
                                            </form>
                                            <button type="button" class="btn btn-secondary btn-lg" onclick="goBack()">Add More</button><br>
                                            <button type="button" class="btn btn-primary btn-lg" onclick="startBorrow()">Finish and Start Borrow</button>
                                            <script>function goBack() {window.history.back();}</script>
                                            <script>function startBorrow() {
                                              var expirationDate = document.getElementById("xyz").value;
                                              window.location.href="handleReversion?Action=HandleEquipmentBorrow&ExpirationDate="+expirationDate;
                                            }</script>
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
                                            <th>Equipment Each ID</th>
                                          </tr>
                                        </thead>
                                        <tbody id="userInfo_tbody">
                                           <%   try{
                                                    if(borrowBeans.getBorrowBeans().get(0).getReversionID()!=borrow.getReversionID()){borrowBeans.setBorrowBeans(new ArrayList<BorrowBean>());}}
                                                catch(Exception ex){}
                                           boolean isExist=false;
                                           for (BorrowBean b: borrowBeans.getBorrowBeans()) {
                                            if(b.getEquipmentEachID()==borrow.getEquipmentEachID()){isExist=true;}
                                           }
                                           if(!isExist){borrowBeans.add(borrow);}
                                                for (BorrowBean b: borrowBeans.getBorrowBeans()) {
                                                out.println("<tr>");
                                                out.println("<td>" + b.getEquipmentEachID() + "</td>");
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
                                        window.location.href ="handleReversion?Action=BorrowSelectEach&Reversion_ID="+reversionID+"&Equipment_Each_ID="+equipmentEachID;
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