<%@page import="com.codebook.user.userDao,java.sql.*"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
        /* Add this style to change the color of the active link */
        #navigation li.active a {
            color: #ff0000; /* Change this to the desired color */
        }
        .card {
    transition: background-color 0.3s;
}

.card:hover {
    background-color: #3498db; /* Change this to the desired hover color (blue in this case) */
}

.card-title {
    font-weight: bold;
}
.icon-container {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px; /* Adjust this margin as needed */
}

    </style>
    <!-- Add this style to change the color of the active link -->
<style>
    #navigation li.active a {
        color: #ff0000; /* Change this to the desired color */
    }

    .card {
        transition: background-color 0.3s;
        border: none;
    }

    .card:hover {
        background-color: #3498db; /* Change this to the desired hover color (blue in this case) */
    }

    .card-title {
        font-weight: bold;
        color: #333; /* Change this to the desired text color */
    }

    .icon-container {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 15px; /* Adjust this margin as needed */
    }

    .footer-area {
        background-color: #333; /* Change this to the desired footer background color */
        color: #fff; /* Change this to the desired footer text color */
    }

    .footer-logo img {
        filter: brightness(0) invert(1); /* Invert the logo color for better visibility on a dark background */
    }

    .footer-social a {
        color: #fff; /* Change this to the desired footer social icon color */
    }

    /* Add this section to style the slider */
    .slider-area {
        background-color: #3498db; /* Change this to the desired slider background color */
        color: #fff; /* Change this to the desired slider text color */
    }

    .hero-cap h2 {
        color: #fff; /* Change this to the desired slider heading color */
    }
</style>

        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>PCUB</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/slicknav.css">
            <link rel="stylesheet" href="assets/css/animate.min.css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/flaticon.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/nice-select.css">
            <link rel="stylesheet" href="assets/css/style.css">
            <link rel="manifest" href="site.webmanifest">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">

    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/responsive.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Additional CSS for the login form -->
    <style>
        /* Style the login form as needed */
        .login-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 50px;
        }

        /* Style the image */
        .login-image {
            width: 100%; /* Adjust the width as needed */
            height: auto;
            border-radius: 5px;
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
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <!-- Header Start -->
        <div class="header-area header-sticky">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-xl-2 col-lg-1 col-md-1">
                        <div class="logo">
                            <a href="index.html"><img src="assets/img/hero/pcub9.png" height="80" width="200" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-8 col-md-6">
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="myprofile.jsp">My Profile</a></li>
                                    <li><a href="add-complaint.jsp">Add Complaint</a></li>
                                    <li><a href="complaintstatus.jsp">Complaint Status</a></li>
                                    <li><a href="userfeedback.jsp">Feedback</a></li>
                                </ul>
                            </nav>


    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3">
                        <!-- Header-btn -->
                        <div class="header-btn d-none d-lg-block f-right">
                            <a href="../index.html" class="btn header-btn btn-danger">Logout</a>
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>

  <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/law_hero2.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>User Dashboard</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
<!-- Add this section for the four cards -->
<section class="section-padding">
   <div class="container mt-5">
    <div class="row">
          <!-- First Card -->
<!-- First Card -->
<%
    int users=0;
    int complaints=0;
    int pcomplaint=0;
    int feedback=0;
    String query="SELECT * FROM user";
    ResultSet rs=userDao.Retrieve(query);
    while(rs.next()){
        users++;
    }
    String q1="SELECT * FROM complaints WHERE status='PENDING'";
    ResultSet rs1=userDao.Retrieve(q1);
    while(rs.next()){
        pcomplaint++;
    }
    String q2="SELECT * FROM complaints";
    ResultSet rs2=userDao.Retrieve(q2);
    while(rs2.next()){
        complaints++;
    }
    String q3="SELECT * FROM feedback";
    ResultSet rs3=userDao.Retrieve(q3);
    while(rs3.next()){
        feedback++;
    }
%>


        <!-- First Card -->
        <div class="col-md-3 mb-4">
            <div class="card border-info shadow h-100">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="icon-container bg-info text-white rounded-circle mb-3">
                        <i class="fas fa-user fa-2x"></i>
                    </div>
                    <h5 class="card-title">No of Users</h5>
                    <p class="card-text h4"><%=users%></p>
                </div>
            </div>
        </div>

        <!-- Second Card -->
        <div class="col-md-3 mb-4">
            <div class="card border-warning shadow h-100">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="icon-container bg-warning text-white rounded-circle mb-3">
                        <i class="far fa-file-alt fa-2x"></i>
                    </div>
                    <h5 class="card-title">Pending Complaints</h5>
                    <p class="card-text h4"><%=pcomplaint%></p>
                </div>
            </div>
        </div>

        <!-- Third Card -->
<div class="col-md-3 mb-4">
    <div class="card border-success shadow h-100">
        <div class="card-body d-flex flex-column align-items-center">
            <div class="icon-container bg-success text-white rounded-circle mb-3">
                <i class="far fa-comments fa-2x"></i> <!-- Replaced with a different icon -->
            </div>
            <h5 class="card-title">No of Feedbacks</h5>
            <p class="card-text h4"><%=feedback%></p>
        </div>
    </div>
</div>


        <!-- Fourth Card -->
        <div class="col-md-3 mb-4">
            <div class="card border-danger shadow h-100">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="icon-container bg-danger text-white rounded-circle mb-3">
                        <i class="far fa-comment fa-2x"></i>
                    </div>
                    <h5 class="card-title">Total Complaints</h5>
                    <p class="card-text h4"><%=complaints%></p>
                </div>
            </div>
        </div>

    </div>
</div>

</section>

    <!-- ================ contact section start ================= -->
    
    <!-- ================ contact section end ================= -->

    <!-- End Login Form Section -->

   <footer>
       <!-- Footer Start-->
       <div class="footer-area footer-bg footer-padding">
           <div class="container">
               <div class="row d-flex justify-content-between">
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                      <div class="single-footer-caption mb-50">
                        <!-- logo -->
                        <div class="footer-logo">
                            <a href="index.html"><img src="assets/img/hero/pcub9.png" height="100" width="200" alt=""></a>
                        </div>
                        <div class="single-footer-caption mb-30">
                            <div class="footer-tittle">
                                <div class="footer-pera">
                                    <p>Using blockchain technology in the context of police complaints can bring about several potential benefits, largely centered around transparency, security, and accountability. </p>
                               </div>
                            </div>
                        </div>
                        <!-- footer social -->
                        <div class="footer-social">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
                            <a href="#"><i class="fab fa-behance"></i></a>
                        </div>
                      </div>
                   </div>
                   <div class="col-xl-2 col-lg-2 col-md-2 col-sm-5">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Website Includes</h4>
                               <ul>
                                   <li><a href="index.html">Home</a></li>
                                   <li><a href="about.jsp"> About</a></li>
                                   <li><a href="police-login.jsp">Police</a></li>
                                   <li><a href="user-login.jsp">User</a></li>
                                   <li><a href="contact.jsp">Contact</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-2 col-md-3 col-sm-5">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Cases</h4>
                               <ul>
                                   <li><a href="#">Murders</a></li>
                                   <li><a href="#">Kidnaps</a></li>
                                   <li><a href="#">Robbery</a></li>
                                   <li><a href="#"> Accidents</a></li>
                                   <li><a href="#"> Chain Snatchings</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-4 col-lg-4 col-md-5 col-sm-5">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Have a Question ?<br>Please Reach out to us here..</h4>
                               <div class="footer-pera footer-pera2">
                            </div>
                            <div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">#2nd Floor, Siris Rd, Near L.B Nagar Metro Station Pillar No, A1662, Snehapuri Colony, Hyderabad, Telangana 500074</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+91 9848022602</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">codebook@gmail.com</span></a></li>
	              </ul>
	            </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <!-- footer-bottom aera -->
       <div class="footer-bottom-area footer-bg">
           <div class="container">
               <div class="footer-border">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-12">
                            <div class="footer-copy-right text-center">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | </i> by <a
							href="https://codebook.in/" target="_blank">CODEBOOK.in</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                    </div>
               </div>
           </div>
       </div>
       <!-- Footer End-->
   </footer>
    <script>
        // Add this script to set the active class to the Police link
        document.addEventListener("DOMContentLoaded", function() {
            var currentPage = window.location.pathname.split("/").pop(); // Get the current page filename
            var navigationLinks = document.querySelectorAll("#navigation li a");

            // Loop through each navigation link
            navigationLinks.forEach(function(link) {
                var linkHref = link.getAttribute("href");
                var linkPage = linkHref.split("/").pop(); // Get the link's filename

                // Check if the link corresponds to the current page
                if (currentPage === linkPage) {
                    link.parentElement.classList.add("active"); // Add the active class to the parent li
                }
            });
        });
    </script>
	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        
		<!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- counter , waypoint -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script src="./assets/js/jquery.counterup.min.js"></script>

        <!-- counter -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>