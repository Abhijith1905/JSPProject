<%@ page import = "java.sql.*"%>
<%

String email = request.getParameter("email");
String pwd = request.getParameter("pwd");


try
{
	Connection con = null;
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://root:CMwJnspnMniPqVlHYJihHZIkgjItNLKj@junction.proxy.rlwy.net:30183/railway", "root", "CMwJnspnMniPqVlHYJihHZIkgjItNLKj");
    System.out.println("Connection Established");
    
    String qry = "select * from user where email = ? and password = ? ";
    PreparedStatement pstmt = con.prepareStatement(qry);
    pstmt.setString(1,email);
    pstmt.setString(2,pwd);
    ResultSet rs = pstmt.executeQuery();
    if(rs.next())
    {
    	//out.println("Login Success"); 

    	String fullname = rs.getString("fullname");
    	String contact = rs.getString("contactno");
    	
    	// session variables
    	session.setAttribute("fullname", fullname);
    	session.setAttribute("contact", contact);
    	session.setAttribute("email", email);
    	
    // 	session.setMaxInactiveInterval(5);  // 5 seconds
    	
    	response.sendRedirect("userhome.jsp");
    }
    else
    {
    	//out.println("Login Failed");
    	response.sendRedirect("loginfail.html");
    }
    
}
catch(Exception e)
{
	out.println(e);
}
%>