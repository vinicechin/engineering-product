<%@ page import="java.text.*, java.io.*, java.util.*, javax.servlet.*" %>
<html>
	<body>
		<h1>${msg}</h1>
		<%
			String pattern = "MM-dd-yyyy";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			String date = simpleDateFormat.format(new Date());
			out.print( "<h2 align=\"center\">Today is " +date+"</h2>");
		%>
	</body>
</html>