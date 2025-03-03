<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function go()
{
 window.history.go(-1);
}
setTimeout("go()",3000);
</script>
<style>
body {
  background-color: lightblue;
  opacity:0.8;
  background-size:100% 100%
  
}
h1{
  color: white;
  text-align: center;
}
table {border:5px solid #900;}
p,li {
  font-family: verdana;
  font-size: 30px;
  text-align: center;
   color: blue;
}
#center{
   text:align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入數據</title>
</head>
<body>
    <div style="margin: auto; width: 80%">
        <sql:setDataSource var="connection" driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost/weakScan?useSSL=false&characterEncoding=utf8"
            user="root" password="123456" />
       <% 
       
       String department = request.getParameter("department");
       String website = request.getParameter("website");
       String email = request.getParameter("email");
       String nessusName = request.getParameter("NessusName");
       String hole = request.getParameter("hole");
       String deal = request.getParameter("deal");
       String recover = request.getParameter("recover");
       try
       {
                Class.forName("com.mysql.jdbc.Driver");
        

                String queryD1 = "SET @i=0;";
                String queryD2 = "UPDATE comm SET id=(@i:=@i+1);";
                String queryD3 = "ALTER TABLE comm AUTO_INCREMENT=0;";
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weakScan", "root", "123456");
                  Statement st=conn.createStatement();
                  String query = "insert into weakScan values(2,'研究發展處','https://giving.yuntech.edu.tw/','huangshu@yuntech.edu.tw','SA-office of research and development-20241112',0,'no hole','2025-02-28','2025-02-28')";
           	      

        	      // create the mysql insert preparedstatement
        	      PreparedStatement preparedStmt = conn.prepareStatement(query);
        	   // execute the preparedstatement
        	      preparedStmt.execute();
                	    
//                  int i=st.executeUpdate("insert into comm values('"+id+"','"+name+"','"+prepTime);
               out.println("<h1 color='red'><center>單位已紀錄!</center></h1>");
               conn.close();
               }
               catch(Exception e)
               {
               System.out.print(e);
               e.printStackTrace();
               }
       %>
    </div>
</body>
</html>