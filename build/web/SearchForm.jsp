<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <h1></h1>
        <%!
        public class Employee{
             String url = "jdbc:mysql://localhost:3306/payroll";
             String username = "root";
                String password = "sharana";

            Connection connection =null;
            PreparedStatement selectEmployees=null;
            ResultSet resultSet=null;

            public Employee(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);

                selectEmployees=connection.prepareStatement("Select e.EmpID,e.EmpName,e.Gender,e.Mobile,e.Email,e.Address,e.JoinDate,e.DID,l.Username,l.Password FROM Employee e,login l where e.EmpID = l.EmpID AND e.EmpID=? ");
            
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }
        public ResultSet getEmployees(String EmpID){
        
        try{
            
            selectEmployees.setString(1,EmpID);
            resultSet = selectEmployees.executeQuery();
        }
        catch(SQLException e){

             e.printStackTrace();
           }

    return resultSet;
    }
        }
        
        %>
        <%        
            String EmpID=new String();
            
            if(request.getParameter("EmpID") !=null){
                EmpID = request.getParameter("EmpID");
            }
            
            Employee Employee=new Employee();
            ResultSet employee = Employee.getEmployees(EmpID);
        %>
        <table border="0">
           
            <tbody>
               
                <%
                    while(employee.next()){ %>
                <tr>
                     <td>Employee ID : </td>
                    <td><%= employee.getString("EmpID")%></td>
                </tr>
                <tr>
                    <td>Employee Name : </td>
                    <td><%= employee.getString("EmpName")%></td>
                </tr>
                <tr>
                    <td>Gender : </td>
                    <td><%= employee.getString("Gender")%></td>
                </tr>
                <tr>
                     <td>Mobile : </td>
                    <td><%= employee.getString("Mobile")%></td>
                </tr>
                <tr>
                       <td>Email : </td>
                    <td><%= employee.getString("Email")%></td>
                </tr>
                <tr>
                    <td>Address : </td>
                    <td><%= employee.getString("Address")%></td>
                </tr>
                <tr>
                    <td>Join date : </td>
                    <td><%= employee.getString("joinDate")%></td>
                </tr>
                <tr>
                       <td>DID : </td>
                    <td><%= employee.getString("DID")%></td>
                </tr>
                <tr>
                       <td>UserName : </td>
                    <td><%= employee.getString("Username")%></td>
                </tr>
                <tr>
                       <td>Password : </td>
                    <td><%= employee.getString("Password")%></td>
                </tr>
                <% } %>
            </tbody>
        </table>

       
    </body>
</html>
