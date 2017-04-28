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
            	    tooltip : {
            	        trigger: 'item'
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataZoom : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataRange: {
            	        min: 0,
            	        max: 100,
            	        y: 'center',
            	        text:['高','低'],           // 文本，默认为数值文本
            	        color:['lightgreen','yellow'],
            	        calculable : true
            	    },
            	    xAxis : [
            	        {
            	            type : 'value',
            	            scale : true
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value',
            	            position:'right',
            	            scale : true
            	        }
            	    ],
            	    animation: false,
            	    series : [
            	        {
            	            name:'scatter1',
            	            type:'scatter',
            	            symbolSize:5,
            	            data: (function () {
            	                var d = [];
            	                var len = 500;
            	                var value;
            	                while (len--) {
            	                    value = (Math.random()*100).toFixed(2) - 0;
            	                    d.push([
            	                        (Math.random()*value + value).toFixed(2) - 0,
            	                        (Math.random()*value).toFixed(2) - 0,
            	                        value
            	                    ]);
            	                }
            	                return d;
            	            })()
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
