<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignments</title>
</head>
<body>
    <h1>Assignments List</h1>

    <!-- Button to create a new assignment -->
    <a href="/assignments/new">Create New Assignment</a>

    <!-- Table to display all assignments -->
    <table border="1">
        <thead>
            <tr>
                <th>Title</th>
                <th>Content</th>
                <th>Due Date</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="assignment" items="${assignments}">
                <tr>
                    <td>${assignment.title}</td>
                    <td>${assignment.content}</td>
                    <td>${assignment.dueDate}</td>
                    <td>${assignment.department}</td>
                    <td>
                        <!-- Links for editing and deleting -->
                        <a href="/assignments/edit/${assignment.id}">Edit</a> |
                        <a href="/assignments/delete/${assignment.id}" onclick="return confirm('Are you sure you want to delete this assignment?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
