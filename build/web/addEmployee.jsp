
<%@page import="java.sql.*;"%>
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
    <body onLoad="displayResults()">
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
    
        
        
<%!
              public class Add{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/payroll";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;
                        PreparedStatement pre = null;
                        PreparedStatement pr = null;
                        ResultSet result = null;  
                        ResultSet result1 = null;  
                        String query;
                        String query1;

                 public Add(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        query = "insert into employee(EmpID,EmpName,Gender,Mobile,Email,Address,JoinDate,DID) values(?,?,?,?,?,?,?,?)";
                        query1 ="insert into login(EmpID,Username,Password,EmpType) values (?,?,?,?)";
                        pre = conn.prepareStatement(query);
                        pr = conn.prepareStatement(query1);

                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public int setNames(String id, String name,String gender,String phone_nu,String mail,String address,String date,String Did){

                    int result = 0;

                try{
                        pre.setString(1, id);
                        pre.setString(2, name);
                        pre.setString(3, gender);
                        pre.setString(4,phone_nu);
                        pre.setString(5,mail);
                        pre.setString(6,address);
                        pre.setString(7, date);
                        pre.setString(8,Did);
                       
                        
                        result = pre.executeUpdate();                       

                  }catch(SQLException e){

                    e.printStackTrace();
                    
                }
                    return result;
            }
             public int setValue(String eid,String username , String password,String type){

                int result1 = 0;
                
                try{
                         pr.setString(1, eid);
                        pr.setString(2, username);
                        pr.setString(3, password);
                         pr.setString(4, type);
            
                        result1 = pr.executeUpdate();
                }catch(SQLException e){

                    e.printStackTrace();
                }        
                return result1;
            }

}
        %>
        
        
        <%
                int result = 0;
                int result1 = 0;
                
                String id = new String();
                String name = new String();
                String address = new String();
                String gen = new String();
                String no = new String();
                String date = new String();
                String mail = new String();
                String username = new String();
                String password = new String();
                String did =new String();
                String des = new String();
                
                   if(request.getParameter("submit") != null){  
                       
                        if(request.getParameter("eid") != null){
                        
                            id = request.getParameter("eid");
                        }
                       
                        if(request.getParameter("name") != null){
                        
                            name = request.getParameter("name");
                        }
                       
                        if(request.getParameter("gender") != null){
                        
                            gen = request.getParameter("gender");
                        }
                        if(request.getParameter("no") != null){
                        
                            no = request.getParameter("no");
                        }
                         if(request.getParameter("mail") != null){
                        
                            mail = request.getParameter("mail");
                        }
                        
                         if(request.getParameter("address") != null){
                        
                            address = request.getParameter("address");
                        }
                        if(request.getParameter("date") != null){
                        
                            date = request.getParameter("date");
                        }
                         if(request.getParameter("departmentID") != null){
                        
                            did = request.getParameter("departmentID");
                        }
                      
                          if(request.getParameter("username") != null){
                        
                            username = request.getParameter("username");
                        }
                          
                          if(request.getParameter("pass_word") != null){
                              if(request.getParameter("pass_word").equals(request.getParameter("password"))){
                        
                                    password = request.getParameter("pass_word");
                              }else {
                                  out.println("password not Matched!");
                              }
                        }
                          if(request.getParameter("designation") != null){
                        
                            des = request.getParameter("designation");
                        }
                                                  
                 }
               
                
                   Add lg = new Add();
                  
                   result= lg.setNames(id, name,gen, no,mail,address,date,did);
                    result1 = lg.setValue(id, username, password,des);
        
        %>
        
        
        
        
          <script type="text/javascript">
                            function validate(){
                                
                                if(document.addEmployee.eid.value == ""){
                                     alert("Enter Employee ID!");
                                     document.addEmployee.eid.focus();
                                     return false;
                                }
                                
                                if(document.addEmployee.name.value == ""){
                                     alert("Enter Employee Name!");
                                     document.addEmployee.name.focus();
                                     return false;
                                }
                               
                                if(document.addEmployee.gender.value == ""){
                                     alert("Enter Gender!");
                                     document.addEmployee.gender.focus();
                                     return false;
                                }
                              
                                
                                if(document.addEmployee.no.value == ""){
                                     alert("Enter Mobile NUmber!");
                                     document.addEmployee.no.focus();
                                     return false;
                                }
                              
                                
                               if(document.addEmployee.mail.value == ""){
                                     alert("Enter Mail!");
                                     document.addEmployee.mail.focus();
                                     return false;
                                }
                                   
                                 if(document.addEmployee.address.value == ""){
                                     alert("Enter Address!");
                                     document.addEmployee.address.focus();
                                     return false;
                                }
                               
                                
                               if(document.addEmployee.date.value == ""){
                                     alert("Enter JOin Date!");
                                     document.addEmployee.date.focus();
                                     return false;
                                }
                               
                                
                                if(document.addEmployee.departmentID.value == ""){
                                     alert("Enter Department ID!");
                                     document.addEmployee.departmentID.focus();
                                     return false;
                                }
                                
                                
                                 if(document.addEmployee.designation.value == ""){
                                     alert("Enter Designation!");
                                     document.addEmployee.designation.focus();
                                     return false;
                                }
                               
                                if(document.addEmployee.username.value == ""){
                                     alert("Enter Username!");
                                     document.addEmployee.username.focus();
                                     return false;
                                }
                              
                                if(document.addEmployee.password.value == ""){
                                     alert("Enter passsword!");
                                     document.addEmployee.password.focus();
                                     return false;
                                }
                               
                               
                                return true;
                        }
                        </script>
                        
           <form name="addEmployee" action="addEmployee.jsp" method="POST" onsubmit=" return validate()">
            <table border="0"  cellspacing="8" cellpadding="8">
              
                <tbody>
                    <tr>
                        <td>Employee ID:</td>
                        <td><input type="text" name="eid" value=""  /></td>
                    </tr>     
                    <tr>    
                        <td>Employee Name:</td>
                        <td><input type="text" name="name" value=""  /></td>
                    </tr>
                   
                    <tr>
                        <td>Gender: </td>
                        <td><select name="gender">
                                <option>male</option>
                                <option>female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Phone Number: </td>
                        <td><input type="text" name="no" value=""  /></td>
                    </tr>
                   
                    <tr>
                        <td>Email Address: </td>
                         <td><input type="text" name="mail" value="" /></td>
                    </tr>
                     <tr>
                        <td>Address: </td>
                        <td><textarea name="address" rows="3" cols="12">
                            </textarea></td>
                    </tr>
                     <tr>
                        <td>Join Date: </td>
                        <td><input type="text" name="date" value="" /></td>
                    </tr>  

                     <tr>
                        <td>Department ID: </td>
                        <td><input type="text" name="departmentID" value="" /></td>
                    </tr>  

                     <tr>
                        <td>Designation: </td>
                        <td><input type="text" name="designation" value="" /></td>
                    </tr>  
                     <tr>
                        <td>user Name: </td>
                         <td><input type="text" name="username" value="" /></td>
                    </tr>
                      <tr>
                        <td>Pass Word: </td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                     <tr>
                        <td>Confirm Pass Word: </td>
                        <td><input type="password" name="pass_word" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="reset" name="reset" /></td>
                        <td><input type="submit" value="add" name="submit" /></td>
           
                    </tr>
                </tbody>
            </table>
                 
        </form>
        
        <% if(result == 1 && result1 == 1){ %>
        
                        <SCRIPT LANGUAGE="JavaScript">
                          
                                alert("Data inserted!");
                                document.location ="addEmployee.jsp";
                                
                        </SCRIPT>
                        <% } %>
                      
    <%                } else {
                    response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");

                }

            %>                    
    </body>
</html>

