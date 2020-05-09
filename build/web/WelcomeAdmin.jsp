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
        </style>

    </head>
    <body>
        <% if(session.getAttribute("user_name")!=null){ %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome "+session.getAttribute("user_name"));%></strong>

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
            <% if(request.getParameter("id")!=null)out.println("<ul style=\"list-style-type:disc;color:green; position: static;margin-left:5px;margin-top:20px;\"><li>"+request.getParameter("id")+"</li></ul>"); %>
        </div>
        <% }
          else
          {
              response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
          }
        %>
    </body>
</html>
