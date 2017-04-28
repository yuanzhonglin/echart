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
            	        text: 'ECharts2 vs ECharts1',
            	        subtext: 'Chrome下测试数据'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        data:[
            	            'ECharts1 - 2k数据','ECharts1 - 2w数据','ECharts1 - 20w数据','',
            	            'ECharts2 - 2k数据','ECharts2 - 2w数据','ECharts2 - 20w数据'
            	        ]
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
            	    grid: {y: 70, y2:30, x2:20},
            	    xAxis : [
            	        {
            	            type : 'category',
            	            data : ['Line','Bar','Scatter','K','Map']
            	        },
            	        {
            	            type : 'category',
            	            axisLine: {show:false},
            	            axisTick: {show:false},
            	            axisLabel: {show:false},
            	            splitArea: {show:false},
            	            splitLine: {show:false},
            	            data : ['Line','Bar','Scatter','K','Map']
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value',
            	            axisLabel:{formatter:'{value} ms'}
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'ECharts2 - 2k数据',
            	            type:'bar',
            	            itemStyle: {normal: {color:'rgba(193,35,43,1)', label:{show:true}}},
            	            data:[40,155,95,75, 0]
            	        },
            	        {
            	            name:'ECharts2 - 2w数据',
            	            type:'bar',
            	            itemStyle: {normal: {color:'rgba(181,195,52,1)', label:{show:true,textStyle:{color:'#27727B'}}}},
            	            data:[100,200,105,100,156]
            	        },
            	        {
            	            name:'ECharts2 - 20w数据',
            	            type:'bar',
            	            itemStyle: {normal: {color:'rgba(252,206,16,1)', label:{show:true,textStyle:{color:'#E87C25'}}}},
            	            data:[906,911,908,778,0]
            	        },
            	        {
            	            name:'ECharts1 - 2k数据',
            	            type:'bar',
            	            xAxisIndex:1,
            	            itemStyle: {normal: {color:'rgba(193,35,43,0.5)', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'\n'):'';}}}},
            	            data:[96,224,164,124,0]
            	        },
            	        {
            	            name:'ECharts1 - 2w数据',
            	            type:'bar',
            	            xAxisIndex:1,
            	            itemStyle: {normal: {color:'rgba(181,195,52,0.5)', label:{show:true}}},
            	            data:[491,2035,389,955,347]
            	        },
            	        {
            	            name:'ECharts1 - 20w数据',
            	            type:'bar',
            	            xAxisIndex:1,
            	            itemStyle: {normal: {color:'rgba(252,206,16,0.5)', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
            	            data:[3000,3000,2817,3000,0]
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
