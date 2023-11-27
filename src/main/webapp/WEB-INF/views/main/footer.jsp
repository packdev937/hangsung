<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">
			<%
			response.setIntHeader("Refresh", 5);
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시각: " + CT + "\n");
			%>
		</div>
		<p class="m-0 text-center text-white">Copyright &copy; hangsung 2023</p>
	</div>
</footer>