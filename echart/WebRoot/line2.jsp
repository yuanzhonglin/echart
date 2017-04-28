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
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : false,
            	            data : ['周一','周二','周三','周四','周五','周六','周日']
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'邮件营销',
            	            type:'line',
            	            stack: '总量',
            	            data:[120, 132, 101, 134, 90, 230, 210]
            	        },
            	        {
            	            name:'联盟广告',
            	            type:'line',
            	            stack: '总量',
            	            data:[220, 182, 191, 234, 290, 330, 310]
            	        },
            	        {
            	            name:'视频广告',
            	            type:'line',
            	            stack: '总量',
            	            data:[150, 232, 201, 154, 190, 330, 410]
            	        },
            	        {
            	            name:'直接访问',
            	            type:'line',
            	            stack: '总量',
            	            data:[320, 332, 301, 334, 390, 330, 320]
            	        },
            	        {
            	            name:'搜索引擎',
            	            type:'line',
            	            stack: '总量',
            	            data:[820, 932, 901, 934, 1290, 1330, 1320]
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
