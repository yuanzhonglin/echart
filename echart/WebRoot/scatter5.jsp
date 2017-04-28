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
            	        text : '类目坐标散点图',
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
            	        data : ['series1', 'series2']
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
            	    xAxis : [
            	        {
            	            type : 'category',
            	            axisLabel: {
            	                formatter : function(v) {
            	                    return '类目' + v
            	                }
            	            },
            	            data : function (){
            	                var list = [];
            	                var len = 0;
            	                while (len++ < 500) {
            	                    list.push(len);
            	                }
            	                return list;
            	            }()
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
            	                trigger: 'item',
            	                formatter : function (params) {
            	                    return params.seriesName + ' （'  + '类目' + params.value[0] + '）<br/>'
            	                           + params.value[1] + ', ' 
            	                           + params.value[2]; 
            	                },
            	                axisPointer:{
            	                    show: true
            	                }
            	            },
            	            symbolSize: function (value){
            	                return Math.round(value[2]/10);
            	            },
            	            data: (function () {
            	                var d = [];
            	                var len = 0;
            	                var value;
            	                while (len++ < 500) {
            	                    d.push([
            	                        len,
            	                        (Math.random()*30).toFixed(2) - 0,
            	                        (Math.random()*100).toFixed(2) - 0
            	                    ]);
            	                }
            	                return d;
            	            })()
            	        },
            	        {
            	            name:'series2',
            	            type:'scatter',
            	            tooltip : {
            	                trigger: 'item',
            	                formatter : function (params) {
            	                    return params.seriesName + ' （'  + '类目' + params.value[0] + '）<br/>'
            	                           + params.value[1] + ', ' 
            	                           + params.value[2]; 
            	                },
            	                axisPointer:{
            	                    show: true
            	                }
            	            },
            	            symbolSize: function (value){
            	                return Math.round(value[2]/10);
            	            },
            	            data: (function () {
            	                var d = [];
            	                var len = 0;
            	                var value;
            	                while (len++ < 500) {
            	                    d.push([
            	                        len,
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
