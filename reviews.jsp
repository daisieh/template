<%@ page import="db.Request,db.ViewState,social.Likes" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r);
	ViewState.setBaseFilter("reviews", "coho", r);
	r.site.newView("reviews", r).writeComponent();
	Likes.writeJavascriptFunctions(r.writer);
	r.close();
%>
