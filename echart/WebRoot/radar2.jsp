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
            	    title : {
            	        text: '罗纳尔多 vs 舍普琴科',
            	        subtext: '完全实况球员数据'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        x : 'center',
            	        data:['罗纳尔多','舍普琴科']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    polar : [
            	        {
            	            indicator : [
            	                {text : '进攻', max  : 100},
            	                {text : '防守', max  : 100},
            	                {text : '体能', max  : 100},
            	                {text : '速度', max  : 100},
            	                {text : '力量', max  : 100},
            	                {text : '技巧', max  : 100}
            	            ],
            	            radius : 130
            	        }
            	    ],
            	    series : [
            	        {
            	            name: '完全实况球员数据',
            	            type: 'radar',
            	            itemStyle: {
            	                normal: {
            	                    areaStyle: {
            	                        type: 'default'
            	                    }
            	                }
            	            },
            	            data : [
            	                {
            	                    value : [97, 42, 88, 94, 90, 86],
            	                    name : '舍普琴科'
            	                },
            	                {
            	                    value : [97, 32, 74, 95, 88, 92],
            	                    name : '罗纳尔多'
            	                }
            	            ]
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
