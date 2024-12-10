<%
String fullname = (String) session.getAttribute("fullname");
String contact = (String) session.getAttribute("contact");
String email = (String) session.getAttribute("email");
if (fullname == null || contact == null || email == null) {
    response.sendRedirect("sessionexpiry.html");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>User Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #B6C4B6;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
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
    h3 {
        text-align: center;
        margin-bottom: 20px;
    }
    .content {
        text-align: center;
        margin-top: 20px;
    }
    .user-details {
        margin: 20px auto;
        width: 50%;
        padding: 20px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .user-details p {
        font-size: 18px;
        margin: 10px 0;
    }
</style>
</head>
<body>
    <h1>JSP Web Application</h1>
    <hr color="black"><hr color="black"><br>
    <div class="menubar">
        <a href="userhome.jsp">Home</a>&nbsp;&nbsp;&nbsp;
        <a href="userlogout.jsp">Logout</a>&nbsp;&nbsp;&nbsp;
    </div>
    <div class="content">
        <h3>I am in User Home</h3>
        <div class="user-details">
            <p><strong>Full Name:</strong> <%= fullname %></p>
            <p><strong>Email ID:</strong> <%= email %></p>
            <p><strong>Contact:</strong> <%= contact %></p>
        </div>
    </div>
</body>
</html>
