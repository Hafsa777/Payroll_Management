package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class WelcomeAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" media=\"screen,projection\" type=\"text/css\" href=\"main.css\" />\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            img\n");
      out.write("            {\n");
      out.write("                width:150px;\n");
      out.write("                height:50px;\n");
      out.write("                margin-left: 70px;\n");
      out.write("                margin-top: -5px;\n");
      out.write("            }\n");
      out.write("            strong\n");
      out.write("            {\n");
      out.write("                position: absolute;\n");
      out.write("                right: 15px;\n");
      out.write("                top :35px\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 if(session.getAttribute("user_name")!=null){ 
      out.write("\n");
      out.write("        <img src=\"gf.jpeg\">\n");
      out.write("        <strong>");
 out.println("Welcome "+session.getAttribute("user_name"));
      out.write("</strong>\n");
      out.write("\n");
      out.write("        <div class=\"well\">  <ul>\n");
      out.write("                <li><a href=\"viewprofile.jsp\">View Profile</a></li>\n");
      out.write("                <li><a href=\"PaySlip.jsp\">View Pay-Slip</a></li>\n");
      out.write("                <li><a href=\"leave form.jsp\">Apply Leave</a></li>\n");
      out.write("                <li><a href=\"Time_In.jsp\">Time In</a></li>\n");
      out.write("                <li><a href=\"Time_out.jsp\">Time Out</a></li>\n");
      out.write("                 <li><a href=\"displayemployee.jsp\">Employee List</a></li> \n");
      out.write("                 <li><a href=\"Search.jsp\">Search Employee</a></li> \n");
      out.write("                <li><a href=\"addEmployee.jsp\">Add Employee</a></li>\n");
      out.write("                <li><a href=\"updateEmployee.jsp\">Update Employee</a></li>\n");
      out.write("                <li><a href=\"deleteEmployee.jsp\">Delete Employee</a></li>\n");
      out.write("                <li><a href=\"InsertDesignation.jsp\">Designation Details</a></li>\n");
      out.write("                <li><a href=\"logout.jsp\">Logout</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"well1\">\n");
      out.write("            ");
 if(request.getParameter("id")!=null)out.println("<ul style=\"list-style-type:disc;color:green; position: static;margin-left:5px;margin-top:20px;\"><li>"+request.getParameter("id")+"</li></ul>"); 
      out.write("\n");
      out.write("        </div>\n");
      out.write("        ");
 }
          else
          {
              response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
          }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
