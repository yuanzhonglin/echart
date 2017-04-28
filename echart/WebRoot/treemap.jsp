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
            	        text: '手机占有率',
            	        subtext: '虚构数据'
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: "{b}: {c}"
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
            	    calculable : false,
            	    series : [
            	        {
            	            name:'矩形图',
            	            type:'treemap',
            	            itemStyle: {
            	                normal: {
            	                    label: {
            	                        show: true,
            	                        formatter: "{b}"
            	                    },
            	                    borderWidth: 1
            	                },
            	                emphasis: {
            	                    label: {
            	                        show: true
            	                    }
            	                }
            	            },
            	            data:[
            	                {
            	                    name: '三星',
            	                    value: 6
            	                },
            	                {
            	                    name: '小米',
            	                    value: 4
            	                },
            	                {
            	                    name: '苹果',
            	                    value: 4
            	                },
            	                {
            	                    name: '华为',
            	                    value: 2
            	                },
            	                {
            	                    name: '联想',
            	                    value: 2
            	                },
            	                {
            	                    name: '魅族',
            	                    value: 1
            	                },
            	                {
            	                    name: '中兴',
            	                    value: 1
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
