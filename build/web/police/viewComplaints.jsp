
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
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
  </style>
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
    <script>
        var successMessage = '${sessionScope.failed}';
        if (successMessage !== '') {
            Swal.fire({
                icon: 'failed',
                title: 'Failed!',
                text: successMessage,
                confirmButtonText: 'OK'
            });

            <% session.removeAttribute("failed"); %>
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
  
  <main id="main" class="main">
    
    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="Admin-Dashboard.jsp">Home</a></li>
          <li class="breadcrumb-item active">View Complaints</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
       
   
   <section class="section dashboard ">
        <div class="col-md-12 mb-4">
                <div class="card-header py-3">
                    <h5 class="mb-0">View Complaints</h5>
                </div>
            
                    <table class="table table-striped custab mt-2">
                        <thead>
                            <tr>
                                <th>S No</th>
                                <th>Suspect Name</th>
                                <th>Complaint Type</th>
                                <th>Incident Date</th>
                                <th>Location</th>
                                <th>View Evidence</th>
                                <th>Verify Complaint</th>
                            </tr>
                        </thead>
                         <%      
            int count=0;
            Blob img=null;String pic="";
            String query="SELECT * FROM complaints WHERE status='PENDING' &&  case_reg='PENDING'";
            ResultSet rs=adminDao.Retrieve(query);
            while(rs.next()){
                img=rs.getBlob("evidence");
                pic=adminDao.imageConversion(img);
                count++;
        
    %>
                        <tbody>          
                  <tr>
    <td><%=count%></td>
    <td><%=rs.getString("sus_name")%></td>
    <td><%=rs.getString("category")%></td>
    <td><%=rs.getString("date")%></td>
    <td><%=rs.getString("incident")%></td>
    <td>
        <a class="view-image-link" data-modal-id="myModal<%= count %>" data-image-src='data:image/jpeg;base64,<%= pic %>'>View Image</a>
    </td>
    <td>
        <a href="verifyAction.jsp?susname=<%=rs.getString("sus_name")%>&type=<%=rs.getString("category")%>&date=<%=rs.getString("date")%>&location=<%=rs.getString("incident")%>"><button class="btn btn-success">Verify</button></a>
        <a href="discardComplaint.jsp?susname=<%=rs.getString("sus_name")%>&type=<%=rs.getString("category")%>&date=<%=rs.getString("date")%>&location=<%=rs.getString("incident")%>"><button class="btn btn-danger">Discard</button></a>
    </td>
</tr>


<!-- Modal container for each image -->
<div class="modal" id="myModal<%= count %>">
    <img class="modal-content" data-modal-id="myModal<%= count %>">
    <span class="close" data-modal-id="myModal<%= count %>">&times;</span>
</div>

                    <%
       }
   %>       
                 
                        </tbody>
                    </table>
                    
        </div>
        
    </section>
   
  </main><!-- End #main -->
  
 <script>
var linkElements = document.querySelectorAll(".view-image-link");
var modalElements = document.querySelectorAll(".modal");
var closeElements = document.querySelectorAll(".close");
var modalImageElements = document.querySelectorAll(".modal-content");

linkElements.forEach(function(link, index) {
    link.onclick = function() {
        var modalId = this.getAttribute("data-modal-id");
        var modal = document.getElementById(modalId);

        modal.style.display = "block";
        var modalImage = modal.querySelector(".modal-content");

        // Set the modalImage source here
        var imgSrc = link.getAttribute("data-image-src");
        modalImage.src = imgSrc;
    };
});

closeElements.forEach(function(close) {
    close.onclick = function() {
        var modalId = this.getAttribute("data-modal-id");
        var modal = document.getElementById(modalId);
        modal.style.display = "none";
    };
});

window.onclick = function(event) {
    modalElements.forEach(function(modal) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
};
</script>



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