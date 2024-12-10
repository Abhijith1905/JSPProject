<%@ page import="java.sql.*"%>

<html>
<head>
<title>EP</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    h1 {
        text-align: center;
    }
    .menubar {
        display: flex;
        justify-content: center;
        background-color: #333;
        padding: 10px;
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
  input[type=text],input[type=password],input[type=number],input[type=email],
  select,input[type=date],textarea
  {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }
  
  label
  {
    padding: 12px 12px 12px 0;
    display: inline-block;
    font-weight: bold;
  }
</style>
</head>
<body bgcolor="#B6C4B6">
<h1>JSP Web Application</h1>
<hr color="black"><hr color="black"><br>
<div class="menubar">
    <a href="index.html">Home</a>
    <a href="userregistration.html">User Registration</a>
    <a href="userlogin.html">User Login</a>
    <a href="viewusers.jsp">View Users</a>
    <a href="updateuserform.html">Update User</a>
    <a href="deleteuser.jsp">Delete User</a>
    <a href="calculatorform.html">Calculator</a>
</div>
<%
try
{
  Connection con = null;
  Class.forName("com.mysql.cj.jdbc.Driver");
  System.out.println("Driver Class Loaded");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp14", "root", "root");
  System.out.println("Connection Established"); 
    
  PreparedStatement pstmt = con.prepareStatement("select * from user");
  ResultSet rs = pstmt.executeQuery();
  %>
  <body bgcolor="#B6C4B6">
  <h3 align="center"><u>View Registered Users</u></h3>
  <table align="center" border="1">
    <tr bgcolor="#F0F0F0">
      <td>ID</td>
      <td>Full Name</td>
      <td>Gender</td>
      <td>Date of Birth</td>
      <td>Marital Status</td>
      <td>Email ID</td>
      <td>Contact No</td>
      <td>Action</td>
    </tr>
    
    <%
    if (!rs.isBeforeFirst()) {
      // If there are no rows in the ResultSet
      %>
      <tr>
        <td colspan="8" align="center">No records found</td>
      </tr>
      <%
    } else {
      // If there are rows in the ResultSet
      while (rs.next()) {
        %>
        <tr>
          <td><%=rs.getInt(1)%></td>
          <td><%=rs.getString(2)%></td>
          <td><%=rs.getString(3)%></td>
          <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(5)%></td>
          <td><%=rs.getString(6)%></td>
          <td><%=rs.getString(8)%></td>
          <td><button style="background-color: red;"><a href="userdeletion.jsp?id=<%=rs.getInt(1)%>">Delete</a></button></td>

      </tr>
        </tr>
        <%
      }
    }
    %>
  </table>
  </body>
  <% 
}
catch(Exception e)
{
  out.println(e);
}
%>
