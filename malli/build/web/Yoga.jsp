<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Xtream_Gym.logout" %>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/";
String database = "xgym";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<head>
    <title>Xtream Gym</title>
    <link href="css/Activity_Plan_Sporats.css" rel="stylesheet" type="text/css"/>
    <jsp:include page="header.jsp"/>
    </head> 
    <body>
        <!-- navigation bar -->
      <div>
      <nav class="nav">
        <ul>
          <li><img  src="pics/xgym.png" alt="logo" height="120px" width="200px"></li>
          <li><a class="a" href="home.jsp"><b>Home</a></li>
          <li class="dropdown"><a class="a" href="aboutTheGym.jsp">About the GYM</b></a>
                                  <div class="dropdown-content">
                                    <a href="history.jsp">History of the gym</a>
                                    <a href="equipments.jsp">Equipments</a>
                                    <a  href="rules.jsp">Rules and regulations</a>
                                    <a href="terms.jsp">Terms and Conditions</a>
                                  </div>
          </li>
          <li><a class="a" href="sport.jsp"><b>Sports</a></li>
          <li><a class="a" href="fitness.jsp">Fitness</span></a></li>
          <li><a class="a" href="schedule.jsp">Schedule</a></li>
          <li><a href="Cart.jsp"><img  src="pics/cart.png" alt="logo" height="50px" width="50px"></a></li>
          <li  class="dropdown"><a class="a" href="ContactUs.jsp">Contact Us</b></a>
                                  <div class="dropdown-content">
                                    <a href="feedback.jsp">give feedback</a>
                                    <a href="contact.jsp">Contact details</a>
                                  </div>
          </li>
        </ul>
      
        
   <!-- part with logo and login-->
         <table class="part01">
            <tr>
                <td><a href="userProfile.jsp"><img src="pics/user.png" alt="logo" height="80px" width="80px"></a></td>
                <td>
                    <%String username = (String)session.getAttribute("username");%>
                    <h3>welcome <%=username%></h3>
                    <h3><a value="Logout" href="logout_process.jsp" name="logout" id="logout">Logout</a>
                        
                    </h3>
                </td>
            </tr>
        </table>
 
        </nav>
    </div>
                    
<div class="pic" >
    <td><img src="pics/Yoga.jpg" alt="Yoga"/></td>   
    <table border="2" align="center">
        <tr><h1 >Yoga</h1></tr>
        <tr>
                 
            <td>trainee name</td>
            <td>trainee id</td>
            <td>trainee type</td>
            <td>message</td>
        </tr>  
        <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="(select * from trainee where traineetype='Yoga')";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
    %>
        <tr>
        
            <td><%=resultSet.getString("traineename") %></td>
            <td><%=resultSet.getString("traineeid") %></td>
            <td><%=resultSet.getString("traineetype") %></td>
            <td><%=resultSet.getString("message") %></td>

            </tr>
    <%
}


connection.close();
} catch (Exception e) {
        e.printStackTrace();
}
%>
    </table>
       
    <div>
         <h2>join class ?</h2>   
         <h3>click 'join' button</h3>
    </div>
    
    <!--<input type="button" name="Pay Now" id="Pay Now" style="width:150px;height: 40px;color:black">-->
    <button style="width:100px;height: 50px;background-color: black;color: snow" onclick="location.href='Cart.jsp'">join</button>
</div>
    
    <br/><br/>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
