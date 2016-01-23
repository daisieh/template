<%@ page import="db.Request,calendar.CalendarView" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("Calendars", r);
	CalendarView.getInstance("Main Calendar", CalendarView.View.MONTH, r).writeComponent(r);
	r.close();
%>
