<%@page import="com.codebook.admin.Hashing"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="javax.crypto.SecretKey" %>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.util.Arrays" %>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
      .image-container {
    cursor: pointer;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.8);
}

.modal-content {
    margin: auto;
    display: block;
    max-width: 50%;
    max-height: 70vh;
    transform: translate(-50%, -50%) scale(0.9); /* Adjust the scale value for zoom */
    position: absolute;
    top: 50%;
    left: 40%;
}

.close {
    color: white !important; /* Set the text color to white */
    position: absolute;
    top: 20px;
    right: 30px;
    font-size: 30px;
    font-weight: bold;
    cursor: pointer;
}

.text-center {
    text-align: center;
}

.attractive-link {
    display: inline-block;
    border: 2px solid #3498db;
    padding: 10px;
    border-radius: 5px;
    background-color: #3498db;
}

.view-image-link {
    color: #fff;
    text-decoration: none;
    font-weight: bold;
}


  </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
  <title>Admin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
</head>

<body>
  <script>
        var successMessage = '${sessionScope.success}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("success"); %>
        }
          
    </script>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    
    <div class="d-flex align-items-center justify-content-between">
        <a href="Admin-Dashboard.jsp" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Police</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    
    
    
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
          
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/admin-police.avif" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Police</span>
          </a><!-- End Profile Iamge Icon -->
          
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            
            <li>
              <a class="dropdown-item d-flex align-items-center" href="../police-login.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
            
          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
        
      </ul>
    </nav><!-- End Icons Navigation -->
    
  </header><!-- End Header -->
  
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">
    
    <ul class="sidebar-nav" id="sidebar-nav">
  
  <li class="nav-item">
      <a class="nav-link collapsed" href="police-dashboard.jsp">
      <i class="bi bi-grid"></i>
      <span>Dashboard</span>
    </a>
  </li><!-- End Dashboard Nav -->

  <li class="nav-item">
      <a class="nav-link " href="viewComplaints.jsp">
      <i class="bi bi-book"></i><span>View Complaints</span>
    </a>
  </li><!-- End Charts Nav -->
  
  <li class="nav-item">
    <a class="nav-link collapsed"  href="updateComplaints.jsp">
      <i class="bi bi-check2"></i><span>Update Complaints</span>
    </a>
  </li>

  <li class="nav-item">
      <a class="nav-link collapsed"  href="allComplaints.jsp">
      <i class="bi bi-layout-text-window-reverse"></i><span>All Complaints</span>
    </a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link collapsed"  href="view-feedback.jsp">
      <i class="bi bi-journal"></i><span>View Feedback </span>
    </a>
  </li>

</ul>

    
  </aside><!-- End Sidebar-->
  
  <!-- Inside the <body> tag -->
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Verified Complaint</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Admin-Dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Verified Complaint</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->


<%
    
    String val[]=new String[4];
    String type = request.getParameter("category");
    String location = request.getParameter("location");
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    String query = "SELECT * FROM complaints WHERE sus_name='" + name + "' && date='" + date + "' && category='" + type + "'&& incident='" + location + "'";
    ResultSet rs = adminDao.Retrieve(query);
    String[] info = new String[4];
    if (rs.next()) {
        info[0] = rs.getString("sus_name");
        info[1] = rs.getString("category");
        info[2] = rs.getString("date");
        info[3] = rs.getString("incident");
        val=Hashing.methodHashing(info);
%>


   <section class="section dashboard">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <!-- First Registration Form -->
            <div class="col-12 col-md-6 mb-4">
                <div class="card p-4">
                    <h4 class="text-center mb-4">Verified Using BlockChain</h4>
                    
                    <form method="post" action="registrationAction1.jsp">
                        <div class="form-group">
                            <label for="firstName1"><b>Block 1</b></label>
                            <input type="text" class="form-control" name="firstName1" id="firstName1" value="<%=rs.getString("nameHash")%>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="lastName1"><b>Block 2</b></label>
                            <input type="text" class="form-control" name="lastName1" id="lastName1" value="<%=rs.getString("categoryHash")%>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="email1"><b>Block 3</b></label>
                            <input type="email" class="form-control" name="email1" id="email1" value="<%=rs.getString("dateHash")%>" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="email1"><b>Block 4</b></label>
                            <input type="email" class="form-control" name="email1" id="email1" value="<%=rs.getString("incidentHash")%>" readonly>
                        </div>
                        


                        <div class="mb-3"></div>
                        
                    </form>
                </div>
            </div>

            <!-- Second Registration Form -->
            <div class="col-12 col-md-6 mb-4">
                <div class="card p-4">
                    <h4 class="text-center mb-4">Complaint</h4>

                    <form>
                        <div class="form-group">
                            <label for="firstName2"><b>Suspect Name:</b></label>
                            <input type="text" class="form-control" name="name" id="name" value="<%=name%>" required>
                        </div>

                        <div class="form-group">
                            <label for="lastName2"><b>Complaint Type:</b></label>
                            <input type="text" class="form-control" name="type" id="type" value="<%=type%>" required>
                        </div>

                        <div class="form-group">
                            <label for="email2"><b>Incident Date:</b></label>
                            <input type="text" class="form-control" name="date" id="date" value="<%=date%>" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="lastName2"><b>Location:</b></label>
                            <input type="text" class="form-control" name="location" id="location" value="<%=location%>" required>
                        </div>
                        

                        <div class="mb-3"></div>
                        <!-- Add more fields as needed -->
                        <div class="text-center">
                            <a class="btn btn-primary"  href="FIRAction.jsp?name=<%= name %>&category=<%= type %>&location=<%= location %>&date=<%= date %>">File as FIR</a>
                            <a class="btn btn-warning" href="NCRAction.jsp?name=<%= name %>&category=<%= type %>&location=<%= location %>&date=<%= date %>">File as NCR</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<%
}else{
        out.println("Complaint not Exists");
    }
%>
</main>
<!-- End #main -->

 
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>Codebook</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://codebook.in/" target="_blank">Codebook</a>
    </div>
  </footer><!-- End Footer -->
  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
</body>

</html>