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
            	        text: '预算 vs 开销（Budget vs spending）',
            	        subtext: '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        orient : 'vertical',
            	        x : 'right',
            	        y : 'bottom',
            	        data:['预算分配（Allocated Budget）','实际开销（Actual Spending）']
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
            	    polar : [
            	       {
            	           indicator : [
            	               { text: '销售（sales）', max: 6000},
            	               { text: '管理（Administration）', max: 16000},
            	               { text: '信息技术（Information Techology）', max: 30000},
            	               { text: '客服（Customer Support）', max: 38000},
            	               { text: '研发（Development）', max: 52000},
            	               { text: '市场（Marketing）', max: 25000}
            	            ]
            	        }
            	    ],
            	    calculable : true,
            	    series : [
            	        {
            	            name: '预算 vs 开销（Budget vs spending）',
            	            type: 'radar',
            	            data : [
            	                {
            	                    value : [4300, 10000, 28000, 35000, 50000, 19000],
            	                    name : '预算分配（Allocated Budget）'
            	                },
            	                 {
            	                    value : [5000, 14000, 28000, 31000, 42000, 21000],
            	                    name : '实际开销（Actual Spending）'
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
