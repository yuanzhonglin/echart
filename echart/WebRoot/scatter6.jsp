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
            	        text : '时间坐标散点图',
            	        subtext : 'dataZoom支持'
            	    },
            	    tooltip : {
            	        trigger: 'axis',
            	        axisPointer:{
            	            show: true,
            	            type : 'cross',
            	            lineStyle: {
            	                type : 'dashed',
            	                width : 1
            	            }
            	        }
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
            	    dataZoom: {
            	        show: true,
            	        start : 30,
            	        end : 70
            	    },
            	    legend : {
            	        data : ['series1']
            	    },
            	    dataRange: {
            	        min: 0,
            	        max: 100,
            	        orient: 'horizontal',
            	        y: 30,
            	        x: 'center',
            	        //text:['高','低'],           // 文本，默认为数值文本
            	        color:['lightgreen','orange'],
            	        splitNumber: 5
            	    },
            	    grid: {
            	        y2: 80
            	    },
            	    xAxis : [
            	        {
            	            type : 'time',
            	            splitNumber:10
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    animation: false,
            	    series : [
            	        {
            	            name:'series1',
            	            type:'scatter',
            	            tooltip : {
            	                trigger: 'axis',
            	                formatter : function (params) {
            	                    var date = new Date(params.value[0]);
            	                    return params.seriesName 
            	                           + ' （'
            	                           + date.getFullYear() + '-'
            	                           + (date.getMonth() + 1) + '-'
            	                           + date.getDate() + ' '
            	                           + date.getHours() + ':'
            	                           + date.getMinutes()
            	                           +  '）<br/>'
            	                           + params.value[1] + ', ' 
            	                           + params.value[2];
            	                },
            	                axisPointer:{
            	                    type : 'cross',
            	                    lineStyle: {
            	                        type : 'dashed',
            	                        width : 1
            	                    }
            	                }
            	            },
            	            symbolSize: function (value){
            	                return Math.round(value[2]/10);
            	            },
            	            data: (function () {
            	                var d = [];
            	                var len = 0;
            	                var now = new Date();
            	                var value;
            	                while (len++ < 1500) {
            	                    d.push([
            	                        new Date(2014, 9, 1, 0, Math.round(Math.random()*10000)),
            	                        (Math.random()*30).toFixed(2) - 0,
            	                        (Math.random()*100).toFixed(2) - 0
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
