<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" media="screen,projection" type="text/css" href="./main.css" />
        <style>
            select
            {
                height: 30px;
                width:150px;
            }

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
        <title>Time In</title>
    </head>
    <body>
        <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>   
        <title>time Page</title>
    
    <% 
        Date date = new Date();
    %>
    
        <h1><%=date %></h1>
                   <%!
        public class in{
            String url="jdbc:mysql://localhost:3306/payroll";
            String username="root";
            String password="sharana";

            Connection connection =null;
            PreparedStatement in=null;
            ResultSet resultSet=null;
            
            
            public in(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);
                in=connection.prepareStatement("insert into attendance(EmpID,TimeIn) VALUES(?,?)");
                              
            }
            
            catch(SQLException e){
                e.printStackTrace();
            }
        }

    public int setin(String id,Timestamp inn){
        int result=0;
        try{
            
            in.setString(1,id);
              in.setTimestamp(2,inn);
  

            result=in.executeUpdate();
        }

        catch(SQLException e){
            e.printStackTrace(); 
        }
        return result;
}
      
    
}

        %>
        
        <%
            int result =0;
          
            
            String id=new String();
            String att = new String();
           
             if(request.getParameter("In")!=null){
                    if(request.getParameter("id")!=null){
                    id=request.getParameter("id");
            }
             }            
             
            Date date1=new Date();
            Timestamp timestamp1=new Timestamp(date1.getTime());
            
                     
            in inOut=new in();
            result = inOut.setin(id, timestamp1);
            
           
                       
            
            %>
        <table border="0">
            <form name="myform" action="Time_In.jsp" method="POST">
            
            <tbody>
                <tr>
                    <td>Employee Id</td>
                    <td><input type="text" name="id" value="" size="50" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Time In" name="In" /></td>
                    <td><input type="submit" value="Time out" name="Out" onload/></td>
                </tr>
            </tbody>
        </table>        
        </form>
            <% } else {
                response.sendRedirect("login.jsp?id=Your session may be expired. You have to login first");
            }
        %>
    </body>
</html>
