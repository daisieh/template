<%@ page import="db.Request,db.ViewState,social.Likes" %>
<%
	Request r = new Request(request, response);
	r.site.writePageOpen("Recipes", r);
	ViewState.setBaseFilter("recipes", "coho", r);
	r.site.newView("recipes", r).setColumnNamesTable(new String[] { "title", "families_id" }).writeComponent();
	Likes.writeJavascriptFunctions(r.writer);
	r.close();
%>
