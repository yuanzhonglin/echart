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
            	    legend: {
            	        data:['高度(km)与气温(°C)变化关系']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            magicType : {show: true, type: ['line', 'bar']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    tooltip : {
            	        trigger: 'axis',
            	        formatter: "Temperature : <br/>{b}km : {c}°C"
            	    },
            	    xAxis : [
            	        {
            	            type : 'value',
            	            axisLabel : {
            	                formatter: '{value} °C'
            	            }
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'category',
            	            axisLine : {onZero: false},
            	            axisLabel : {
            	                formatter: '{value} km'
            	            },
            	            boundaryGap : false,
            	            data : ['0', '10', '20', '30', '40', '50', '60', '70', '80']
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'高度(km)与气温(°C)变化关系',
            	            type:'line',
            	            smooth:true,
            	            itemStyle: {
            	                normal: {
            	                    lineStyle: {
            	                        shadowColor : 'rgba(0,0,0,0.4)'
            	                    }
            	                }
            	            },
            	            data:[15, -50, -56.5, -46.5, -22.1, -2.5, -27.7, -55.7, -76.5]
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
