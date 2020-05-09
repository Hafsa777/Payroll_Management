

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
     <% if(session.getAttribute("user_name")!=null){ %>
        <img src="gf.jpeg">
           <strong><% out.println("Welcome "+session.getAttribute("user_name"));%></strong>   
       
        
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
            
               <% if(request.getParameter("user_name")!=null)out.println("<ul style=\"list-style-type:disc;color:red; position: static;margin-left:5px;margin-top:20px;\"><li>"+request.getParameter("user_name")+"</li></ul>"); %>
    
     <h2> View Pay Slip</h2>

<%!
    public class payslip{
        String URL = "jdbc:mysql://localhost:3306/payroll";
        String USERNAME = "root";
        String PASSWORD = "sharana";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        public payslip(){
            try{
                connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                 statement = connection.prepareStatement(
                      "SELECT p.MonthName, p.Year,p.EmpID, p.SalID, e.EmpName, p.DID,d.Designation, d.BasicSal,d.Allowance, d.Bonus, d.tax, p.NetSal FROM Employee e, Pay_Slip p, Designation d  WHERE d.DID = e.DID and e.EmpID = p.EmpID and p.EmpID =? AND p.MonthName=? AND p.Year=?");
            } catch (Exception e){
                e.printStackTrace();
            }
}

        public ResultSet getpayslip(String EmpID, String MonthName, String Year){
            try{
                statement.setString(1, EmpID);  
                statement.setString(2, MonthName); 
                statement.setString(3, Year); 
                resultSet = statement.executeQuery();
            } catch (Exception e){
                e.printStackTrace();
            }
            
            return resultSet;
        }
}
%>

<%
    String EmpID = new String();
    String MonthName = new String();
    String Year = new String();
    
    if(request.getParameter("EmpID") != null){
        EmpID = request.getParameter("EmpID");
    }
     if(request.getParameter("MonthName") != null){
        MonthName = request.getParameter("MonthName");
    }
      if(request.getParameter("Year") != null){
        Year = request.getParameter("Year");
    }
    
    
    payslip emp = new payslip();
    ResultSet resultSet = emp.getpayslip(EmpID, MonthName, Year);
%>          
        
  
<form method="post" action="PaySlip.jsp">
       
    <table style="margin-left:40px;">
    <tr><td>Employee ID : </td>
        <td><input type="text" name="EmpID" value="" size="10" /></td>
    </tr>
                
    <tr><td>Month : </td>
        <td><select name="MonthName">
        <option selected value="0">Select Month</option>
        <option value="January">January</option>
        <option value="February">February</option>
        <option value="March">March</option>
        <option value="April">April</option>
        <option value="May">May</option>
        <option value="June">June</option>
        <option value="July">July</option>
        <option value="August">August</option>
        <option value="September">September</option>
        <option value="October">October</option>
        <option value="November">November</option>
        <option value="December">December</option>
        </select></td>
    </tr>
    
    <tr>
        <td>Year : </td>
        <td>    
        <select name="Year" size="1">
        <option selected value="0">Select Year</option>
        <option value="2015">2015</option>
        <option value="2016">2016</option>
        <option value="2017">2017</option>
        <option value="2018">2018</option>
        </select>
        </td>
    </tr>
                <tr><td/><td><button class="btn" type="submit">View Pay Slip</button></td></tr>    
            </table>
        </form>
   
<%while(resultSet.next()) {
    double allowance = (resultSet.getFloat("BasicSal") * resultSet.getFloat("Allowance")) / 100;
    double allowance2 = (resultSet.getFloat("BasicSal")* resultSet.getFloat("Bonus"))/100;  
    double deduction = (resultSet.getFloat("BasicSal") * resultSet.getFloat("tax")) / 100;
      double gsal = resultSet.getFloat("BasicSal") + allowance + allowance2;
      double netsal = gsal - deduction;
       %>
     <table border = " 1" bgcolor="biege" style="margin-left: 800px; margin-top: -250px">
    <caption><h2><font color="blue" >SALARY STATEMENT</font></h2></caption>
    <tr><td>Month</td><td><%= resultSet.getString("MonthName")%></td></tr>
    <tr><td>Year</td><td><%= resultSet.getString("Year")%></td></tr>
    <tr><td>Employee ID</td><td colspan=2><%=resultSet.getString("EmpID")%></td></tr>
    <tr><td>Salary ID</td><td colspan=2><%=resultSet.getString("SalID")%></td></tr>
    <tr><td>Employee Name</td><td colspan=2><%=resultSet.getString("EmpName")%></td></tr>
    <tr><td>Department ID</td><td colspan=2><%=resultSet.getString("DID")%></td></tr>
    <tr><td>Designation</td><td colspan=2><%=resultSet.getString("Designation")%></td></tr>
    <tr><td>Basic Salary</td><td colspan=2><%=resultSet.getString("BasicSal")%></td></tr>
    
    <tr><th>Allowance</th><th>Percentage</th><th>Amount</th></tr>
    
    <tr align=center><td>Basic</td><td><%=resultSet.getString("Allowance")%></td><td><%=allowance%></td></tr>
    <tr align=center><td>Bonus</td><td><%=resultSet.getString("Bonus")%></td><td><%=allowance2%></td></tr>
    <tr><th>Total Allowance:</th><td colspan=2><%=allowance%></td><tr>
    <tr><th>Deductions</th><th>Percentage</th><th>Amount</th></tr>
    <tr align=center><td>Taxes</td><td><%=resultSet.getString("tax")%></td><td><%=deduction%></td></tr>
    <tr><th>Total Deduction:</th><td colspan=2><%=deduction%></td><tr>
    <tr><td>Gross Salary</td><td colspan=2><%=gsal%></td></tr>
    
    <tr><td>Net Salary</td><td colspan=2><%=netsal%></td></tr>
    
        <% } %>
  
    
    </table> 


         </div>
        <% }
        else
        {
            response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
        }
      %>
    </body>
</html>

