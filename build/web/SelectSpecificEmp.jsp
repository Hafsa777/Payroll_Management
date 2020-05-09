
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body bgcolor="beige">
        <h1>Select Employee</h1>
        <form name="empDet" action="Employee.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Employee ID : </td>
                        <td><input type="text" name="EmpID" value="" size="10" /></td>
                    </tr>
                </tbody>
            </table>
            <br><input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
