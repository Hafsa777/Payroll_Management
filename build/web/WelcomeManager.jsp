
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
                width:170px;
                height:100px;
                margin-left: 70px;
                margin-top: -5px;
            }
            strong
            {
                position: absolute;
                right: 15px;
                top :70px

            }
        </style>

    </head>
    <body>
        <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>

        <div class="well">  <ul>

                <li><a href="viewprofileManager.jsp">View Profile</a></li>
                <li><a href="PaySlipManager.jsp">View Pay-Slip</a></li>
                <li><a href="leaveformManager.jsp">Apply Leave</a></li>
                <li><a href="Time_In.jsp">Time In</a></li>
                <li><a href="Time_out.jsp">Time Out</a></li>
                <li><a href="leave.jsp">Leave Requests</a></li>
                <li><a href="SearchMan.jsp">Search Employee</a></li> 
                <li><a href="displayemployeeManager.jsp">Employee List</a></li> 
                <li><a href="salarypay.jsp">Pay Salary</a></li>
                <li><a href="logout.jsp">Logout</a></li>

            </ul>
        </div>
        <div class="well1">
            <% if (request.getParameter("id") != null) {
                       out.println("<ul style=\"list-style-type:disc;color:green; position: static;margin-left:5px;margin-top:20px;\"><li>" + request.getParameter("id") + "</li></ul>");
                   } %>
        </div>
        <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
    </body>
</html>