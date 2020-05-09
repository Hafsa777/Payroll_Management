
<% Class.forName("com.mysql.jdbc.Driver");  %>
<%@page  import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GlassFish Login</title>
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
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
    </head>
    <body>
        <div class="well" style="margin-top: 160px;height:350px;width:500px;margin-left:433px;">
        <h3 align="center">Payroll Management System</h3>

        <form name="login" action="login_.jsp" method="POST">
            <table border="0" width="7" cellspacing="4" align="center" cellpadding="6" style="margin-left: 70px ;margin-top: 8px ;">
                
                <tbody>
               
                   <tr>
                        <td>User Name: </td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>  
                       
                    <tr>
                        <td>Select: </td>   
                        <td>
                            <select name="select">
                                <option>Admin</option>
                                <option>Manager</option>
                                <option>Employee</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th > <a href="login1.jsp">Forgot Password?</a></th>  
                        <th><input class="btn" style="margin-left: 20px;" type="submit" value="Submit" name="submit" /></th>
                    </tr>    
                </tbody>
            </table>

        </form>

            
    </body>
</html>
    
   