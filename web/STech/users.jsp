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
    
    <div class="modal fade" id="new" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content" style='background-color:transparent; border: none;'>
        <button type="button" class="close" data-dismiss="modal" style="color: rgb(255, 255, 255);">&times;</button>
      <div class="modal-body">
        <div class="card card-body">
          <h3 class="text-center mb-4">Please enter the information:</h3>
          <fieldset>
              <form id="createAgentForm" method="POST" onsubmit="alert('success!')">
              
               <div class="form-group">
                      Name:<div class="input-lg "><input type="text" id="newName" class="form-control" name="Name" required="required" ></div>
   
              </div>  
                  
              <div class="form-group">
                     Email:<input class="form-control input-lg" id="newEmail" name="Address" type="text" required="required" >
              </div>
              
              <div class="form-group">
                     Password:<input class="form-control input-lg" id="newPassword" name="Address" type="text" required="required" >
              </div>
                  
                  
                  <div class="form-group">
                Role:<select class="form-control" id="newRole">
                  <option value="1">Student</option >
                  <option value="2">Technician</option>
                  <option value="3" >Senior Technician</option>
                </select>
              </div>
            
            
              <button class="btn btn-primary btn-lg btn-block" id="addUser" data-dismiss="modal">Confirm!</button>
          </form>
          </fieldset>
      </div>
      </div>
    </div>
    
  </div>
</div>


<body id="page-top">
    
    <div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content" style='background-color:transparent; border: none;'>
        <button type="button" class="close" data-dismiss="modal" style="color: rgb(255, 255, 255);">&times;</button>
      <div class="modal-body">
        <div class="card card-body">
          <h3 class="text-center mb-4">Change the information:</h3>
          <fieldset>
              <form id="createAgentForm" method="POST" onsubmit="alert('success!')">
              
              <div class="form-group">
                      ID:<div class="input-lg "><input type="text" id="editId" class="form-control" name="Name" placeholder="Name" required="required" disabled></div>
   
              </div>  
              
              
               <div class="form-group">
                      Name:<div class="input-lg "><input type="text" id="editName" class="form-control" name="Name" placeholder="Name" required="required"></div>
   
              </div>  
                  
              <div class="form-group">
                     Email:<input class="form-control input-lg" id="editEmail" placeholder="Address" name="Address" type="text" required="required">
              </div>
              
              <div class="form-group">
                     Password:<input class="form-control input-lg" id="editPassword" placeholder="Address" name="Address" type="text" required="required" value="197-213 Queen's Road East, Wan Chai. Main Area. Hong Kong">
              </div>
                  
                  
                  <div class="form-group">
                Role:<select class="form-control" id="editRole">
                  <option value="1">Student</option >
                  <option value="2">Technician</option>
                  <option value="3" >Senior Technician</option>
                </select>
              </div>
            
            
              <button class="btn btn-primary btn-lg btn-block" id="update" data-dismiss="modal">Update</button>
          </form>
          </fieldset>
      </div>
      </div>
    </div>
    
  </div>
</div>
    <!-- Page Wrapper -->
    <div id="wrapper">
        
        <jsp:include page="Tech_sidebar.jsp"></jsp:include>
        <jsp:include page="../upperBar.jsp"></jsp:include>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
<button type='button' data-toggle="modal" data-target="#new" class='btn btn-primary edit'>Add new</button>
                     <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Account ID</th>
                        <th scope="col">Account Name</th>
                        <th scope="col">Account Email</th>
                        <th scope="col">Account Password</th>
                        <th scope="col">Account DateTimeOfCreation</th>
                        <th scope="col">Account Role</th>
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
               out.print("<td>" + rs.getString(1) + "</td>");
               out.print("<td>" + rs.getString(2) + "</td>");
               out.print("<td>" + rs.getString(3) + "</td>");
               out.print("<td>" + rs.getString(4) + "</td>");
               out.print("<td>" + rs.getString(5) + "</td>");
               out.print("<td>" + rs.getString(6) + "</td>");
               out.print("<td><button type='button' data-toggle=\"modal\" data-target=\"#myModal\" class='btn btn-primary edit' id='" + rs.getString(1) + "' >Edit</button><button type='button' class='btn btn-danger delect' id='" + rs.getString(1) + "' >X</button></td>");
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
    </script>
<div id="load"></div>
</body>
<script>
var targetID;
var targetName;
var targetEmail;
var targetPassword;
var targetRole;
    $(document).on('click', '.edit', function () {
            targetID = $(this).parent().prev().prev().prev().prev().prev().prev().html();
            targetName = $(this).parent().prev().prev().prev().prev().prev().html();
            targetEmail = $(this).parent().prev().prev().prev().prev().html();
            targetPassword = $(this).parent().prev().prev().prev().html();
            targetRole = $(this).parent().prev().html();
            
            $("#editId").val(targetID);
            $("#editName").val(targetName);
            $("#editEmail").val(targetEmail);
            $("#editPassword").val(targetPassword);
            
            switch(targetRole){
                case 'Student':

                    $("#editRole").val("1");
                    break;
                case 'Technician':
                    $("#editRole").val("2");
                    break;
                case 'Senior Technician':
                    $("#editRole").val("3");
                    break;
                
            }
            
            });

        $(document).on('click', '.delect', function () {        
            var id = $(this).attr('id');
            if(confirm("Do you comfirm? Student id:" + id)){
                
                
                $("#load").load("delect?id=" + id);
                location.reload();
            
            }
            });
            
        $(document).on('click', '#addUser', function () {     
            var name = $("#newName").val();
            var email = $("#newEmail").val();
            var password = $("#newPassword").val();
            var role = $("#newRole :selected").text();
            
            if(confirm("Do you comfirm?")){
                $("#load").load(encodeURI("addUser?name=" + name + "&email=" + email + "&password=" + password + "&role=" + role));
                location.reload();
            
            }
            });
            
        $(document).on('click', '#update', function () {        
            var id = $("#editId").val();
            var name = $("#editName").val();
            var email = $("#editEmail").val();
            var password = $("#editPassword").val();
            
            
            
            var role = $("#editRole :selected").text();
            if(confirm("Do you comfirm?")){
                $("#load").load(encodeURI("updateInfo?id=" + id + "&name=" + name + "&email=" + email + "&password=" + password + "&role=" + role));
                location.reload();
            
            }
            });
</script>
</html>