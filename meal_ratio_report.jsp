<%@page import="meals.MealEventProvider,meals.MealRatioRenderer,db.Request,db.Option,java.util.List" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("", r);
	List<String[]> families = r.db.readRows("SELECT id,name FROM families ORDER BY name");
	r.writer.write("<table border=\"1\"><tr><th>family</th><th># adult meals / # times worked</th</tr>");
	for (String[] family : families) {
		r.writer.write("<tr><td>");
		r.writer.write(family[1]);
		r.writer.write("</td><td>");
		MealRatioRenderer.writeRatio(family[0], ((MealEventProvider)r.site.getModule("Common Meals")).getJobs(), true, r);
		r.writer.write("</td></tr>");
	}
	r.writer.write("</table>");
	r.close();
%>
