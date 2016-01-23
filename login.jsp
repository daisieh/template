<%@ page import="calendar.CalendarView,calendar.ListView,db.Request,java.sql.ResultSet,mosaic.Blackboard,web.Head" %>
<%
	Request r = new Request(request, response, out);
	Head head = r.site.newHead(r).javascriptInclude("slideshow").javascriptInclude("slideshow.kenburns").styleSheet("slideshow").style(
		".event {cursor: default !important;}.slideshow {background: url("+r.getContext()+"/images/slideshow.gif) no-repeat;height: 548px;width: 560px;}.slideshow-images {left: 15px;height: 400px;top: 14px;width: 500px;}").favIcon();
	r.writer.setAttribute("class", "login");
	head.close();
%>
	<span id="top"></span>
	<script type="text/javascript">
	if($('top').getParent().get('tag')!='body')
		document.location=document.location;
	window.addEvent('domready', function(){
	    var data = [
<%
		ResultSet rs = r.db.select("SELECT file FROM pictures WHERE coho ORDER BY random() LIMIT 20");
		String first = null;
		while (rs.next()) {
			if (rs.isFirst())
				first = rs.getString(1);
			r.writer.write("'");
			r.writer.write(rs.getString(1));
			r.writer.write("'");
			if (!rs.isLast())
				r.writer.write(",");
		}
%>
	];
<%
		if (first != null) {
%>
	new Slideshow.KenBurns('show', data, { captions: false, controller: false, delay: 5000, duration: 2000, height: 400, hu: context+'/pictures/', 'replace': [/^(.*)$/, 'thumbs/$1'], overlap: true, thumbnails: false, width: 500 });
<%
		}
%>
	});
	</script>
<%
	Blackboard blackboard = (Blackboard)r.site.getModule("Blackboard");
	if (blackboard != null)
		blackboard.writeComponent(r);
	else {
%>
	<table style="width:100%;height:224px;">
		<tr><td style="text-align:center;"><img src="<%=r.getContext()%>/images/banner.png" /></td></tr>
	</table>
<%
	}
	r.site.writeLoginForm(r);
%>
<br />
<br />
<table style="margin:0 auto;"><tr><td style="vertical-align:top;width:400px;">
<%
	r.writer.write("<div style=\"text-align:center;\"><h3>Today</h3></div>");
	CalendarView.getInstance("Main Calendar", "today", CalendarView.View.TODAY, r).writeComponent(r);
	r.writer.write("</td><td style=\"vertical-align:top;width:400px;\">");
	r.writer.write("<div style=\"text-align:center;\"><h3>Upcoming</h3></div>");
	java.util.Calendar c = r.newCalendar();
	c.add(java.util.Calendar.DATE, 1);
	((ListView)CalendarView.getInstance("Main Calendar", "upcoming", CalendarView.View.LIST, r)).setNumEvents(20).setAllowViewSwitching(false).setDate(c).writeComponent(r);
	if (first != null) {
%>
</td><td style="vertical-align:top;">
  <div style="text-align:center;width:500px;"><h3>Photos</h3></div>
  <div id="show" class="slideshow" style="display: block; position: relative; z-index: 0;"> 
    <img src="<%= r.getContext() %>/pictures/<%= first %>" style="height:300px;max-width:none;width:396px;" /> 
  </div> 
<%
	}
	r.removeSessionAttributes("CalendarState:");
%>
</td></tr>
</table>
<%
	r.close();
%>
