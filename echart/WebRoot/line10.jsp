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
              
            option = {
            		   title: {
            		       text: "对数轴示例",
            		       x: "center"
            		   },
            		   tooltip: {
            		       trigger: "item",
            		       formatter: "{a} <br/>{b} : {c}"
            		   },
            		   legend: {
            		       x: 'left',
            		       data: ["2的指数", "3的指数"]
            		   },
            		   xAxis: [
            		       {
            		           type: "category",
            		           name: "x",
            		           splitLine: {show: false},
            		           data: ["一", "二", "三", "四", "五", "六", "七", "八", "九"]
            		       }
            		   ],
            		   yAxis: [
            		       {
            		           type: "log",
            		           logLabelBase: 3,
            		           splitNumber: 3,
            		           name: "y",
            		           axisLabel: {
            		                margin: '25',
            		                textStyle: {
            		                    align: 'left'
            		                }
            		           }
            		       }
            		   ],
            		    toolbox: {
            		       show: true,
            		       feature: {
            		           mark: {
            		               show: true
            		           },
            		           dataView: {
            		               show: true,
            		               readOnly: true
            		           },
            		           restore: {
            		               show: true
            		           },
            		           saveAsImage: {
            		               show: true
            		           }
            		       }
            		   },
            		   calculable: true,
            		   series: [
            		       {
            		           name: "3的指数",
            		           type: "line",
            		           data: [1, 3, 9, 27, 81, 247, 741, 2223, 6669]

            		       },
            		       {
            		           name: "2的指数",
            		           type: "line",
            		           data: [1, 2, 4, 8, 16, 32, 64, 128, 256]

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
