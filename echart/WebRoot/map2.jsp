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
            	        trigger: 'item',
            	        formatter: '{b}'
            	    },
            	    series : [
            	        {
            	            name: '中国',
            	            type: 'map',
            	            mapType: 'china',
            	            selectedMode : 'multiple',
            	            itemStyle:{
            	                normal:{label:{show:true}},
            	                emphasis:{label:{show:true}}
            	            },
            	            data:[
            	                {name:'广东',selected:true}
            	            ]
            	        }
            	    ]
            	};
            	var ecConfig = require('echarts/config');
            	myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param){
            	    var selected = param.selected;
            	    var str = '当前选择： ';
            	    for (var p in selected) {
            	        if (selected[p]) {
            	            str += p + ' ';
            	        }
            	    }
            	    document.getElementById('wrong-message').innerHTML = str;
            	})
            
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
