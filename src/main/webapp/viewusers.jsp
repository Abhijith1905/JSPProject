<%@ page import="java.sql.*"%>

<html>
  <head>
    <title>EP</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #b6c4b6;
        margin: 0;
        padding: 0;
      }
      h1 {
        text-align: center;
        margin-top: 20px;
      }
      .menubar {
        display: flex;
        justify-content: center;
        background-color: #333;
        padding: 10px;
        margin-bottom: 20px;
      }
      .menubar a {
        color: white;
        padding: 14px 20px;
        text-decoration: none;
        text-align: center;
        font-size: 17px;
      }
      .menubar a:hover {
        background-color: #ddd;
        color: black;
      }
      h2 {
        margin-bottom: 20px;
      }
      .button {
        background-color: black;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
      }
      input[type="text"],
      input[type="password"],
      input[type="number"],
      input[type="email"],
      select,
      input[type="date"],
      textarea {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }
      label {
        padding: 12px 12px 12px 0;
        display: inline-block;
        font-weight: bold;
      }
      table {
        width: 60%;
        margin: 20px auto;
        border-collapse: separate;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
      }
      th,
      td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        border-right: 1px solid #ddd;
        text-align: center;
      }
      th:last-child,
      td:last-child {
        border-right: none;
      }
      th {
        background-color: #f4f4f4;
        color: #333;
        font-weight: bold;
      }
      tr:nth-child(even) {
        background-color: #f9f9f9;
      }
      tr:hover {
        background-color: #f1f1f1;
      }
      th,
      td {
        border-top: none;
      }
      th:first-child,
      td:first-child {
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
      }
      th:last-child,
      td:last-child {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
      }
    </style>
  </head>
  <body>
    <h1>JSP Web Application</h1>
    <hr color="black" />
    <hr color="black" />
    <br />
    <div class="menubar">
      <a href="index.html">Home</a>
      <a href="userregistration.html">User Registration</a>
      <a href="userlogin.html">User Login</a>
      <a href="viewusers.jsp">View Users</a>
      <a href="updateuserform.html">Update User</a>
      <a href="deleteuser.jsp">Delete User</a>
      <a href="calculatorform.html">Calculator</a>
    </div>
    <% try { Connection con = null; Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded"); 
    con=DriverManager.getConnection("jdbc:mysql://my-db-server-31277.mysql.database.azure.com:3306/jsp-project-db?useSSL=true", "abhijith", "Sriram8585");
    System.out.println("Connection Established");
    PreparedStatement pstmt = con.prepareStatement("select * from user");
    ResultSet rs = pstmt.executeQuery(); %>
    <h3 align="center"><u>View Registered Users</u></h3>
    <table>
      <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Gender</th>
        <th>Date of Birth</th>
        <th>Marital Status</th>
        <th>Email ID</th>
        <th>Contact No</th>
      </tr>
      <% boolean flag = true; while (rs.next()) { flag = false; %>
      <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(8)%></td>
      </tr>
      <% } if (flag) { %>
      <tr>
        <td colspan="7" align="center">No records found</td>
      </tr>
      <% } %>
    </table>
    <% } catch(Exception e) { out.println(e); } %>
  </body>
</html>
