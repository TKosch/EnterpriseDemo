<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<html>
<body>
	<h2 style="text-align: center;">Hello. This is an Enterprise Demo!</h2>
	<h3 style="text-align: center;">List of all Employees of the DB2 Sample Table</h3>
	<p>
	<table style="width: 100%">
		<%
			String databaseURL = "jdbc:db2://192.168.209.244:50000/SAMPLE";
			String query = "SELECT * from EMPLOYEE";
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Properties properties = new Properties();
			properties.put("user", "db2inst1");
			properties.put("password", "db2inst1pw");
			properties.put("retreiveMessagesFromServerOnGetMessage", "true");
			Connection db2Conn = DriverManager.getConnection(databaseURL, properties);

			PreparedStatement statement = db2Conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			ResultSetMetaData resultMetaData = resultSet.getMetaData();
			int colCount = resultMetaData.getColumnCount();
		%>
		<tr style="font-weight: bold;">
			<%
				for (int i = 0; i < colCount; i++) {
			%>
			<td>
				<%
					out.println(resultMetaData.getColumnName(i + 1));
				%>
			</td>

			<%
				}
			%>
		</tr>
		<%
			while (resultSet.next()) {
		%>
		<tr>
			<%
				for (int i = 0; i < colCount; i++) {
			%>
			<td>
				<%
					out.println(resultSet.getString(i + 1));
				%>
			</td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
	</p>
</body>
</html>
