<%@ page import="db.Request,web.NavList,mosaic.MOSAIC" %>
<%
	Request r = new Request(request, response, out);

	r.site.writePageOpen("Docs", r.site.newHead(r).style("table.documents{margin:0 auto;}"), r);
	String main_meeting = r.site.getSettings().getString("main meeting");
	if (main_meeting == null)
		main_meeting = "Business Meeting";
	String mission_statement = r.site.getSettings().getString("mission statement");
	String vision = r.site.getSettings().getString("vision");
	boolean has_values = r.db.countRows("values", null) > 0;
%>
<table class="documents"><tr><td class="documents_line" style="vertical-align:top;padding:30px;">
<%
	NavList nav_list = new NavList(r.writer).setVerticalPadding(5).open();
	if (mission_statement != null || vision != null || has_values) {
		StringBuilder text = new StringBuilder();
		if (mission_statement != null)
			text.append("Mission Statement");
		if (vision != null) {
			if (mission_statement != null)
				if (!has_values)
					text.append(" and ");
				else
					text.append(", ");
			text.append("Vision");
		}
		if (has_values) {
			if (mission_statement != null || vision != null)
				text.append(" and ");
			text.append("Community Values");
		}
		nav_list.a(text.toString(), "mission.jsp");
	}
	if (r.db.countRows("minutes", null) > 0)
		nav_list.a(main_meeting + " Minutes", "minutes.jsp");
	if (r.site.getModule("Decisions") == null) // should probably change to checking for page in sitemenu instead of module
		nav_list.a("Community Decisions", "decisions.jsp");
	nav_list.close();
	MOSAIC.writeDocumentsPageMainDocs(nav_list, r);
%>
</td><td style="padding:30px;vertical-align:top;">
<%
	MOSAIC.writeDocumentsPageGroupDocs(r);
%>
</tr></table><br />
<%
	r.close();
%>
