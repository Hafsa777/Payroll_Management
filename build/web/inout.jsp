<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>time Page</title>
    </head>
    <% 
        Date date = new Date();
    %>
    <body>
        <h1><%=date %></h1>
        <form name="time" action="Time.jsp" method="POST">
    
        <table border="0">
            
            <tbody>
            
                <tr>
                    <td>Employee Id</td>
                    <td><input type="text" name="id" value="" size="50" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Time In" name="In" /></td>
                    <td><input type="submit" value="Time out" name="Out" /></td>
                </tr>
            </tbody>
        </table>
    </form>

       
        
    </body>
</html>
