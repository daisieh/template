<%@ page import="db.Request,db.ViewState,email.EMailForm" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r.site.newHead(r), r);
	ViewState.setBaseFilter("emailform:people", "active AND coho AND email IS NOT NULL", r);
	((EMailForm)r.site.getModule("EMailForm")).write(true, true, r);
	r.close();
%>
