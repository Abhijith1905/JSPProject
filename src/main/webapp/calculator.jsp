<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Calculation Result</title>
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
    .output {
        font-size: 20px;
        font-weight: bold;
        margin-top: 20px;
    }
</style>
</head>
<body>
<div class="container">
<%
String v1 = request.getParameter("v1");
int a = Integer.parseInt(v1);
String v2 = request.getParameter("v2");
int b = Integer.parseInt(v2);

String op = request.getParameter("op");

if(op.equals("add"))
{
    out.println("<div class='output'>Output = " + (a + b) + "</div>");
}
else if(op.equals("sub"))
{
    out.println("<div class='output'>Output = " + (a - b) + "</div>");
}
else if(op.equals("mul"))
{
    out.println("<div class='output'>Output = " + (a * b) + "</div>");
}
else if(op.equals("div"))
{
    out.println("<div class='output'>Output = " + (a / b) + "</div>");
}
%>
</div>
</body>
</html>
