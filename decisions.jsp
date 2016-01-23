<%@ page import="db.Request" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r);
	r.site.newView("decisions", r).writeComponent();
	r.close();
%>
