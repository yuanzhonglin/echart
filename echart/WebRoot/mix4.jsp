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
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataRange: {
            	        min: 0,
            	        max: 100,
            	        orient: 'horizontal',
            	        y: 'top',
            	        //text:['高','低'],           // 文本，默认为数值文本
            	        color:['lightgreen','yellow'],
            	        splitNumber: 5
            	    },
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : false,
            	            data : function (){
            	                var list = [];
            	                for (var i = 1; i <= 30; i++) {
            	                    list.push('2013-03-' + i);
            	                }
            	                return list;
            	            }()
            	        },
            	        {
            	            type : 'value',
            	            scale : true,
            	            splitNumber: 29,
            	            axisLabel: {show:false},
            	            splitLine: {show:false}
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        },
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    animation: false,
            	    series : [
            	        {
            	            name:'散点',
            	            type:'scatter',
            	            tooltip : {
            	                trigger: 'item',
            	                formatter : function (params) {
            	                    return '2013-03-' + params.value[0] + '<br/>'
            	                           + params.seriesName + ' : ' 
            	                           + params.value[1] + ', ' 
            	                           + params.value[2]; 
            	                }
            	            },
            	            yAxisIndex:1,
            	            xAxisIndex:1,
            	            symbol: 'circle',
            	            symbolSize: function (value){
            	                return Math.round(value[2]/10);
            	            },
            	            data: (function () {
            	                var d = [];
            	                var len = 200;
            	                var value;
            	                while (len--) {
            	                    d.push([
            	                        Math.round(Math.random()*29) + 1,
            	                        (Math.random()*30).toFixed(2) - 0,
            	                        (Math.random()*100).toFixed(2) - 0
            	                    ]);
            	                }
            	                return d;
            	            })()
            	        },
            	        {
            	            name:'折线',
            	            type:'line',
            	            data:function (){
            	                var list = [];
            	                for (var i = 1; i <= 30; i++) {
            	                    list.push(Math.round(Math.random()* 30));
            	                }
            	                return list;
            	            }()
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
