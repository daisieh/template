<%@ page import="db.Request" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r.site.newHead(r).style("td.meeting { padding:0px 2px 0px 0px; width:100px }td.time { padding:2px 10px 2px 0px }"), r);
	r.writer.javascript("Asset.javascript(context+'/meetings.js')");
	r.site.newView("meetings", r).writeComponent();
	r.close();
%>
