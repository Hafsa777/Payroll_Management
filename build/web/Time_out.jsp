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
        <title>Time Out</title>
   </head>
    <body>
        <% if (session.getAttribute("user_name") != null) { %>
        <img src="gf.jpeg">
        <strong><% out.println("Welcome " + session.getAttribute("user_name"));%></strong>   
        <title>Time Out</title>
    
    <% 
        Date date = new Date();
    %>
    <body>
        <h1><%=date %></h1>
                   <%!
        public class Out{
            String url="jdbc:mysql://localhost:3306/payroll";
            String username="root";
            String password="sharana";

            Connection connection =null;
            PreparedStatement Out=null;
            
            ResultSet resultSet=null;
            
            
            public Out(){
            
            try{
                connection=DriverManager.getConnection(url, username, password);
                Out=connection.prepareStatement("update  attendance set TimeOut=? where EmpID=?");
                
            }
            
            catch(SQLException e){
                e.printStackTrace();
            }
        }

    public int setout(Timestamp out,String id){
        int result=0;
        try{
              Out.setTimestamp(1,out);
              Out.setString(2,id);

            result=Out.executeUpdate();
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
           
             if(request.getParameter("Out")!=null){
                 
                 if(request.getParameter("id")!=null){
                   id=request.getParameter("id");
            }
             }    
            Date date1=new Date();
            Timestamp timestamp1=new Timestamp(date1.getTime());
            
                     
            Out inOut=new Out();
            result = inOut.setout(timestamp1,id);
            
            
            
            %>
        <table border="0">
            <form name="myform" action="Time_out.jsp" method="POST">
            
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
