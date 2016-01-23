<%@ page import="db.Request,db.ViewState,mosaic.MOSAIC,web.Button,web.Head" %>
<%
	Request r = new Request(request, response, out);
	Head head = r.site.newHead(r).javascriptInclude("gallery").styleSheet("gallery").style(".panel { margin-right: 20px; width: 300px; }");
	r.site.writePageOpen("People", head, r);
	r.writer.write("<div class=\"container\">");
	new Button(r.writer).addClass("disabled").setIcon("user").setId("list button").setOnClick("this.addClass('disabled');$('households button').removeClass('disabled');$('list').setStyle('display','block');$('households').setStyle('display','none');").write("Contact List");
	r.writer.nbsp().nbsp().nbsp();
	new Button(r.writer).setIcon("home").setId("households button").setOnClick("this.addClass('disabled');$('list button').removeClass('disabled');$('list').setStyle('display','none');var h=$('households');h.setStyle('display','flex');if(!h.getChildren().length)h.replace(context+'/Families/households')").write("Households");
	r.writer.write("<br /><br /><div id=\"list\">");
	ViewState.setBaseFilter("people", "coho AND active AND user_name != 'admin'", r);
	r.site.newView("people", r).writeComponent();
%>
	</div><div id="households" style="display:flex;flex-wrap:wrap;"></div><div>
	<script>Gallery.initialize();</script>
<%
	r.close();
%>
<br />
