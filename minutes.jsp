<%@ page import="db.Request,db.View" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r);
	r.writer.write("<div class=\"container minutes\">");
	r.site.newView("minutes", r).setMode(View.Mode.READ_ONLY_LIST).writeComponent();
	r.writer.write("</div>");
	r.close();
%>
