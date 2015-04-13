<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Enterprise Demo</title>
	<style type="text/css">
		.basic {
			margin: 0 auto;
			padding: 10px;
			text-align: center;
			width: 75%;
		}
	</style>
	<script src="jquery-1.11.2.min.js"></script>
	<script>
		$(document).ready(function () {
			function performAjax(url) {
				$("#result").html('<div class="basic" style="background-color: yellow;">loading ...</div>');
				$.ajax({
					url: url,
					success: function(data) {
						$("#result").html(data);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						$("#result").html('<div class="basic" style="background-color: red;">' + textStatus + '</div>');
					},
					timeout: 1500
				});
			}

			$("#version").click(function () {
				performAjax("version.jsp");
			});

			$("#sampleData").click(function () {
				performAjax("sampleData.jsp");
			});

			$("#reset").click(function () {
				$("#result").html('<div class="basic" style="background-color: lightgray;">no result</div>');
			});

			$("#reset").trigger("click");
		});
	</script>
</head>
<body>
	<div style="text-align: center;">
		<h2>Hello. This is an Enterprise Demo!</h2>
		<form>
			<button id="sampleData" onClick="return false;">Get Employees</button>
			<button id="version" onClick="return false;">Get Version</button>
			<button id="reset" onClick="return false;">Reset</button>
		</form>
	</div>
	<br />
	<div id="result" style="width: 100%;">
		<div class="basic" style="background-color: red;">no javascript</div>
	</div>
</body>
</html>
