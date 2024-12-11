<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Assignment</title>
</head>
<body>
    <h1>Edit Assignment</h1>

    <!-- Form to edit an existing assignment -->
    <form:form action="/assignments/${assignment.id}" method="post" modelAttribute="assignment">
        <input type="hidden" path="id" />

        <label for="title">Title:</label>
        <form:input path="title" id="title" /><br>

        <label for="content">Content:</label>
        <form:input path="content" id="content" /><br>

        <label for="dueDate">Due Date:</label>
        <form:input path="dueDate" id="dueDate" type="date" /><br>

        <label for="department">Department:</label>
        <form:input path="department" id="department" /><br>

        <label for="studentId">Student ID:</label>
        <form:input path="studentId" id="studentId" /><br>

        <label for="studentName">Student Name:</label>
        <form:input path="studentName" id="studentName" /><br>

        <label for="studentDept">Student Department:</label>
        <form:input path="studentDept" id="studentDept" /><br>

        <label for="answer">Answer:</label>
        <form:textarea path="answer" id="answer"></form:textarea><br>

        <input type="submit" value="Save Changes" />
    </form:form>

    <!-- Link to go back to the assignments list -->
    <a href="/assignments">Back to Assignments List</a>
</body>
</html>
