


<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
        <link rel="stylesheet" media="screen,projection" type="text/css" href="main.css" />

        <style>
            select
            {
                height: 30px;
                width:150px;
            }

            img
            {
                width:150px;
                height:50px;
                margin-left: 70px;
                margin-top: -5px;
            }
            strong
            {
                position: absolute;
                right: 15px;
                top :35px

            }
        </style>

    </head>
    <body>
        <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg"> 
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>

        <div class="well">  <ul>

                <li><a href="viewprofileEmp.jsp">View Profile</a></li>
                <li><a href="PaySlipEmployee.jsp">View Pay Slip</a></li>
                <li><a href="leaveformEmployee.jsp">Apply Leave</a></li>
                <li><a href="Time_In.jsp">Time In</a></li>
                <li><a href="Time_out.jsp">Time Out</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <div class="well1">
            <% if (request.getParameter("user_name") != null) {
                    out.println("<ul style=\"list-style-type:disc;color:green; position: static;margin-left:5px;margin-top:20px;\"><li>" + request.getParameter("user_name") + "</li></ul>");
                } %>

            <h1> Selecting Data from DB </h1>


            <%!
                public class Employee {

                    String URL = "jdbc:mysql://localhost:3306/ayroll";
                    String USERNAME = "root";
                    String PASSWORD = "sharana";

                    Connection connection = null;
                    PreparedStatement selectEmployee = null;
                    ResultSet resultSet = null;

                    public Employee() {
                        try {

                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                            selectEmployee = connection.prepareStatement(
                                    "SELECT e.EmpID, e.EmpName, d.DID, d.Designation, d.BasicSal, d.Allowance, d.tax, SUM(a.Hours_worked) as Hours_worked FROM Employee e, Designation d, Attendance a  WHERE d.DID = e.DID AND e.EmpID=a.EmpID AND e.EmpID=?");

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                    public ResultSet getEmployee(String EmpID) {
                        try {
                            selectEmployee.setString(1, EmpID);
                            resultSet = selectEmployee.executeQuery();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        return resultSet;
                    }
                }
            %>

            <%
                String EmpID = new String();

                if (request.getParameter("EmpID") != null) {
                    EmpID = request.getParameter("EmpID");

                }

                Employee emp = new Employee();
                ResultSet resultSet = emp.getEmployee(EmpID);
            %>

            <form method="post" action="viewprofile.jsp">

                <table style="margin-left:40px;">
                    <tr><td>Employee ID : </td>
                        <td><input type="text" name="EmpID" value="" size="10" /></td>
                    </tr>
                </table>
            </form>
            <table border = " 1" bgcolor="biege" >
                <tr>
                    <td>Employee ID</td>
                    <td>Employee Name</td>
                    <td>Department</td>
                    <td>Designation</td>
                    <td>Basic Salary</td>
                    <td>Allowance(%)</td>
                    <td>Tax(%)</td>
                    <td>Hours Worked/Month</td>
                <br>
                </tr>

                <% while (resultSet.next()) {%>
                <tr>
                    <td><%= resultSet.getString("EmpID")%></td>
                    <td><%= resultSet.getString("EmpName")%></td>
                    <td><%= resultSet.getString("DID")%></td>
                    <td><%= resultSet.getString("Designation")%></td>
                    <td><%= resultSet.getFloat("BasicSal")%></td>
                    <td><%= resultSet.getFloat("Allowance")%></td>
                    <td><%= resultSet.getFloat("tax")%></td>
                    <td><%= resultSet.getInt("Hours_worked")%></td>

                </tr>

                <% } %>

            </table>



        </div>
        <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
    </body>
</html>