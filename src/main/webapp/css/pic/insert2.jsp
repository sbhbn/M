<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
   color: red;
}
#center{
   text:align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入數據</title>
</head>
<script>


function go()
{
 window.history.go(-1);
}
setTimeout("go()",3000);


</script>
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
  
       PreparedStatement pstmt = null;
       try
       {
                Class.forName("com.mysql.jdbc.Driver");
                String queryD1 = "SET @i=0;";
                String queryD2 = "UPDATE comm SET id=(@i:=@i+1);";
                String queryD3 = "ALTER TABLE comm AUTO_INCREMENT=0;";
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weakScan", "root", "123456");
                  Statement st=conn.createStatement();
                  String query = "insert into weakScan values(1,'體育室','http://asp.yuntech.edu.tw','huangshu@yuntech.edu.tw','SA-PE-20241107',9,'done','2025-02-14','2025-02-14')";
           	   
                 

                  String q = "alter table weakScan auto_increment=0;";
        	      // create the mysql insert preparedstatement
        	      PreparedStatement preparedStmt = conn.prepareStatement(query);
        	   
        	      PreparedStatement preparedSR1 = conn.prepareStatement(queryD1);
        	      PreparedStatement preparedSR2 = conn.prepareStatement(queryD2);
        	      PreparedStatement preparedSR3 = conn.prepareStatement(queryD3);
        	   // execute the preparedstatement
        	      preparedStmt.execute();
        	      preparedSR1.execute();
        	      preparedSR2.execute();
        	      preparedSR3.execute();
        	      
        	    
//          int i=st.executeUpdate("insert into comm values('"+id+"','"+name+"','"+prepTime);
       out.println("<h1 color='red'><center>資料已紀錄</center></h1>");
       conn.close();
        
        // 執行插入
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("資料插入成功！");
        } else {
            out.println("資料插入失敗。");
        }
             

                	      // execute the preparedstatement
                	      pstmt.execute();
                	      
                	    
//                  int i=st.executeUpdate("insert into comm values('"+id+"','"+name+"','"+prepTime);
               out.println("<h1 color='red'><center>弱掃單位已紀錄!</center></h1>");
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
