<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.klef.jfsd.springboot.model.Librarian" %>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<%
Librarian lib = (Librarian) session.getAttribute("lib");
    if(lib==null)
    {
        response.sendRedirect("sessionexpiry.html");
    }
%>
<!DOCTYPE html>
<html lang="en" title="Assignment Submission">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Student Assignments</title>
    <link rel="stylesheet" href="css/table.css">
    <style type="text/css">
        /* General body and background */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Navigation bar */
        nav {
            width: 100%;
            margin: 0 auto;
            padding: 15px 30px;
            background-color: #009688;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        /* Assignment form section */
        .assignment-form {
            background-color: #ffffff;
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .assignment-form h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
        }

        .assignment-form label {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #333;
        }

        .assignment-form input,
        .assignment-form textarea {
            width: 100%;
            padding: 12px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        .assignment-form button {
            background-color: #009688;
            color: white;
            font-size: 18px;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .assignment-form button:hover {
            background-color: #00796b;
        }

        /* Table section */
        .table {
            margin: 40px auto;
            max-width: 1100px;
            width: 90%;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table__header {
            background-color: #009688;
            color: white;
            padding: 15px 20px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .table__header h1 {
            margin: 0;
            font-size: 28px;
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group input {
            padding: 8px 15px;
            margin: 5px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
            flex: 1;
        }

        .input-group img {
            width: 20px;
            margin-left: 10px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
            color: #333;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f1f1f1;
            color: #009688;
        }

        table td {
            background-color: #fafafa;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Footer button */
        .footer-button {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .footer-button button {
            background-color: #009688;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .footer-button button a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .footer-button button:hover {
            background-color: #00796b;
        }
    </style>
</head>

<body>
    <%@ include file="libnavbar.jsp" %>
    <div class="body">
        <!-- Assignment Input Form -->
        <div class="assignment-form">
            <h2>Give Assignment</h2>
            <form action="submitassignment" method="post">
                <label for="assignmentDescription">Assignment Description:</label>
                <textarea id="assignmentDescription" name="assignmentDescription" rows="4" required></textarea>

                <label for="studentId">Student ID:</label>
                <input type="text" id="studentId" name="studentId" required />

                <label for="submittedAt">Submission Date and Time:</label>
                <input type="datetime-local" id="submittedAt" name="submittedAt" required />

                <label for="assignmentId">Assignment ID:</label>
                <input type="text" id="assignmentId" name="assignmentId" required />

                <button type="submit">Submit Assignment</button>
            </form>
        </div>

        <!-- Table to View Assignments -->
        <main class="table">
            <section class="table__header">
                <h1>Assignment Submissions</h1>
                <div class="input-group">
                    <input type="search" placeholder="Search Assignments...">
                    <img src="images/magnifying-glass.jpg" alt="">
                </div>
            </section>
            <section class="table__body">
                <table>
                    <thead>
                        <tr>
                            <th> ID <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Answer <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Student ID <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Submitted At <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Assignment ID <span class="icon-arrow">&UpArrow;</span></th>
                            <th> Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${assignments}" var="assignment">
                            <tr>
                                <td><c:out value="${assignment.id}" /></td>
                                <td><c:out value="${assignment.answer}" /></td>
                                <td><c:out value="${assignment.student_id}" /></td>
                                <td><c:out value="${assignment.submitted_at}" /></td>
                                <td><c:out value="${assignment.assignment_id}" /></td>
                                <td>
                                    <a style="text-decoration: none; color: #009688;"
                                        href='<c:url value="viewassignment?id=${assignment.id}"></c:url>'>View</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <!-- Footer Button -->
    <div class="footer-button">
        <button>
            <a href="addassignment">Add Assignment</a>
        </button>
    </div>
</body>
<script src="table.js"></script>
</html>
