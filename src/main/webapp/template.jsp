<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<table class="basic" style="background-color: greenyellow; font-size: small;">
<%
	String databaseURL = "jdbc:db2://192.168.209.244:50000/SAMPLE";
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Properties properties = new Properties();
	properties.put("user", "db2inst1");
	properties.put("password", "db2inst1pw");
	properties.put("retreiveMessagesFromServerOnGetMessage", "true");
	Connection db2Conn = DriverManager.getConnection(databaseURL, properties);

	PreparedStatement statement = db2Conn.prepareStatement(request.getParameter("query"));
	ResultSet resultSet = statement.executeQuery();

	ResultSetMetaData resultMetaData = resultSet.getMetaData();
	int colCount = resultMetaData.getColumnCount();
%>
<tr style="font-weight: bold;">
	<%
		for (int i = 0; i < colCount; i++) {
			out.println("<td>");
			out.println(resultMetaData.getColumnName(i + 1));
			out.println("</td>");
		}
	%>
</tr>
<%
	while (resultSet.next()) {
		out.println("<tr>");
		for (int i = 0; i < colCount; i++) {
			out.println("<td>");
			out.println(resultSet.getString(i + 1));
			out.println("</td>");
		}
		out.println("</tr>");
	}
%>
</table>