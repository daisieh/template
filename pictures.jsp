<%@ page import="db.Request,db.ViewState,pictures.Pictures" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("Pictures", r.site.newHead(r).javascriptInclude("gallery").styleSheet("gallery"), r);
	r.writer.write("<table style=\"width:100%;height:100%;\"><tr><td style=\"vertical-align:top;width:150px;padding:0 10px;\">");
	ViewState.setBaseFilter("pictures owners", "pictures.coho", r);
	ViewState.setBaseFilter("pictures tags", "pictures.coho", r);
	((Pictures)r.site.getModule("Pictures")).writeNavList(r);
	r.writer.write("</td><td style=\"vertical-align:top;padding-right:10px;\">");
	ViewState.setBaseFilter("pictures", "coho", r);
	r.site.newView("pictures", r).writeComponent();
	r.writer.write("</td></tr></table>");
	r.close();
%>
