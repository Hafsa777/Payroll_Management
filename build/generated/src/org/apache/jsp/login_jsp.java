package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
 Class.forName("com.mysql.jdbc.Driver");  
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>GlassFish Login</title>\n");
      out.write("        <link rel=\"stylesheet\" media=\"screen,projection\" type=\"text/css\" href=\"./main.css\" />\n");
      out.write("        <style>\n");
      out.write("            input[type=\"text\"], input[type=\"password\"],select{\n");
      out.write("                height:20px;\n");
      out.write("                width: 175px;\n");
      out.write("      \n");
      out.write("            }\n");
      out.write("            td {           font-size: 18px;}\n");
      out.write("            select{        height:30px;\n");
      out.write("                           width: 190px;\n");
      out.write("                           font-family: sans-serif;}\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"well\" style=\"margin-top: 160px;height:350px;width:500px;margin-left:433px;\">\n");
      out.write("        <h3 align=\"center\">Payroll Management System</h3>\n");
      out.write("\n");
      out.write("        <form name=\"login\" action=\"login_.jsp\" method=\"POST\">\n");
      out.write("            <table border=\"0\" width=\"7\" cellspacing=\"4\" align=\"center\" cellpadding=\"6\" style=\"margin-left: 70px ;margin-top: 8px ;\">\n");
      out.write("                \n");
      out.write("                <tbody>\n");
      out.write("               \n");
      out.write("                   <tr>\n");
      out.write("                        <td>User Name: </td>\n");
      out.write("                        <td><input type=\"text\" name=\"username\" value=\"\" /></td>\n");
      out.write("                    </tr\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Password: </td>\n");
      out.write("                        <td><input type=\"password\" name=\"pass\" value=\"\" /></td>\n");
      out.write("                    </tr>  \n");
      out.write("                       \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Select: </td>   \n");
      out.write("                        <td>\n");
      out.write("                            <select name=\"select\">\n");
      out.write("                                <option>Admin</option>\n");
      out.write("                                <option>Manager</option>\n");
      out.write("                                <option>Employee</option>\n");
      out.write("                            </select>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th > <a href=\"login1.jsp\">Forgot Password?</a></th>  \n");
      out.write("                        <th><input class=\"btn\" style=\"margin-left: 20px;\" type=\"submit\" value=\"Submit\" name=\"submit\" /></th>\n");
      out.write("                    </tr>    \n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("    \n");
      out.write("   ");
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
