<%@ page import="db.Request" %>
<%@ page isErrorPage="true" %>
<%
	Request r = new Request(request, response, out);
	try {
		ErrorData ed = pageContext.getErrorData();
		r.writer.write("page ").write(ed.getRequestURI()).write(" not found.<br /><br />");
	} catch(NullPointerException ne) {
	    // If the error page was accessed directly, a NullPointerException
	    // is thrown at (PageContext.java:514).
	    // Catch and ignore it... it effectively means we can't use the ErrorData
	}
	r.writer.a(r.site.getDisplayName() + " Home Page", r.getContext() + "/" + r.site.getDefaultPage());
%>