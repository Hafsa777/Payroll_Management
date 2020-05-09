
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
            
                        String URL = "jdbc:mysql://localhost:3306/payroll";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;
                        PreparedStatement pre = null;
                        PreparedStatement pr = null;
                        String query;     
                        String query1;
            
                public class deleteEmp{

                        public deleteEmp(){
                           try{  
                                  conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                                  query = "delete from employee where EmpID=?";
                                  query1 = "delete from login where EmpID=?";
                                  pr = conn.prepareStatement(query);
                                  pre = conn.prepareStatement(query1);

                            }catch(SQLException e){

                                e.printStackTrace();
                           }                           
                      }
        
                       public int SetNames(String eid){
                                
                            int result = 0;
                            
                             try{
                                    pre.setString(1,eid);
                                    pr.setString(1, eid);
                                        
                                     result = pre.executeUpdate();
                                     result = pr.executeUpdate();

                             }catch(SQLException e){
            
                                    e.printStackTrace();;
                            }   
                            return result;
                       }
                       

            }        
        %>
        
        <% 
        
            int result = 0;
            int result1 = 0;
            
            String eid = new String();
            
            if(request.getParameter("delete") != null){
            
                    if(request.getParameter("id") != null){
                    
                        eid  = request.getParameter("id");
                    }
            
            }
            deleteEmp d1 = new deleteEmp();
            result = d1.SetNames(eid);
        %>
        
        <script type="text/javascript">
                              function validate(){
                                
                                     if(document.deleteEmployee.id.value == ""){
                                        alert("Insert Employee ID!");
                                        document.deleteEmployee.id.focus();
                                        return false;
                                    }
                                   
                                return true;
                            }                    
        </script>
                                
        <form  name = "deleteEmployee" action = "deleteEmployee.jsp" method = "POST" onsubmit="return validate()">
            <table border="0" width="3" cellspacing="5" cellpadding="4">
                <tr>
                    <td>Employee ID: </td>
                    <td><input type="text" name="id" value=""  /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Delete" name="delete" /></td>
                </tr>
                <tbody>
                </tbody>
            </table>
            </form>
        
                          <% if(result == 1) { %>
        
                        <SCRIPT LANGUAGE="JavaScript">
                          
                                alert("Data Deleted!");
                                document.location ="deleteEmployee.jsp";
                      
                        </SCRIPT>
                        <% } %>
                        
          <%                } else {
                    response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");

                }

            %>   
    </body>
</html>
