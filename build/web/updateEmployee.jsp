<%@page import="java.sql.*;" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="javax.swing.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<html>
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
    
        
    <%!
              public class update{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/payroll";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;
                        PreparedStatement pre = null;
                        ResultSet result = null;  
                        String query;
                        
                        
                 public update(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        query = "update  employee set EmpName=?,Gender=?,Mobile=?,Email=?,Address=?,JoinDate=?, DID=?"
                                + "where EmpID=?";
                         pre = conn.prepareStatement(query);

                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public int setNames(String name,String gender,String Mobile,String mail,String address,String date,String Did,String id){

                    int result = 0;

                try{
                        pre.setString(1, name);
                        pre.setString(2, gender);
                        pre.setString(3,Mobile);
                        pre.setString(4,mail);
                        pre.setString(5,address);
                        pre.setString(6,date);
                        pre.setString(7, Did);
                         pre.setString(8, id);
                        
                        result = pre.executeUpdate();                       

                  }catch(SQLException e){

                    e.printStackTrace();;
                    
                }
                    return result;
            }

}
        %>
        <%
                int result = 0;
                
                String id = new String();
                String name = new String();
                String add = new String();
                String gen = new String();
                String no = new String();
                String did = new String();
                String date = new String();
                String mail = new String();
                if(request.getParameter("submit") != null){
                
                    if(request.getParameter("name")!= null){
                        name = request.getParameter("name");
                    }
                     
                     if(request.getParameter("gender")!= null){
                        gen = request.getParameter("gender");
                    }
                     if(request.getParameter("no")!= null){
                        no = request.getParameter("no");
                    }
                     if(request.getParameter("mail")!= null){
                        mail = request.getParameter("mail");
                    }
                     if(request.getParameter("address")!= null){
                        add = request.getParameter("address");
                    }
                      if(request.getParameter("date")!= null){
                       date = request.getParameter("date");
                    }
                       if(request.getParameter("did")!= null){
                       did = request.getParameter("did");
                    }
                      
                      
                     if(request.getParameter("eid")!= null){
                        id = request.getParameter("eid");
                    }
                     
                
                }
                
                update lg = new update();
                result = lg.setNames(name, gen, no, mail,add,date,did, id);
        
        %>

 
          <script type="text/javascript">
                            function validate(){
                                
                                if(document.updateEmployee.eid.value == ""){
                                     alert("Enter Employee ID!");
                                     document.updateEmployee.eid.focus();
                                     return false;
                                }
                                
                                if(document.updateEmployee.name.value == ""){
                                     alert("Enter Employee Name!");
                                     document.updateEmployee.name.focus();
                                     return false;
                                }
                               
                                if(document.updateEmployee.gender.value == ""){
                                     alert("Enter Gender!");
                                     document.updateEmployee.gender.focus();
                                     return false;
                                }
                              
                                
                                if(document.updateEmployee.no.value == ""){
                                     alert("Enter Mobile NUmber!");
                                     document.updateEmployee.no.focus();
                                     return false;
                                }
                              
                                
                               if(document.updateEmployee.mail.value == ""){
                                     alert("Enter Mail!");
                                     document.updateEmployee.mail.focus();
                                     return false;
                                }
                                   
                                 if(document.updateEmployee.address.value == ""){
                                     alert("Enter Address!");
                                     document.updateEmployee.address.focus();
                                     return false;
                                }
                               
                                
                               if(document.updateEmployee.date.value == ""){
                                     alert("Enter JOin Date!");
                                     document.updateEmployee.date.focus();
                                     return false;
                                }
                               
                                
                                if(document.updateEmployee.departmentID.value == ""){
                                     alert("Enter Department ID!");
                                     document.updateEmployee.departmentID.focus();
                                     return false;
                                }
                                
                               
                               return true;
                           }
                           </script>

        <form name="updateEmployee" action="updateEmployee.jsp" method="POST" onsubmit="return validate()">
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
                         <td><input type="text" name="did" value="" /></td>
                    </tr>
                    <tr>
                        
                        <td><input type="reset" value="reset" name="reset" /></td>
                        <td><input type="submit" value="update" name="submit" /></td>
                      
                    </tr>
                </tbody>
            </table>

        </form>
                         <% if(result == 1){ %>
        
                        <SCRIPT LANGUAGE="JavaScript">
                          
                                alert("Data Updated!");
                                document.location ="updateEmployee.jsp";
                      
                        </SCRIPT>
                        <% } %>
    
       <%                } else {
                    response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");

                }

            %>  
    </body>
</html>

