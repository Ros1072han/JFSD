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

        <main class="table">
            <section class="table__header">
                <h1>USER DATA</h1>
                <div class="input-group">
                    <input type="search" placeholder="Search Data...">
                    <img src="images/magnifying-glass.jpg" alt="">
                </div>
                <div class="export__file">
                    <label for="export-file" class="export__file-btn" title="Export File"></label>
                    <input type="checkbox" id="export-file">
                    <div class="export__file-options">
                        <label>Export As &nbsp; &#10140;</label>
                        <label for="export-file" id="toPDF">PDF <img src="images/pdf.png" alt=""></label>
                        <label for="export-file" id="toJSON">JSON <img src="images/json.png" alt=""></label>
                        <label for="export-file" id="toCSV">CSV <img src="images/csv.png" alt=""></label>
                        <label for="export-file" id="toEXCEL">EXCEL <img src="images/excel.png" alt=""></label>
                    </div>
                </div>
            </section>
            <section class="table__body">
                <table>
                 <thead>
                     <tr>
                         <th> Id <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Name <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Gender <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Date Of Birth <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Email <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Contact <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Active Status </th>
                     </tr>
                 </thead>
                 <tbody>
                     <c:forEach items="${users}"  var="usr"> 
						<tr> 
							<td><c:out value="${usr.id}" /></td> 
							<td><c:out value="${usr.name}" /></td> 
							<td><c:out value="${usr.gender}" /></td> 
							<td><c:out value="${usr.dateofbirth}" /></td> 
							<td><c:out value="${usr.email}" /></td> 
							<td><c:out value="${usr.contact}" /></td> 
							<c:if test="${usr.active==true}">
							<td><a style="text-decoration: none; background-color:red; color: white; padding:5px; border-radius: 10px;" href='<c:url value="adminsetstatus?id=${usr.id}&status=false"></c:url>'>Make Inactive</a></td> 
							</c:if>
							<c:if test="${usr.active==false}">
							<td><a style="text-decoration: none; background-color:green; color: white; padding:5px; border-radius: 10px;" href='<c:url value="adminsetstatus?id=${usr.id}&status=true"></c:url>'>Make Active</a></td> 
							</c:if>
						</tr> 
					</c:forEach> 
                 </tbody>
             </table>
            </section>
        </main>   <br><br>
        
        <!-- <br>
        <main class="table">
         <section class="table__header">
             <h1>Customer's Orders</h1>
             <div class="input-group">
                 <input type="search" placeholder="Search Data...">
                 <img src="images/magnifying-glass.png" alt="">
             </div>
             <div class="export__file">
                 <label for="export-file" class="export__file-btn" title="Export File"></label>
                 <input type="checkbox" id="export-file">
                 <div class="export__file-options">
                     <label>Export As &nbsp; &#10140;</label>
                     <label for="export-file" id="toPDF">PDF <img src="images/pdf.png" alt=""></label>
                     <label for="export-file" id="toJSON">JSON <img src="images/json.png" alt=""></label>
                     <label for="export-file" id="toCSV">CSV <img src="images/csv.png" alt=""></label>
                     <label for="export-file" id="toEXCEL">EXCEL <img src="images/excel.png" alt=""></label>
                 </div>
             </div>
         </section>
         <section class="table__body">
             <table>
                 <thead>
                     <tr>
                         <th> Id <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Customer <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Location <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Order Date <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Status <span class="icon-arrow">&UpArrow;</span></th>
                         <th> Amount <span class="icon-arrow">&UpArrow;</span></th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                         <td> 1 </td>
                         <td> <img src="images/user.png" alt="">Zinzu Chan Lee</td>
                         <td> Seoul </td>
                         <td> 17 Dec, 2022 </td>
                         <td>
                             <p class="status delivered">Delivered</p>
                         </td>
                         <td> <strong> $128.90 </strong></td>
                     </tr>
                     <tr>
                         <td> 2 </td>
                         <td><img src="images/user.png" alt=""> Jeet Saru </td>
                         <td> Kathmandu </td>
                         <td> 27 Aug, 2023 </td>
                         <td>
                             <p class="status cancelled">Cancelled</p>
                         </td>
                         <td> <strong>$5350.50</strong> </td>
                     </tr>
                     <tr>
                         <td> 3</td>
                         <td><img src="images/user.png" alt=""> Sonal Gharti </td>
                         <td> Tokyo </td>
                         <td> 14 Mar, 2023 </td>
                         <td>
                             <p class="status shipped">Shipped</p>
                         </td>
                         <td> <strong>$210.40</strong> </td>
                     </tr>
                     <tr>
                         <td> 4</td>
                         <td><img src="images/user.png" alt=""> Alson GC </td>
                         <td> New Delhi </td>
                         <td> 25 May, 2023 </td>
                         <td>
                             <p class="status delivered">Delivered</p>
                         </td>
                         <td> <strong>$149.70</strong> </td>
                     </tr>
                     <tr>
                         <td> 5</td>
                         <td><img src="images/user.png" alt=""> Sarita Limbu </td>
                         <td> Paris </td>
                         <td> 23 Apr, 2023 </td>
                         <td>
                             <p class="status pending">Pending</p>
                         </td>
                         <td> <strong>$399.99</strong> </td>
                     </tr>
                     <tr>
                         <td> 6</td>
                         <td><img src="images/user.png" alt=""> Alex Gonley </td>
                         <td> London </td>
                         <td> 23 Apr, 2023 </td>
                         <td>
                             <p class="status cancelled">Cancelled</p>
                         </td>
                         <td> <strong>$399.99</strong> </td>
                     </tr>
                     <tr>
                         <td> 7</td>
                         <td><img src="images/user.png" alt=""> Jeet Saru </td>
                         <td> New York </td>
                         <td> 20 May, 2023 </td>
                         <td>
                             <p class="status delivered">Delivered</p>
                         </td>
                         <td> <strong>$399.99</strong> </td>
                     </tr>
                     <tr>
                         <td> 8</td>
                         <td><img src="images/user.png" alt=""> Aayat Ali Khan </td>
                         <td> Islamabad </td>
                         <td> 30 Feb, 2023 </td>
                         <td>
                             <p class="status pending">Pending</p>
                         </td>
                         <td> <strong>$149.70</strong> </td>
                     </tr>
                     <tr>
                         <td> 9</td>
                         <td><img src="images/user.png" alt=""> Alson GC </td>
                         <td> Dhaka </td>
                         <td> 22 Dec, 2023 </td>
                         <td>
                             <p class="status cancelled">Cancelled</p>
                         </td>
                         <td> <strong>$249.99</strong> </td>
                     </tr>
                 </tbody>
             </table>
         </section>
     </main>
     -->
     <div>
        
        <button type="button"><a href="#"></a>ADD USER &#x27F6;</button>
    </div>
    </section>
    
    <script src="script.js"></script>
    <script src="table.js">
    </script>
</body>
</html>