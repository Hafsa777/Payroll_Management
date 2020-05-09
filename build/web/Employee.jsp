

<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<html>
   
    <body bgcolor="beige">
<h1> Selecting Data from DB </h1>

<%!
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
%>

<%
    String EmpID = new String();
    
    if(request.getParameter("EmpID") != null){
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
    <br>
    </tr>
    
    <% while(resultSet.next()) { %>
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

    <br>
<h2>Employee Salary Calculation</h2>
 
 <h3>Enter Employee Details:<h3>
 <form action="EmployeeSal.jsp" method="POST" >
 <table >
 <tr><td>Employee ID:</td><td><input type="text" name="EmpID" autofocus></td></tr>   
 <tr><td>Employee Name:</td><td><input type="text" name="EmpName"></td></tr>
 <tr><td>Department:</td><td><input type="text" name="DID"></td></tr>
 <tr><td>Designation:</td><td><input type="text" name="Designation"></td></tr>
 <tr><td>Basic Salary:</td><td><input type="text" name="BasicSal"></td></tr>
 <tr><td>Allowance(%):</td><td><input type="text" name="Allowance"></td></tr>
 <tr><td>Tax(%):</td><td><input type="text" name="tax"></td></tr>
 <tr><td>Hours Worked / Month:</td><td><input type="text" name="Hours_worked"></td></tr>

 
 <tr>
     <td><br><input type="submit" value="Evaluate"></td>
     <td><br><input type="reset" value="Reset"></td>
 </tr>
 
 </table>
 </form>
 </body>
</html>