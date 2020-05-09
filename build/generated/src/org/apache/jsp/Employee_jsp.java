package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Employee_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    public class Employee{
        String URL = "jdbc:mysql://localhost:3306/payroll";
        String USERNAME = "root";
        String PASSWORD = "sharana";

        Connection connection = null;
        PreparedStatement selectEmployee = null;
        ResultSet resultSet = null;

        public Employee(){
            try{
                connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                selectEmployee = connection.prepareStatement(
                      "SELECT e.EmpID, e.EmpName, d.DID, d.Designation, d.BasicSal, d.Allowance, d.tax, SUM(a.Hours_worked) as Hours_worked FROM Payroll.Employee e, Payroll.Designation d, Payroll.Attendance a WHERE d.DID = e.DID AND e.EmpID=a.EmpID AND e.EmpID = ?");

            } catch (Exception e){
                e.printStackTrace();
            }
}

        public ResultSet getEmployee(String EmpID){
            try{
                selectEmployee.setString(1, EmpID); 
                resultSet = selectEmployee.executeQuery();
            } catch (Exception e){
                e.printStackTrace();
            }
            
            return resultSet;
        }
}

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
      response.setContentType("text/html");
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
      out.write("\n");
      out.write("\n");
 Class.forName("com.mysql.jdbc.Driver");
      out.write("\n");
      out.write("<html>\n");
      out.write("   \n");
      out.write("    <body bgcolor=\"beige\">\n");
      out.write("<h1> Selecting Data from DB </h1>\n");
      out.write("\n");
      out.write('\n');
      out.write('\n');

    String EmpID = new String();
    
    if(request.getParameter("EmpID") != null){
        EmpID = request.getParameter("EmpID");
    }
    
    Employee emp = new Employee();
    ResultSet resultSet = emp.getEmployee(EmpID);

      out.write("\n");
      out.write("\n");
      out.write("<table border = \" 1\" bgcolor=\"biege\" >\n");
      out.write("    <tr>\n");
      out.write("        <td>Employee ID</td>\n");
      out.write("        <td>Employee Name</td>\n");
      out.write("        <td>Department</td>\n");
      out.write("        <td>Designation</td>\n");
      out.write("        <td>Basic Salary</td>\n");
      out.write("        <td>Allowance(%)</td>\n");
      out.write("        <td>Tax(%)</td>\n");
      out.write("        <td>Hours Worked/Month</td>\n");
      out.write("    <br>\n");
      out.write("    </tr>\n");
      out.write("    \n");
      out.write("    ");
 while(resultSet.next()) { 
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print( resultSet.getString("EmpID"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getString("EmpName"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getString("DID"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getString("Designation"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getFloat("BasicSal"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getFloat("Allowance"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getFloat("tax"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print( resultSet.getInt("Hours_worked"));
      out.write("</td>\n");
      out.write("        \n");
      out.write("    </tr>\n");
      out.write("    \n");
      out.write("    ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("    <br>\n");
      out.write("<h2>Employee Salary Calculation</h2>\n");
      out.write(" \n");
      out.write(" <h3>Enter Employee Details:<h3>\n");
      out.write(" <form action=\"EmployeeSal.jsp\" method=\"POST\" >\n");
      out.write(" <table >\n");
      out.write(" <tr><td>Employee ID:</td><td><input type=\"text\" name=\"EmpID\" autofocus></td></tr>   \n");
      out.write(" <tr><td>Employee Name:</td><td><input type=\"text\" name=\"EmpName\"></td></tr>\n");
      out.write(" <tr><td>Department:</td><td><input type=\"text\" name=\"DID\"></td></tr>\n");
      out.write(" <tr><td>Designation:</td><td><input type=\"text\" name=\"Designation\"></td></tr>\n");
      out.write(" <tr><td>Basic Salary:</td><td><input type=\"text\" name=\"BasicSal\"></td></tr>\n");
      out.write(" <tr><td>Allowance(%):</td><td><input type=\"text\" name=\"Allowance\"></td></tr>\n");
      out.write(" <tr><td>Tax(%):</td><td><input type=\"text\" name=\"tax\"></td></tr>\n");
      out.write(" <tr><td>Hours Worked / Month:</td><td><input type=\"text\" name=\"Hours_worked\"></td></tr>\n");
      out.write("\n");
      out.write(" \n");
      out.write(" <tr>\n");
      out.write("     <td><br><input type=\"submit\" value=\"Evaluate\"></td>\n");
      out.write("     <td><br><input type=\"reset\" value=\"Reset\"></td>\n");
      out.write(" </tr>\n");
      out.write(" \n");
      out.write(" </table>\n");
      out.write(" </form>\n");
      out.write(" </body>\n");
      out.write("</html>");
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
