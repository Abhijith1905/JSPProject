<%@ page import="java.sql.*"%>

<%

int uid = Integer.parseInt(request.getParameter("id")); // id is parameter name
try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp14", "root", "root");
    System.out.println("Connection Established");
    
    String qry = "delete from user where id = ?";
    PreparedStatement pstmt = con.prepareCall(qry);
    
    pstmt.setInt(1,uid);
    int n = pstmt.executeUpdate();
 	// check if n>0, if it is true print message as deleted successfully 
    // else user id not found
    if(n>0)
    {
    	/* out.println("User Deleted"); */
    	response.sendRedirect("deleteuser.jsp");
    }
    else
    {
    	out.println("User ID Not Found");
    }
}
catch(Exception e)
{
	out.println(e);
}
%>