
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Designation</title>
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

                <li><a href="viewprofile.jsp">View Profile</a></li>
                <li><a href="PaySlip.jsp">View Pay-Slip</a></li>
                <li><a href="leave form.jsp">Apply Leave</a></li>
                <li><a href="Time_In.jsp">Time In</a></li>
                <li><a href="Time_out.jsp">Time Out</a></li>
                 <li><a href="displayemployee.jsp">Employee List</a></li> 
                 <li><a href="Search.jsp">Search Employee</a></li> 
                <li><a href="addEmployee.jsp">Add Employee</a></li>
                <li><a href="updateEmployee.jsp">Update Employee</a></li>
                <li><a href="deleteEmployee.jsp">Delete Employee</a></li>
                <li><a href="InsertDesignation.jsp">Designation Details</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
        <div class="well1">
            <% if (request.getParameter("id") != null) {
                       out.println("<ul style=\"list-style-type:disc;color:green; position: static;margin-left:5px;margin-top:20px;\"><li>" + request.getParameter("id") + "</li></ul>");
                   } %>

            <h2 style="text-align:center; margin-left: -450px"><br>Add a Designation</h2>
            <FORM action="InsertDesignation.jsp" method="get">
                <TABLE style="margin-left:5px;align-content:center;width:100%;margin-top: 30px;border-spacing: 0.9em;font-family: tahoma" >
                    <TR>
                        <TH>DID</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="DID"></TD>
                    </tr>
                    <TR>
                        <TH>Designation</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="Designation"></TD>
                    </tr>
                    <TR>
                        <Th>Basic Salary</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="BasicSal"></TD>
                    </tr>
                    <TR>
                        <Th>Allowance</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="Allowance"></TD>
                    </tr>
                    <TR>
                        <TH>Tax</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="tax"></TD>
                    </tr>
                    <TR>
                        <TH>Bonus</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="Bonus"></TD>
                    </tr>
                    <TR>
                        <TH>No Of Leaves</TH>
                        <TD><INPUT style="height:20px"TYPE="text" NAME="Leave_taken"></TD>
                    </tr>
                    <TR>
                        <TH></TH>
                        <TD><INPUT class="btn" TYPE="submit" VALUE="submit"></TD>
                    </tr>
                </TABLE>
                <%
                    String DID = request.getParameter("DID");
                    String Designation = request.getParameter("Designation");
                    String BasicSal = request.getParameter("BasicSal");
                    String Allowance = request.getParameter("Allowance");
                    String tax = request.getParameter("tax");
                    String Bonus = request.getParameter("Bonus");
                    String Leave_taken = request.getParameter("Leave_taken");

                    String connectionURL = "jdbc:mysql://localhost:3306/payroll";
                    // declare a connection by using Connection interface 
                    Connection connection = null;
                    // declare object of Statement interface that uses for 
                    //executing sql statements.
                    PreparedStatement pstatement = null;
                    // Load JBBC driver "com.mysql.jdbc.Driver"
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    int updateQuery = 0;

                    // check if the text box is empty
                    if (DID != null && Designation != null && BasicSal != null
                            && Allowance != null && tax != null && Bonus != null && Leave_taken != null) {
                        // check if the text box having only blank spaces
                        if (DID != "" && Designation != "" && BasicSal != ""
                                && Allowance != "" && tax != "" && Bonus != "" && Leave_taken != "") {
                            try {

                                connection = DriverManager.getConnection(connectionURL, "root", "sharana");
                                // sql query to insert values in the secified table.
                                String queryString = "INSERT INTO Designation(DID, Designation,BasicSal,Allowance,tax"
                                        + ",Bonus,Leave_taken) VALUES (?, ?, ?, ?, ?, ?, ?)";
                                /* createStatement() is used for create statement
                              object that is used for 
                                sending sql statements to the specified database. */
                                pstatement = connection.prepareStatement(queryString);
                                pstatement.setString(1, DID);
                                pstatement.setString(2, Designation);
                                pstatement.setString(3, BasicSal);
                                pstatement.setString(4, Allowance);
                                pstatement.setString(5, tax);
                                pstatement.setString(6, Bonus);
                                pstatement.setString(7, Leave_taken);
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
                            } catch (Exception ex) {
                                out.println("Unable to connect to database.");

                            } finally {
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