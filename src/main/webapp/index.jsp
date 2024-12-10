<%!
//variables
int a= 20,b=30;
//method
public int add(int x, int y)
{
	return x+y;
}
%>
<%
System.out.println("Output="+add(a,b)); //console
out.println("Output="+add(a,b)); // implicit object - browser
%>
<br>
<b>a:<%=a %></b><br>
<b>b:<%=b %></b><br>
<b>Output:<%=add(a,b) %></b><br>
