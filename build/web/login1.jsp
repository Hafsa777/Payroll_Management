<%-- 
    Document   : login1
    Created on : Apr 4, 2018, 8:58:25 AM
    Author     : USER
--%>
<%@page import="java.sql.*;" %>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="main.css" />
        <link rel="stylesheet" media="screen,projection" type="text/css" href="main.css" />
        <style>
            input[type="text"], input[type="password"],select{
                height:20px;
                width: 175px;
      
            }
            td {           font-size: 18px;}
            select{        height:30px;
                           width: 190px;
                           font-family: sans-serif;}

        </style>
        <title>Login</title>
    </head>
 <body onLoad="displayResults()">
     <div class="well" style="margin-top: 160px;height:350px;width:500px;margin-left:433px;">
        <h3 align="center">Payroll Management System</h3>
      

<%!
              public class login{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/payroll";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;
                        PreparedStatement pre = null;
                        ResultSet result = null;  
                        String query;
                        String dbempid;

                 public login(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        query = "update login set Password=? where EmpID=?";
                         pre = conn.prepareStatement(query);

                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public int setNames(String password,String empid){

                    int result = 0;

                try{                        
                        pre.setString(1, password);
                        pre.setString(2,empid);
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
            
            String eid = new String();
            String pass_word = new String();
            
            if(request.getParameter("submit") != null){
                
                  if(request.getParameter("password") != null){
                              if(request.getParameter("password").equals(request.getParameter("pass"))){
                        
                                    pass_word = request.getParameter("password");
                              }else {
                                  out.println("password not Matched!");
                              }
                        }
              
                   
                 if(request.getParameter("eid") != null){
                       eid =  request.getParameter("eid");
                }
             
               
            }
             
            
            login lg = new login();
            result = lg.setNames(pass_word, eid);
        %>


      
        
        <form name="login1" action="login1.jsp" method="POST">
            <table border="0" width="4" cellspacing="5" cellpadding="7" align="center">
               
                <tbody>
                    <tr>
                        <td>Employee ID: </td>
                        <td><input type="text" name="eid" value="" /></td>
                   
                    </tr>
   
                    <tr>
                        <td>New Password:</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>confirm Password: </td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                       
                        <td><input type="submit" value="submit" name="submit" /></td
                      
                    </tr>
                </tbody>
            </table>
                               
        </form>
                             <% if(result == 1){ %>
        
                        <SCRIPT LANGUAGE="JavaScript">
                          
                                alert("Password Changed!");
                                document.location ="login1.jsp";
                      
                        </SCRIPT>
                        <% } %>
  
        
        
    </body>
</html>
