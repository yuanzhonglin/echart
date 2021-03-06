<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<script type="text/javascript" src="js/echarts/echarts.js" ></script> 
	<meta charset="utf-8">
    <script type="text/javascript">
	   // 路径配置  
	   require.config({  
	       paths: {  
	           echarts: 'js/echarts'  
	       }  
	   });  
	    // 使用  
	    require(  
	        [  
	            'echarts',  
	            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载  
	        ],  
        function (ec) {  
            // 基于准备好的dom，初始化echarts图表  
            var myChart = ec.init(document.getElementById('main'));   
              
            var heatData = [];
            for (var i = 0; i < 20; ++i) {
                heatData.push([
                    400 + Math.random() * 300,
                    5 + Math.random() * 10,
                    Math.random()
                ]);
            }
            for (var i = 0; i < 100; ++i) {
                heatData.push([
                    100 + Math.random() * 600,
                    150 + Math.random() * 50,
                    Math.random()
                ]);
            }
            for (var i = 0; i < 200; ++i) {
                heatData.push([
                    Math.random() * 1000,
                    Math.random() * 800,
                    Math.random() * 0.5
                ]);
            }
            option = {
                title : {
                    text: '热力图'
                },
                series : [
                    {
                        type : 'heatmap',
                        data : heatData,
                        hoverable : false
                    }
                ]
            };
            
            // 为echarts对象加载数据   
            myChart.setOption(option);   
        }  
    );  
    </script>
  </head>
  
  <body>
   <div id="main" style="width: 600px;height:400px;"></div> 
  </body>
</html>
