<%-- 
    Document   : newjsp
    Created on : Apr 10, 2018, 6:07:17 AM
    Author     : USER
--%>
<% Class.forName("com.mysql.jdbc.Driver");  %>
<%@page  import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
          <%!
              public class login{
                    
                        
                        String URL = "jdbc:mysql://localhost:3306/payroll";
                        String USERNAME = "root";
                        String PASSWORD = "sharana";
                
                        Connection conn = null;
                        PreparedStatement log_pre = null;
                        ResultSet log_result = null;
                        String query;

                        String userdbName;
                        String userdbPsw;
                        String dbUsertype;
                   

                 public login(){
                    try{
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                         query = "select * from Login where Username=? and Password=? and EmpType=?";
                          log_pre = conn.prepareStatement(query);

                     }catch(SQLException e){

                        e.printStackTrace();
                }
                }

                public ResultSet getNames(String user_name,String pass_word,String user_type){

                try{
                        log_pre.setString(1, user_name);
                        log_pre.setString(2, pass_word);
                        log_pre.setString(3, user_type);
                        log_result= log_pre.executeQuery();
                        
                       

                  }catch(SQLException e){

                    e.printStackTrace();;
                    
                }
                    return log_result;
            }

}
        %>
      
        <%
      
                String user_name = new String();
                String pass_word = new String();
                String user_type = new String();
            
               
                user_name = request.getParameter("username");
                pass_word = request.getParameter("pass");
                user_type = request.getParameter("select");

                login log = new login();
                ResultSet logs = log.getNames(user_name, pass_word, user_type);
                
            
                if((!(user_name.equals(null) || user_name.equals("")) && !(pass_word.equals(null) || pass_word.equals(""))) && !user_type.equals("select"))
                {                     
                    
                            if(logs.next()){
                       
                                        log.userdbName = logs.getString("Username");
                                        log.userdbPsw = logs.getString("Password");
                                        log.dbUsertype = logs.getString("EmpType").toString();
                            
                                
                                    if(user_name.equals(log.userdbName) && pass_word.equals(log.userdbPsw) && user_type.equals("Admin"))
                                     {
                                                
                                                session.setAttribute("user_name",log.userdbName);
                                                session.setAttribute("usertype", log.dbUsertype); 
                                                response.sendRedirect("WelcomeAdmin.jsp"); 
                                                
                                     
                                    
                                    } else if(user_name.equals(log.userdbName) && pass_word.equals(log.userdbPsw) && user_type.equals("Employee")){
                                    
                                                session.setAttribute("user_name",log.userdbName);
                                                session.setAttribute("usertype", log.dbUsertype); 
                                                response.sendRedirect("WelcomeEmployee.jsp"); 
                                    
                                    } else if(user_name.equals(log.userdbName) && pass_word.equals(log.userdbPsw) && user_type.equals("Manager")){
                                    
                                                session.setAttribute("user_name",log.userdbName);
                                                session.setAttribute("usertype", log.dbUsertype); 
                                                response.sendRedirect("WelcomeManager.jsp"); 
                                    } 
                                    

                            }       
                
                         else     
                                response.sendRedirect("error.jsp");
                                logs.close();
                                logs.close();

                    
                   
          }     
          else
           {

                %>

                        <center><p style="color:red">Error In Login</p></center>

                <% 

                        getServletContext().getRequestDispatcher("/login.jsp").include(request, response);

             }


        
       %>
       
       
       
       
       
    </body>
</html>
