<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" 
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1-strict.dtd">

<html xmlns="http://ww.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="js/ext-all.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>        
    <script type="text/javascript" src="js/ext-lang-zh_CN.js"></script>
    <link href="ext-theme-classic/ext-theme-classic-all.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript" src="M.index.jsp"></script>
    
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
<script language="JavaScript">
function myrefresh(){
   window.location.reload();
}
setTimeout('myrefresh()',5000); //指定5秒刷新一次
</script>
<meta charset="utf-8">
<title>單位掃描資料</title>
</head>
<body>
<div style='background-color:purple;width:100%'>
<div class='marquee'>
<h1>單位掃描資料</h1><br/>
</div>
</div>

<%
out.println("<style>table {width: 100%;}</style>");
out.println("<style>div{text-align:justify;-moz-text-align-last:center;text-align-last:center;}</style>");
out.println("<style>.marquee{overflow-x:-webkit-marquee;-webkit-marquee-direction:backwards;-webkit-marquee-style:scroll;-webkit-marquee-speed:slow;-webkit-marquee-repetition:infinite;}</style>");
out.println("<div class='marquee' style='background-color:orange;width:100%'>");
out.println("<h1 style='width:100%'>單位選擇</h1>");
out.println("</div>");

%>
<p>
<script>
Ext.application({
	  name: 'MyApp',

	  launch: function() {
	    Ext.create('Ext.panel.Panel', {
	      renderTo: Ext.getBody(),
	      items: [
	        {
	          xtype: 'grid',
	          title: 'Comm',
	          store: {
	            fields: ['id', 'tem', 'hem'],
	            proxy: {
	              type: 'ajax',
	              url: 'http://localhost:5502/temp',
	              reader: {
	                type: 'json',
	                rootProperty: ''
	              }
	            },
	            autoLoad: true
	          },
	          columns: [
	            { text: 'ID', dataIndex: 'id' },
	            { text: 'tem', dataIndex: 'tem' },
	            { text: 'hem', dataIndex: 'hem' }
	          ]
	        },
	        {
	          xtype: 'form',
	          title: 'Add Comm',
	          items: [
	            {
	              xtype: 'textfield',
	              name: 'name',
	              fieldLabel: 'Name'
	            },
	            {
	              xtype: 'textfield',
	              name: 'email',
	              fieldLabel: 'Email'
	            }
	          ],
	          buttons: [
                  {
                    text: 'Submit',
                    handler: function(btn) {
                      const form = btn.up('form').getForm();
                      const values = form.getValues();
                      Ext.Ajax.request({
                        url: 'http://localhost:5520/th?t=31.37',
                        method: 'GET',
                        jsonData: values,
                        success: function(response) {
                          Ext.Msg.alert('Success', 'Comm added.');
                          form.reset();
                          const grid = btn.up('panel').down('grid');
                          grid.getStore().load();
                        }
                      });
                    }
                  }
                ]
	        }
	      ]
	    });
	  }
	});

</script>
<%  
    //驅動程式名  
    String driverName = "com.mysql.cj.jdbc.Driver";  
    //資料庫使用者名稱  
    String userName = "root";  
    //密碼  
    String userPasswd = "123456";  
    //資料庫名  
    String dbName = "weakScan";
    String tableName = "weakScan";
   
    
    //聯結字串  
    String url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd;  
  
    //載入驅動  
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();  
    //建立連線  
    Connection conn = DriverManager.getConnection(url);     

    //建立Statement（負責執行sql語句）  
    Statement stmt = conn.createStatement();  
   
    String sql="select * from weakScan order by id asc limit 15;";  
    String queryD1 = "SET @i=0;";
    String queryD2 = "UPDATE comm SET id=(@i:=@i+1);";
    String queryD3 = "ALTER TABLE comm AUTO_INCREMENT=0;";
    
    //獲得資料結果集合  
    ResultSet rs = stmt.executeQuery(sql);  
    out.println("<div style='margin:10px'>");
    out.println("<ul class='list-group list-group-flush'>");
    out.println("<style>div,li{font-family:oxxo, serif;}</style>");
    out.println("<div style='background-color:lightskyblue;width:100%'><li class='list-group-item'><a href='/M/pic/insert2.jsp' target='_top'>體育室</a></li><embed src='/M/my-app/app/index.html' width='1200' height='120'/></div>");
    out.println("<div style='background-color:yellow;width:100%'><li class='list-group-item'><a href='/M/pic/insert1.jsp' target='_top'>研究發展處</a></li><embed src='/M/my-app/app/index.html' width='1200' height='120'/></div>");
    out.println("<div style='background-color:lightskyblue;width:100%'><li class='list-group-item'><a href='/M/pic/insert3.jsp' target='_top'>國際事務處</a></li><embed src='/M/my-app/app/index.html' width='1200' height='120'/></div>");
    out.println("<div style='background-color:yellow;width:100%'><li class='list-group-item'><a href='/M/pic/insert5.jsp' target='_top'>應用外語系</a></li><embed src='/M/my-app/app/index.html' width='1200' height='120'/></div>");
    out.println("<div style='background-color:lightskyblue;width:100%'><li class='list-group-item'><a href='/M/pic/insert4.jsp' target='_top'>語言中心</a></li><embed src='/M/my-app/app/index.html' width='1200' height='120'/></div>");
    out.println("<div style='background-color:yellow;width:100%'><li class='list-group-item'><a href='/M/pic/insert6.jsp' target='_top'>智慧商務中心</a></li><embed src='/M/my-app/app/index.html' width='1200' height='120'/></div>");
    out.println("</ul>");
    
    out.println("</div>");
    out.println("<style>table {width: 100%;}</style>");
    
    out.println("<style>div{text-align:justify;-moz-text-align-last:center;text-align-last:center;}</style>");
    out.println("<style>.marquee{overflow-x:-webkit-marquee;-webkit-marquee-direction:backwards;-webkit-marquee-style:scroll;-webkit-marquee-speed:slow;-webkit-marquee-repetition:infinite;}</style>");
    out.println("<div class='marquee' style='background-color:orange;width:100%'>");
    out.println("<h1 style='width:100%'>掃描各單位資料</h1>");
    out.println("</div>");
    //依次遍歷結果集（表中的記錄）  
    out.println("<p><center><table><colgroup span='3' style='background-color: yellow;'></colgroup><tr bgcolor='#FF44FF'><th bgcolor='#FF44FF'>id</th><th bgcolor='#FF44FF'>單位</th><th bgcolor='#FF44FF'>網站</th></tr>");
    while(rs.next())  
    {   
    	
    	out.println("<tr>");
        //依據資料庫中的欄位名列印資料  
        out.println("<th>");
        out.println(rs.getInt("id")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rs.getString("department")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rs.getString("website")); 
        out.println("</th>");
        out.println("</tr>");
        
       
    }  
    out.println("</table></center></p>");
    String dbNameC = "weakScan";
    String tableNameC = "weakScan"; 
    String urlC = "jdbc:mysql://localhost/" + dbNameC + "?user=" + userName + "&password=" + userPasswd;  
    Connection connC = DriverManager.getConnection(urlC);     
    Statement stmtC = connC.createStatement();  
    String sql3 = "insert into weakScan values (15,'研究發展處','giving.yuntech.edu.tw','SA-office_of_research_and_developmen-20241112','3','無中高以上弱點','2025-02-23','2025-02-23');";
    String sql2="select * from " + tableNameC;  
    ResultSet rsC = stmtC.executeQuery(sql2);  
    out.println("<style>div{text-align:justify;-moz-text-align-last:center;text-align-last:center;}</style>");
    out.println("<style>.marquee{overflow-x:-webkit-marquee;-webkit-marquee-direction:backwards;-webkit-marquee-style:scroll;-webkit-marquee-speed:slow;-webkit-marquee-repetition:infinite;}</style>");
    out.println("<div class='marquee' style='background-color:orange;width:100%'>");
    out.println("<h1 style='width:100%'>單位列表</h1>");
    out.println("</div>");
    //依次遍歷結果集（表中的記錄）  
    out.println("<p><center><table><colgroup span='5' style='background-color: yellow;'></colgroup><tr bgcolor='#FF44FF'><th bgcolor='#FF44FF'>id</th><th bgcolor='#FF44FF'>單位名稱</th><th bgcolor='#FF44FF'>網站</th><th bgcolor='#FF44FF'>網段</th><th bgcolor='#FF44FF'>資料刪除</th></tr>");
    while(rsC.next())  
    {   
    	
    	out.println("<tr>");
        //依據資料庫中的欄位名列印資料  
        out.println("<th>");
        out.println(rsC.getString("id")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rsC.getString("department")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rsC.getString("website")); 
        out.println("</th>");
        out.println("<th>");
        out.println(rsC.getString("NessusName")); 
        out.println("</th>");
        out.println("<th>");
        out.print("<a href='/M/pic/delete2.jsp?id="+rsC.getString("id")+"' target='_top'>刪除</a>");   
        out.println("</th>");
        out.println("</tr>");
       
       
    }  
    out.println("<embed src='/M/images/dinosaur.jpg' width='600' height='400'></embed>");
    out.println("<li class='list-group-item active'><a href='/M/pic/delete.jsp' target='_top'><b>資料重置</b></a></li>");
    out.println("</table></center></p>");
    //關閉連線  
    rsC.close();  
    stmtC.close();  
    connC.close();  
    
    
    %>
   
   </p>
</body>
</html>