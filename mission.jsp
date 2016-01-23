<%@ page import="db.Request,mosaic.MOSAIC" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r);
	String mission_statement = r.site.getSettings().getString("mission statement");
	String vision = r.site.getSettings().getString("vision");
%>
<div style="width:960px;margin-left:auto;margin-right:auto;">
<%
	if (mission_statement != null) {
%>
<h3>Mission Statement</h3>
<p class="article">
<%
	r.writer.write(mission_statement);
%>
</p>
<%
	}
	if (vision != null) {
%>
<h3>Vision</h3>
<p class="article">
<%
	r.writer.write(vision);
%>
</p>
<%
	}
	if (r.db.countRows("values", null) > 0) {
%>
<h3>Values</h3>
<%
		r.site.newView("values", r).writeComponent();
	}
%>
</div>
<%
	r.close();
%>
