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
            <h1><b>Submit Leave Request</b></h1>
         
         <%!
        public class Leave{
            String url="jdbc:mysql://localhost:3306/payroll";
            String username="root";
            String password="sharana";

            Connection connection =null;
            PreparedStatement leave=null;
            ResultSet resultSet=null;

            public Leave(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);

                leave=connection.prepareStatement("Insert into payroll.Leave(EmpID,EmpName,Department,Start_Date,End_Date,Leave_Type,Cause) VALUES(?,?,?,?,?,?,?)");

            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }

    public int setleave(String id,String name,String dept,String sdate,String edate,String type,String cause){
        int result=0;
        try{
            leave.setString(1,id);
            leave.setString(2,name);
            leave.setString(3,dept);
            leave.setString(4,sdate);
            leave.setString(5,edate);
           // leave.setInt(6,duration);
            leave.setString(7,type);
            leave.setString(8,cause);

            result=leave.executeUpdate();
        }

        catch(SQLException e){
            e.printStackTrace(); 
        }
        return result;
}
}

        %>
        <%
            int result =0;
            
            String id=new String();
            
            if(request.getParameter("id")!=null){
                id=request.getParameter("id");
            }
            
            String name=new String();
            
            if(request.getParameter("name")!=null){
                name=request.getParameter("name");
            }
            
            String dept=new String();
            
            if(request.getParameter("dept")!=null){
                dept=request.getParameter("department");
            }
            
            String sdate=new String();
            
            if(request.getParameter("sdate")!=null){
                sdate=request.getParameter("sdate");
            }
            
            String edate=new String();
            
            if(request.getParameter("edate")!=null){
                edate=request.getParameter("eate");
            }
            
            //Integer duration=new Integer();
            String type=new String();
            
            if(request.getParameter("type")!=null){
                type=request.getParameter("type");
            }
            
            String cause=new String();
            
            if(request.getParameter("cause")!=null){
                cause=request.getParameter("cause");
            }
            
            

            
           

            Leave Leave=new Leave();
            result = Leave.setleave(id, name, dept, sdate, edate, type, cause);
            
            %>
         
        <form name="myForm" action="leaveformManager.jsp" method="POST">
        
        <table border="0" align="center">
            
            <tbody>
                <tr>
                    <td>Employee ID : </td>
                    <td><input type="text" name="id" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Employee Name : </td>
                    <td><input type="text" name="name" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Department : </td>
                    <td><input type="text" name="department" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Start Date : </td>
                    <td><input type="text" name="start" value="DD/MM/YYYY" size="50" /></td>
                </tr>
                <tr>
                    <td>End Date : </td>
                    <td><input type="text" name="end" value="DD/MM/YYYY" size="50" /></td>
                </tr>
                <tr>
                    <td>Duration : </td>
                    <td><input type="text" name="days" value="" size="50" /></td>
                </tr>
                <tr>
                    <td>Leave Type : </td>
                    <td><select name="type">
                            <option>Paid Leave</option>
                            <option>Sick Leave</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Cause : </td>
                    <td><textarea name="cause" rows="4" cols="20">
                        </textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Request" name="Request" /></td>
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
