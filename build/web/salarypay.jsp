

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay Salary</title>
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

                <li><a href="viewprofileManager.jsp">View Profile</a></li>
                <li><a href="PaySlipManager.jsp">View Pay-Slip</a></li>
                <li><a href="leaveformManager.jsp">Apply Leave</a></li>
                <li><a href="Time_In.jsp">Time In</a></li>
                <li><a href="Time_out.jsp">Time Out</a></li>
                <li><a href="leave.jsp">Leave Requests</a></li>
                <li><a href="SearchMan.jsp">Search Employee</a></li> 
                <li><a href="displayemployeeManager.jsp">Employee List</a></li> 
                <li><a href="salarypay.jsp">Pay Salary</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <div class="well1">



            <% if (request.getParameter("id") != null) {
                    out.println("<ul style=\"list-style-type:disc;color:green; position: static;margin-left:5px;margin-top:20px;\"><li>" + request.getParameter("id") + "</li></ul>");
                } %>

            <form name="empDet" action="salarypay.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Employee ID : </td>
                            <td><input style="height:20px" type="text" name="EmpID" value="" size="10" /></td>
                            <td><input class = "btn" type="submit" value="Submit" name="submit" /></td>
                        </tr>
                    </tbody>
                </table>

            </form>
            <%!
                public class Employee {

                    String URL = "jdbc:mysql://localhost:3306/payroll";
                    String USERNAME = "root";
                    String PASSWORD = "sharana";

                    Connection connection = null;
                    PreparedStatement selectEmployee = null;
                    ResultSet resultSet = null;

                    public Employee() {
                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                            selectEmployee = connection.prepareStatement(
                                    "SELECT e.EmpID, e.EmpName, d.DID, d.Designation, d.BasicSal, d.Allowance,d.Bonus, d.tax, SUM(a.Hours_worked) as Hours_worked FROM Payroll.Employee e, Payroll.Designation d, Payroll.Attendance a WHERE d.DID = e.DID AND e.EmpID=a.EmpID AND e.EmpID = ?");

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
                    <td>Total Allowance</td>
                    <td>Total Deduction</td>
                    <td>Gross Salary</td>
                    <td>Net Salary</td>

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
                    <%double allowance = (resultSet.getFloat("BasicSal") * resultSet.getFloat("Allowance")) / 100;
                    double allowance2 = (resultSet.getFloat("BasicSal")* resultSet.getFloat("Bonus"))/100;
                        double deduction = (resultSet.getFloat("BasicSal") * resultSet.getFloat("tax")) / 100;
                        double gsal = resultSet.getFloat("BasicSal") + allowance + allowance2;
                        double netsal = gsal - deduction;%>
                    <td><%=allowance%></td>  
          
                    <td><%=deduction%></td>
                    <td><%=gsal%></td>
                    <td><%=netsal%></td>
                </tr>

                <% } %>



                <h2 style="text-align:center; margin-left: -450px; margin-top: -80px"><br>Pay Salary</h2>
                <FORM action="salarypay.jsp" method="get">
                    <TABLE style="margin-left:5px;align-content:center;width:100%;margin-top: 30px;border-spacing: 0.9em;font-family: tahoma" >
                        <TR>
                            <TH>Employee ID</TH>
                            <TD><INPUT style="height:20px"TYPE="text" NAME="Empid"></TD>
                        </tr>
                        <TR>
                            <TH>Salary ID</TH>
                            <TD><INPUT style="height:20px"TYPE="text" NAME="SalID"></TD>
                        </tr>
                        <TR>
                            <Th>Department ID</TH>
                            <TD><INPUT style="height:20px"TYPE="text" NAME="DID"></TD>
                        </tr>
                        <TR>
                            <Th>Net Salary</TH>
                            <TD><INPUT style="height:20px"TYPE="text" NAME="NetSal"></TD>
                        </tr>
                        <TR>
                            <TH>Month</TH>
                            <TD><INPUT style="height:20px"TYPE="text" NAME="MonthName"></TD>
                        </tr>
                        <TR>
                            <TH>Year</TH>
                            <TD><INPUT style="height:20px"TYPE="text" NAME="Year"></TD>
                        </tr>

                        <TR>
                            <TH></TH>
                            <TD><INPUT class="btn" TYPE="submit" VALUE="Submit"></TD>
                        </tr>
                    </TABLE>


                    <%
                        String Empid = request.getParameter("Empid");
                        String SalID = request.getParameter("SalID");
                        String DID = request.getParameter("DID");
                        String NetSal = request.getParameter("NetSal");
                        String MonthName = request.getParameter("MonthName");
                        String Year = request.getParameter("Year");

                        String connectionURL = "jdbc:mysql://localhost:3306/Payroll";
                        // declare a connection by using Connection interface 
                        Connection connection = null;
                        // declare object of Statement interface that uses for 
                        //executing sql statements.
                        PreparedStatement pstatement = null;
                        // Load JBBC driver "com.mysql.jdbc.Driver"
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        int updateQuery = 0;

                        // check if the text box is empty
                        if (Empid != null && SalID != null && DID != null
                                && NetSal != null && MonthName != null && Year != null) {
                            // check if the text box having only blank spaces
                            if (Empid != "" && SalID != "" && DID != ""
                                    && NetSal != "" && MonthName != "" && Year != "") {
                                try {

                                    connection = DriverManager.getConnection(connectionURL, "root", "msr");
                                    // sql query to insert values in the secified table.
                                    String queryString = "INSERT INTO Pay_Slip(EmpID, SalID, DID, NetSal,MonthName,Year) VALUES (?, ?, ?, ?, ?, ?)";
                                    /* createStatement() is used for create statement
                                  object that is used for 
                                    sending sql statements to the specified database. */
                                    pstatement = connection.prepareStatement(queryString);
                                    pstatement.setString(1, Empid);
                                    pstatement.setString(2, SalID);
                                    pstatement.setString(3, DID);
                                    pstatement.setString(4, NetSal);
                                    pstatement.setString(5, MonthName);
                                    pstatement.setString(6, Year);

                                    updateQuery = pstatement.executeUpdate();
                                    if (updateQuery != 0) { %>
                    <br>
                    <TABLE style="background-color: #E3E4FA;" 
                           WIDTH="30%" border="1">
                        <tr><th>Data is inserted successfully 
                                in database.</th></tr>
                    </table>
                    <%
                    }
                } catch (Exception ex) {%>
                    <TABLE style="background-color: #E3E4FA;" 
                           WIDTH="30%" border="1">
                        <tr><th>Salary already Allocated.</th></tr>
                    </table>

                    <% } finally {
                                    // close all the connections.
                                    pstatement.close();
                                    connection.close();
                                }
                            }
                        }
                    %>
                </FORM>

        </div>
        <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
    </body> 
</html>