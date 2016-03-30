<%@ page import="db.Request,db.Query,email.MailHandler,email.MailLists,mosaic.MOSAIC,java.sql.ResultSet" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("email", r.site.newHead(r).style("tr.lists:hover{background-color:#bbb}table.email{margin:0 auto;}table.email td{padding:30px;}"), r);
	if ("show_inactive_lists".equals(r.getParameter("action")))
		r.setSessionAttribute("show inactive lists", true);
%>
<script>
	function toggle(c, list_id) {
		if (c.checked) // just changed to
			XHR_post(context + '/MailLists', 'cmd=subscribe&list_id=' + list_id);
		else
			XHR_post(context + '/MailLists', 'cmd=unsubscribe&list_id=' + list_id);
	}
</script>
<table class="email">
<%
	if (r.site.getSettings().getBoolean("show send email to community members link")) {
%>
	<tr>
		<td style="border-bottom: 1px solid #999"><a href="send_email.jsp" class="btn btn-default btn-xs">send email to community members</a></td>
	</tr>
<% } %>
	<tr>
		<td>
			<table class="table table-condensed table-hover">
				<thead>
					<tr>
						<th style="padding-right: 10px">send email to list</th>
						<th style="padding-left: 10px; padding-right: 10px">list archives</th>
						<th style="padding-left: 10px">subscribed</th>
					</tr>
				</thead>
				<%
					MailLists mail_lists = (MailLists)r.site.getModule("MailLists");
					mosaic.Person user = (mosaic.Person)r.getUser();
					int user_id = user.getId();
					Query query = new Query("mail_lists.id,mail_lists.name,mail_lists_people.mail_lists_id",
						"mail_lists LEFT JOIN mail_lists_people ON (mail_lists_people.mail_lists_id=mail_lists.id AND mail_lists_people.people_id=" + user_id + ") ",
						r.testSessionFlag("show inactive lists") ? null : "mail_lists.active", "name");
					ResultSet rs = r.db.select(query);
					while (rs.next()) {
						String list = rs.getString(2);
						r.writer.write("<tr class=\"lists\"><td>");
						r.writer.a(list, "mailto:" + list + "@" + r.site.getSettings().getString("mail list domain"));
						r.writer.write("</td><td style=\"text-align:center\">");
						r.writer.aButtonOnClick("view", "document.location=context+'/MailLists?list=" + list + "'");
						r.writer.write("</td><td style=\"text-align:center\">");
						MailHandler mail_handler = mail_lists.getMailHandler(list, r.db);
						if (mail_handler != null)
							mail_handler.writeSubscribeInput(r);
						else {
							r.writer.setAttribute("onchange", "toggle(this," + rs.getInt(1) + ");return false");
							r.writer.checkbox(null, null, rs.getString(3) != null, true);
						}
						r.writer.write("</td></tr>");
					}
					rs.getStatement().close();
				%>
			</table>
		</td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #999">
			<%
				if (!r.testSessionFlag("show inactive lists") && r.db.rowExists("mail_lists", "NOT active")) {
			%> <a href="email.jsp?action=show_inactive_lists" class="btn btn-default btn-xs">show inactive lists</a> <%
	}
%>
		</td>
	</tr>
</table>
<br />
<%
	r.close();
%>
