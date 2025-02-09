<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update User</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #B6C4B6;
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container {
        text-align: center;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h3 {
        color: green;
    }
    h3.error {
        color: red;
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
    .button:hover {
        background-color: #ddd;
        color: black;
    }
</style>
</head>
<body>
<div class="container">
<%
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String mstatus = request.getParameter("mstatus");
String pwd = request.getParameter("pwd");

try {
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://my-db-server-31277.mysql.database.azure.com:3306/jsp-project-db?useSSL=true", "abhijith", "Sriram8585");
    System.out.println("Connection Established");

    String qry = "update user set fullname = ?, maritalstatus = ?, password =? where id =?";
    PreparedStatement pstmt = con.prepareCall(qry);
    pstmt.setString(1, name);
    pstmt.setString(2, mstatus);
    pstmt.setString(3, pwd);
    pstmt.setInt(4, id); 
    int n = pstmt.executeUpdate();
    
    if (n > 0) {
%>
        <h3>User Updated Successfully</h3>
        <a href="updateuserform.html" class="button">Back</a>
<% 
    } else {
%>
        <h3 class="error">User ID Not Found</h3>
        <a href="updateuserform.html" class="button">Try Again</a>
<% 
    }
} catch (Exception e) {
    out.println(e);
}
%>
</div>
</body>
</html>
