

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
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
        <title>Pay Slip</title>
    </head>
    <body>
        <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>   


        <div class="well">  <ul>
                <li><a href="displayemployee.jsp">View Profile</a></li>
                <li><a href="PaySlip.jsp">View Pay-Slip</a></li>
                <li><a href="leave form.jsp">Apply Leave</a></li>
                <li><a href="updateEmployee.jsp">Employee Details</a></li>
                <li><a href="InsertDesignation.jsp">Designation Details</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <div class="well1">

            <% if (request.getParameter("user_name") != null) {
                       out.println("<ul style=\"list-style-type:disc;color:red; position: static;margin-left:5px;margin-top:20px;\"><li>" + request.getParameter("user_name") + "</li></ul>");
                   %>

            <h2> View Pay Slip</h2>

            <%!
                public class payslip {

                    String URL = "jdbc:mysql://localhost:3306/payroll";
                    String USERNAME = "root";
                    String PASSWORD = "sharana";

                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet resultSet = null;

                    public payslip() {
                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                            statement = connection.prepareStatement(
                                    "SELECT EmpID,TimeIn, TimeOut, TIMESTAMPDIFF(HOUR,TimeIn, TimeOut) as Hours Worked from Attendance where EmpID=?");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                    public ResultSet getpayslip(String EmpID) {
                        try {
                            statement.setString(1, EmpID);

                            resultSet = statement.executeQuery();
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

                payslip emp = new payslip();
                ResultSet resultSet = emp.getpayslip(EmpID);
            %>          


            <form method="post" action="MubinaTime.jsp">

                <table style="margin-left:40px;">
                    <tr><td>Employee ID : </td>
                        <td><input type="text" name="EmpID" value="" size="10" /></td>
                    </tr>

                    <tr><td/><td><button class="btn" type="submit">View Times</button></td></tr>    
                </table>
            </form>
            <table border = " 1" bgcolor="biege" >
                <tr>
                    <td>Employee ID</td>
                    <td>Time In</td>
                    <td>Time Out</td>
                    <td>Hours Worked</td>
                    
                </tr>
                
                <% while (resultSet.next()) {%>
                <tr>
                    <td><%= resultSet.getString("EmpID")%></td>
                    <td><%= resultSet.getString("TimeIn")%></td>
                    <td><%= resultSet.getString("TimeOut")%></td>
                    <td><%= resultSet.getInt("Hours Worked")%></td>
                   
                    <% } %>
            <%--while (resultSet.next()) {
                    int hours = resultSet.getInt("Hours Worked");
                    int ot= hours - 8;
                    int otrate;
                    int ltrate = (-200*ot);
                    
                    if(ot > 0)
                        otrate=resultSet.getInt("OT") *200;
                    double allowance = (resultSet.getFloat("BasicSal") * resultSet.getFloat("Allowance")) / 100;
                    double allowance2 = (resultSet.getFloat("BasicSal") * resultSet.getFloat("Bonus")) / 100;
                    double deduction = (resultSet.getFloat("BasicSal") * resultSet.getFloat("tax")) / 100;
                    double gsal = resultSet.getFloat("BasicSal") + allowance + allowance2;
                    double netsal = gsal - deduction;
            --%>
           


            </table> 


        </div>
        <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
    </body>
</html>



