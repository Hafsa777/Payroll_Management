<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" media="screen,projection" type="text/css" href="main.css" />
        <style>

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

            td{padding-left: 10px}
            select
            {
                height: 27px;
                width:157px;
            }


        </style>
    </head>
    <body>
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
            <%

                //  HttpSession session=request.getSession();
                if (session.getAttribute("user_name") != null) {

            %>
    
    
        <h1></h1>
        <%!
        public class viewDetails{
             String url = "jdbc:mysql://localhost:3306/payroll";
             String username = "root";
                String password = "sharana";

            Connection connection =null;
            PreparedStatement selectEmployee=null;
            ResultSet resultSet=null;

            public viewDetails(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);

                selectEmployee=connection.prepareStatement("Select e.EmpID,e.EmpName,e.Gender,e.Mobile,e.Email,e.Address,e.JoinDate,e.DID,l.Username,l.Password FROM Employee e,login l where e.EmpID = l.EmpID ");
             }
             catch(SQLException e){
                e.printStackTrace();
             }
        }
        public ResultSet setView(){
        
        try{
            
            resultSet = selectEmployee.executeQuery();
        }
        catch(SQLException e){

             e.printStackTrace();
           }

    return resultSet;
    }
        }
        
        %>
        <%        
           
            viewDetails details=new viewDetails();
            ResultSet view = details.setView();
        %>
        <table border="0">
           
            <tbody>
                <tr>
                    <td>Employee ID : </td>
                    <td>Employee Name : </td>
                    <td>Gender : </td>
                    <td>Mobile : </td>
                    <td>Email : </td>
                    <td>Address : </td>
                    <td>Join date : </td>
                    <td>DID : </td>
                     <td>Username : </td>
                    <td>Password : </td>
                   
                </tr>
                <%
                    while(view.next()){ %>
                <tr>
                    <td><%= view.getString("EmpID")%></td>
                    <td><%= view.getString("EmpName")%></td>
                    <td><%= view.getString("Gender")%></td>
                    <td><%= view.getString("Mobile")%></td>
                    <td><%= view.getString("Email")%></td>
                    <td><%= view.getString("Address")%></td>
                    <td><%= view.getString("joinDate")%></td>
                    <td><%= view.getString("DID")%></td>
                    <td><%= view.getString("Username")%></td>
                    <td><%= view.getString("Password")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>

           <%                } else {
                    response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");

                }

            %>   
    </body>
</html>
