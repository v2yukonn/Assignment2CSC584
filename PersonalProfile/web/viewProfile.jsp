<%-- 
    Document   : viewProfile.jsp
    Created on : Dec 12, 2025, 7:40:59 PM
    Author     : aliff
--%>
<!-- to list all profiles retrieved from the database. -->
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    
    <style>
        /* Override the default card width so the table fits */
        .card {
            width: 80%;       /* Make it responsive */
            max-width: 900px; /* Maximum width */
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 14px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #7091cd;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .search-box {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            justify-content: center;
        }
        .search-box input {
            width: 300px;
            margin-bottom: 0;
        }
    </style>
</head>
<body>

    <div class="card">
        <h2 style="text-align: center;">Student Profiles List</h2>

        <form action="viewProfile.jsp" method="get" style="box-shadow: none; padding: 0; width: 100%;">
            <div class="search-box">
                <input type="text" name="search" placeholder="Search by Name or Program...">
                <button style="border-radius: 5px;" type="submit">Search</button>
                <a href="viewProfile.jsp"><button style="border-radius: 5px;" type="button" >Reset</button></a>
            </div>
        </form>

        <table>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Program</th>
                <th>Email</th>
                <th>Hobbies</th>
            </tr>
            
            <%
                String search = request.getParameter("search");
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfileDB", "app", "APP");
                    
                    String sql = "SELECT * FROM PROFILE";
                    
                    // Filter Logic
                    if (search != null && !search.trim().isEmpty()) {
                        // Filter
                        sql += " WHERE LOWER(NAME) LIKE LOWER(?) OR LOWER(PROGRAM) LIKE LOWER(?)";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, "%" + search + "%");
                        stmt.setString(2, "%" + search + "%");
                    } else {
                        stmt = conn.prepareStatement(sql);
                    }

                    rs = stmt.executeQuery();

                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
            %>
                    <tr>
                        <td><%= rs.getString("ID") %></td>
                        <td><%= rs.getString("NAME") %></td>
                        <td><%= rs.getString("PROGRAM") %></td>
                        <td><%= rs.getString("EMAIL") %></td>
                        <td><%= rs.getString("HOBBY") %></td>
                    </tr>
            <%
                    }
                    
                    if (!hasData) {
            %>
                    <tr>
                        <td colspan="5" style="text-align: center; color: red;">No profiles found.</td>
                    </tr>
            <%
                    }

                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>

        <div style="text-align: center; margin-top: 20px;">
            <a href="index.html" style="text-decoration: none;">
                <button style="border-radius: 5px;">Back to Home</button>
            </a>
        </div>
    </div>

</body>
</html>