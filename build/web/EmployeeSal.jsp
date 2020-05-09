<html>
<head>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" media="screen,projection" type="text/css" href="main.css" />
</head>
<body bgcolor="beige">

<%
    String EmpID=request.getParameter("EmpID");
    String ename=request.getParameter("EmpName");
    String dept=request.getParameter("DID");
    String des=request.getParameter("Designation");
    double bsal=Double.valueOf(request.getParameter("BasicSal"));
    double ea=Double.valueOf(request.getParameter("Allowance"));
    double ea2=bsal*ea/100;
    double tax=Double.valueOf(request.getParameter("tax"));
    double tax2=bsal*tax/100;
    int Hours_worked = Integer.valueOf(request.getParameter("Hours_worked"));
    double allowance;
    double deduction;
    double gsal;
    double netsal;

    allowance = (bsal*ea)/100;
    deduction = (bsal*tax)/100;
    gsal = bsal + allowance;
    netsal = gsal - deduction;
    


%>
    <CENTER>
    <table border=5 bgcolor="biege" height=600 width=400 >
    <caption><h2><font color="blue" >SALARY STATEMENT</font></h2></caption>
    <tr><td>Employee Name</td><td colspan=2><%=ename%></td></tr>
    <tr><td>Employee ID</td><td colspan=2><%=EmpID%></td></tr>
    <tr><td>Department</td><td colspan=2><%=dept%></td></tr>
    <tr><td>Designation</td><td colspan=2><%=des%></td></tr>
    <tr><td>Hours Worked / Month</td><td colspan=2><%=Hours_worked%></td></tr>
    <tr><td>Basic Salary</td><td colspan=2><%=bsal%></td></tr>
    <tr><th>Allowance</th><th>Percentage</th><th>Amount</th></tr>
    
    <tr align=center><td>Basic</td><td><%=ea%></td><td><%=ea2%></td></tr>
    
  
    <tr><th>Total Allowance:</th><td colspan=2><%=allowance%></td><tr>
    <tr><th>Deductions</th><th>Percentage</th><th>Amount</th></tr>
    <tr align=center><td>Taxes</td><td><%=tax%></td><td><%=tax2%></td></tr>

    <tr><th>Total Deduction:</th><td colspan=2><%=deduction%></td><tr>
    <tr><td>Gross Salary</td><td colspan=2><%=gsal%></td></tr>
    
    <tr><td>Net Salary</td><td colspan=2><%=netsal%></td></tr>
    </table>
    </CENTER>


  
 </body> 
</html>