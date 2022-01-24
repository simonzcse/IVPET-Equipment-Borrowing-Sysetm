<%@page import="ict.db.TechDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@taglib uri="/WEB-INF/tlds/newtag_library" prefix='ict' %>
<!-- Content Wrapper id="content-wrapper"-->

<div id="load"></div>
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">
                                    <ict:alertNum/>
                                </span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>

<%
    String Account_ID=(String)session.getAttribute("Account_ID"); 
    ResultSet as= new TechDB("jdbc:mysql://localhost:3306/itp4511_project?useSSL=false", "root", "")
            .queryBySQL("SELECT borrow.Borrow_ID ,borrow.Borrow_ExpirationDate,DATEDIFF(NOW(), borrow.Borrow_ExpirationDate)FROM `borrow`,`borrow_equipment` WHERE NOW() > borrow.Borrow_ExpirationDate and borrow_equipment.Borrow_ID = borrow.Borrow_ID and borrow_equipment.Borrow_Equipment_Status = 'Borrowing' and borrow.Account_ID = " 
                    + Account_ID +" GROUP by Borrow_ID");
    String alertID="";
         String alertDateDiff="";
         String alertDate="";
         int alertCount = 0;
    
        try{
            while (as.next())
                {
                    alertCount++;
                     alertID = as.getString(1);
                     alertDate = as.getString(2);
                     alertDateDiff = as.getString(3);
                     out.print("<a class='dropdown-item d-flex align-items-center' href='/ITP4511_Project_Group10/record'><div class='mr-3'><div class='icon-circle bg-warning'><i class='fas fa-exclamation-triangle text-white'></i></div></div><div>");
            out.print("<div class='small text-gray-500'>Deadline: "+ alertDate+", it is " + alertDateDiff  + " day(s) overdue</div>At least one of the equipment of Borrow ID " + alertID + " is overdued, please return it as soon as possible!</div></a>");

                }
            }catch (SQLException ex) {
                while (ex != null) {
                    ex.printStackTrace();
                    ex = ex.getNextException();
                }
            }catch (Exception ex) {
                out.println("toString(): " + ex.toString());
                out.println("getMessage(): " + ex.getMessage());
                out.println("toString(): " + ex.toString());
            }

    %>
                            </div>
                        </li>


                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=Account_ID%></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                               <a class="dropdown-item" href="/ITP4511_Project_Group10">
                                    Change account
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                
