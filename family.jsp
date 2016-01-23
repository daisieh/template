<%@ page import="db.Request,mosaic.Families" %>
<%
	Request r = new Request(request, response);
	((Families)r.site.getModule("Families")).handleRequest(r);
	r.close();
%>
