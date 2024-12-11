<!DOCTYPE html>
<html>
<head>
    <title>Library Management System</title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="banner">
        <%@ include file="navbar.jsp" %> 
        <div class="content">
            <h1 >LEARNING MANAGEMENT SYSTEM</h1>
            <p>If you're ready to learn the, you can do it here.</p>
            <div>
				<a href="studentview">
                <button type="button"><span></span>TEAM &#x270C;</button>
				</a>
				<a href="userlogin">
				    <button type="button"><span></span>GET STARTED &#x27F6;</button>
				</a>
            </div>
        </div>
        
    </div>
   


	<section id="aboutus">
	    <div class="title-text">
	        <p>ABOUT US</p>
	        <h1>Why Choose Our College</h1>
	    </div>
	    <div class="aboutus-box">
	        <div class="aboutus1">
	            <h1>Quality Education</h1>
	            <div class="aboutus-desc">
	                <div class="aboutus-icon">
	                    <i class="fa fa-graduation-cap fa-fade" style="color: #51a493;"></i>
	                </div>
	                <div class="aboutus-text">
	                    <p>We provide a holistic education experience with a strong focus on academic excellence, 
	                        fostering innovation, and empowering students to achieve their full potential.</p>
	                </div>
	            </div>
	            <h1>State-of-the-Art Facilities</h1>
	            <div class="aboutus-desc">
	                <div class="aboutus-icon">
	                    <i class="fa fa-building fa-fade" style="color: #51a493;"></i>
	                </div>
	                <div class="aboutus-text">
	                    <p>Our campus boasts modern classrooms, advanced laboratories, a well-stocked library, and 
	                        recreational areas to ensure a comprehensive learning environment.</p>
	                </div>
	            </div>
	            <h1>Experienced Faculty</h1>
	            <div class="aboutus-desc">
	                <div class="aboutus-icon">
	                    <i class="fa fa-chalkboard-teacher fa-fade" style="color: #51a493;"></i>
	                </div>
	                <div class="aboutus-text">
	                    <p>Learn from a team of highly qualified and dedicated educators who bring a wealth of 
	                        experience and knowledge to guide you on your academic journey.</p>
	                </div>
	            </div>
	        </div>
	        <div class="aboutus-image">
	            <img src="images/books1.avif" alt="College Campus">
	        </div>
	    </div>
	</section>

    
    <!-- Contact us -->

    <section id="contactus">
        <img src="images/footer2.png" class="contact-img">
        <div class="title-text">
            <p>CONTACT</p>
            <h1>Try Our Website Today!</h1>
        </div>
        <div class="contact-row">
            <div class="contact-left">
                <h1>Website Details</h1>
                <p>All books,articles,journals are
                 available on different topics
                </p>
            </div>
            <div class="conatct-right">
                <h1>Get In Touch!</h1>
                <p>abc@gmail.com <i class="fa fa-paper-plane "></i></p>
                <p>+91 84902094092 <i class="fa fa-phone "></i></p>
            </div>
        </div>
        <div class="social-links">
            <i class="fa fa-facebook-square fa-fade "></i>
            <i class="fa fa-instagram fa-fade"></i>
            <i class="fa fa-twitter fa-fade"></i>
            <!-- <i class="fa fa- "></i> -->
        </div>
    </section>

    <script>
        var navbar=document.getElementById("navbar");
        var menu=document.getElementById("menu");

        window.onscroll=function(){
            if(window.pageYOffset>=menu.offsetTop){
                navbar.classList.add("sticky");
            }
            else{
                navbar.classList.remove("sticky");
            }
        }

        let sections = document.querySelectorAll('section');

        let navLinks = document.querySelectorAll('nav a');

        window.addEventListener("scroll", () => {
    sections.forEach(sec => {
        let top = window.scrollY;
        let offset = sec.offsetTop;
        let height = sec.offsetHeight;
        let id = sec.getAttribute('id');

        if (top >= offset && top < offset + height) {
            navLinks.forEach(links => {
                links.classList.remove('active');
            });
            
            // Adding the 'active' class to the corresponding navigation link
            document.querySelector('header nav a[href*="' + id + '"]').classList.add('active');
        }
    });
});

    </script>
         
    
</body>
</html>