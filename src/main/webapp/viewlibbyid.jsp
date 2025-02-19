<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"     import="com.klef.jfsd.springboot.model.Librarian" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 


<!DOCTYPE html>
<!--=== Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/admintable.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title> 
</head>
<body>
    <nav>
        <div class="logo-name">

            <span class="logo_name">ADMIN HOME</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="adminhome">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dashboard</span>
                </a></li>
                <li><a href="viewalllibs">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Instructor</span>
                </a></li>
                <li><a href="adminUser">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">User</span>
                </a></li>
                 <li><a href="viewallbooks">
                  <i class="uil uil-book"></i>
                    <span class="link-name">Book</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="adminlogin">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
            <img src="images/user.png" alt="">
        </div>
         <br>
        <br>
        <br>

        <br><br><br>

    <div class="projcard-container">
		
	<div class="projcard projcard-blue">
		<div class="projcard-innerbox">
			<img class="projcard-img" src="images/profile.jpg" />
			<div class="projcard-textbox">
				<div class="projcard-title">Librarian Profile</div>
				<br>
				<div class="projcard-subtitle">Here are the details of the Librarian</div>
				<div class="projcard-bar"></div>
				<div class="projcard-description">
				<i><b>ID:</b></i> ${lib.id }
				<br>
				<br>
				<i><b>Name:</b></i> ${lib.name}
				<br>
				<br>
				<i><b>Gender:</b></i> ${lib.gender}
				<br>
				<br>
				<i><b>Date Of Birth:</b></i> ${lib.dateofbirth}
				<br>
				<br>
				<i><b>Email ID:</b></i> ${lib.email }
				<br>
				<br>
				 <i><b>Contact No:</b></i> ${lib.contact}
				<br>
				<br>
				</div>
				<div class="projcard-tagbox">
					<span class="projcard-tag">HTML</span>
					<span class="projcard-tag">CSS</span>
				</div> 
			</div>
		</div>
	</div>
	</div>
        
    
    </section>
    <script src="adminscript.js"></script>
    <script src="admintable.js">
    </script>
</body>
</html>