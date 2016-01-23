<%@ page import="db.Request,surveys.Surveys" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r);
	Surveys.write(r);
	r.close();
%>
