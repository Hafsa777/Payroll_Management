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
            <%

                //  HttpSession session=request.getSession();
                if (session.getAttribute("user_name") != null) {

            %>
        <h1>Leave </h1>
        <%!
        public class Leave{
            String url="jdbc:mysql://localhost:3306/payroll";
            String username="root";
            String password="sharana";


            Connection connection =null;

            PreparedStatement selectLeave=null;
            

            ResultSet resultSet=null;
            String query;
            
            public Leave(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);

                
                query="Update payroll.Leave set Status=? where EmpID=?";

                
                selectLeave=connection.prepareStatement(query);

            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }
       

        public int setLeave(String id,String Status){
            int result=0;
            try{
                selectLeave.setString(1,id);
                selectLeave.setString(2,Status);

                result=selectLeave.executeUpdate();
            }
            catch(SQLException e){
            
                e.printStackTrace();

               }
                return result;
    }
        }
        
        %>
        <%   
            int result = 0;
            
            
            String EmpID=new String();
             
             if(request.getParameter("EmpID") !=null){
                EmpID = request.getParameter("EmpID");
            }
             
            String Status = new String();
            
            
             if(request.getParameter("Status") !=null){
                Status = request.getParameter("status");
            }
             
            
            Leave Leave=new Leave();
            
            result=Leave.setLeave(EmpID, Status);
        %>
        
        <form name="form2" action="leave.jsp" method="POST">
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>Employee ID: </td>
                        <td><input type="text" name="status" value="" size="50" /></td>
                    </tr>
                    
                    <tr>
                        <td>Leave Status: </td>
                        <td><input type="text" name="status" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit" name="Submit" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%                } else {
                    response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");

                }

            %>
    </body>
</html>
