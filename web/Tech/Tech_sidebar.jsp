        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-cogs    "></i>
                </div>
                <div class="sidebar-brand-text mx-3">Equipment</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Equipment
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-handshake    "></i>
                    <span>Counter</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="handleReversion?Action=Reversion">Borrowing Request</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Check:</h6>
                        <a class="collapse-item" href="handleReversion?Action=Borrow">Borrow</a>
                        <a class="collapse-item" href="handleReversion?Action=EquipmentReturn">Return</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Management</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="handleEquipmentManangement?Action=List">List All Equipment</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Action:</h6>
                        <a class="collapse-item" href="handleEquipmentManangement?Action=NewEquipment">Add Equipment</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAnalytic"
                    aria-expanded="true" aria-controls="collapseAnalytic">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Analytic</span>
                </a>
                <div id="collapseAnalytic" class="collapse" aria-labelledby="headingAnalytic"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Student:</h6>
                        <a class="collapse-item" href="handleAnalytic?Action=Record">Student Borrow Records</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Equipment:</h6>
                        <a class="collapse-item" href="handleAnalytic?Action=Overdue">Overdue Equipment</a>
                        <a class="collapse-item" href="Tech_Equipment_Utilization_Rate.jsp">Equipment Utilization Rate</a>
                    </div>
                </div>
            </li>

           
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->
