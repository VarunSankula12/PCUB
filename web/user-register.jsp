<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <style>
        /* Add this style to change the color of the active link */
        #navigation li.active a {
            color: #ff0000; /* Change this to the desired color */
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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/responsive.css">
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
    <script type="text/javascript">  
            
        function validateuser(){  
            
        var name=document.myform.name.value;
        var mobile=document.myform.mobile.value;
        var email=document.myform.email.value;
        var address=document.myform.address.value;
        var gender=document.myform.gender.value;
        var dob=document.myform.dob.value;
        var password=document.myform.password.value;
        var cpassword=document.myform.cpassword.value;  
        var file=document.myform.file.value;
        var emailpattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; 
        var letter = /[a-z]/;
        var upper = /[A-Z]/;
        var number = /[0-9]/;

        if (name===""){ 
            Swal.fire('Name Cannot be empty');
                     
          return false;  
        }
        if(mobile===""){
            Swal.fire("Provide Mobile number");
            return false;
        }
        if(mobile.length!==10){
            Swal.fire("Missing length of Mobile number");
            return false;
        }
         if(isNaN(mobile)){
            Swal.fire("Invalid Mobile number");
            return false;
        }
        if (email===""){
            Swal.fire("E-mail cannot be empty");           
            return false;
        }
        if(!email.match(emailpattern)){
            Swal.fire("Invalid Email format");             
            return false;
        }
       
        if (dob===""){
            Swal.fire("Date of Birth cannot be blank");            
            return false;
        }
        if (address===""){
           Swal.fire("Address cannot be blank");            
            return false;
        }
        if (gender===""){
           Swal.fire("Gender cannot be blank");            
            return false;
        }
        
        if (password===''){
           Swal.fire("password should not be empty");          
            return false;
            }
        
        if (!letter.test(password)) {
            Swal.fire("Please make sure password includes a lowercase letter.");
                return false;
            }
        if (!number.test(password)) {
            Swal.fire("Please make sure Password Includes a Digit");
                return false;
            }
        if (!upper.test(password)) {
            Swal.fire("Please make sure password includes an uppercase letter.");
                return false;
            } 
        if(cpassword!==password){
            Swal.fire("password and confirm password must match");            
            return false;
        } 
         if (file===''){
           Swal.fire("please upload the file it should not be empty");          
            return false;
            }
        
        
    }  
    </script>
   </head>

   <body>
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
                                    <li><a href="police-login.jsp">Police</a></li>
                                    <li><a href="user-login.jsp">User</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3">
                        <!-- Header-btn -->
                        <div class="header-btn d-none d-lg-block f-right">
                            <a href="user-register.jsp" class="btn header-btn btn-danger">Register</a>
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

    <!-- slider Area End-->
  <div class="container-fluid px-1 px-md-5 py-5 mx-auto">
    <div class="card card0 border-0">
         <div class="row d-flex">
                <div class="col-lg-5">
                    <div class="col-md-12 bg-black   d-md-block mt-5">
                        <img src="assets/img/hero/register.avif " alt="login form" class="img-fluid"
                            style=" height:400px; width:100%" />
                    </div>


                </div>
            <div class="col-lg-7">
                <div class="card2 card border-0 px-4 px-sm-5 py-5">
                    <h3 class="mb-4">Register</h3>

                    <form action="user-registerAction.jsp" method="POST" id="myform" onsubmit="return validateuser()" name="myform" class="contactForm" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Full Name -->
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <input type="text" class="form-control" name="name" id="name" placeholder="John Doe">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Email -->
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" name="email" id="email" placeholder="johndoe123">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Mobile -->
                                <div class="form-group">
                                    <label for="mobile">Mobile</label>
                                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder="98480*****">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Gender -->
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-select custom-dropdown" name="gender" id="gender">
                                        <option disabled selected>Select Gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Mobile -->
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" name="address" id="address" placeholder="6-978 hyd">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Gender -->
                                <div class="form-group">
                                    <label for="dob">Date of Birth</label>
                                    <input type="date" class="form-control" name="dob" id="dob" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="********">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="cpassword">Confirm Password</label>
                                    <input type="password" class="form-control" name="cpassword" id="cpassword" placeholder="*******">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="file">Profile Pic</label>
                                    <input type="file" class="form-control" name="file" id="file" >
                                </div>
                            </div>
                        </div>
                        <!-- Continue organizing other form fields in a similar manner -->
                        <!-- ... (other form fields) ... -->

                        <div class="row">
                            <div class="col-md-12 text-center">
                                <input type="submit" class="btn btn-danger text-center mb-1 py-2" value="Register">
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
    <!-- ================ contact section end ================= -->

    <!-- End Login Form Section -->

    <!-- Your existing footer content goes here -->

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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