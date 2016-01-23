<%@ page import="db.Request,social.News,calendar.CalendarView,calendar.ListView" %>
<%
	Request r = new Request(request, response, out);
	r.site.writePageOpen("Home", r.site.newHead(r).javascriptInclude("gallery").styleSheet("gallery").style(".calendar_component{width:400px;}"), r);
%>
<div class="container">
<div class="row">
<div class="col-md-6">
<%
	News news = (News)r.site.getModule("News");
	news.writeStatusForm(r);
	news.writeItems("coho", r);
%>
</div>
<div class="col-md-6">
<%
	((ListView)CalendarView.getInstance("Main Calendar", "upcoming", CalendarView.View.LIST, r)).setNumEvents(20).setAllowViewSwitching(false).writeComponent(r);
%>
</div>
</div>
</div>
<script>Gallery.initialize({show_comments:true,url_base:context+'/pictures'});</script>
<%
	r.close();
%>