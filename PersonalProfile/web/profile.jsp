<!-- to display the submitted profile details after saving. -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="profile.bean.ProfileBean"%> 

<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body {
            background: linear-gradient(to right, #b9d0ee, #ffffff, #b9d0ee);
        }
    </style>
</head>
<body>

<div class="card">
    <h2 style="text-align: center;">Personal Profile</h2>
    
    <%-- Retrieve the Bean from ProfileServlet --%>
    <% ProfileBean user = (ProfileBean) request.getAttribute("userProfile"); %>

    <p><b>Name:</b> <%= user.getName() %></p>
    <p><b>Student ID:</b> <%= user.getStudentId() %></p>
    <p><b>Program:</b> <%= user.getProgram() %></p>
    <p><b>Email:</b> <%= user.getEmail() %></p>
    <p><b>Hobbies:</b> <%= user.getHobbies() %></p>
    <p><b>About Me:</b> <%= user.getIntro() %></p>
    
    <!-- Back button -->
    <div style="text-align: center; margin-top: 20px;">
        <a href="index.html" style="text-decoration: none;">
            <button style="border-radius: 5px; padding: 8px 16px;">Back</button>
        </a>
        <a href="viewProfile.jsp" style="text-decoration: none;">
            <button style="border-radius: 5px; padding: 8px 16px;">View Other Profiles</button>
        </a>
    </div>
</div>

</body>
</html>