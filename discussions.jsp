<%@ page import="db.Request,db.ViewState,social.Likes" %>
<%
	Request r = new Request(request, response);
	r.site.writePageOpen("", r);
	ViewState.setBaseFilter("discussions", "coho", r);
	r.site.newView("discussions", r).writeComponent();
	Likes.writeJavascriptFunctions(r.writer);
	r.close();
%>
