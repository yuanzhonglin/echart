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
            	        data:['选定区间数据']
            	    },
            	    toolbox: {
            	        show : true,
            	        feature : {
            	            mark : {show: true},
            	            dataView : {readOnly:false},
            	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataZoom : {
            	        show : true,
            	        realtime : false,
            	        start : 0,
            	        end : 10,
            	        xAxisIndex:1
            	    },
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : true,
            	            data : function (){
            	                var list = [];
            	                for (var i = 0; i < 10; i++) {
            	                    list.push(i);
            	                }
            	                return list;
            	            }()
            	        },
            	        {
            	            type : 'category',
            	            name:'隐藏全局',
            	            boundaryGap : true,
            	            data : function (){
            	                var list = [];
            	                for (var i = 0; i < 100; i++) {
            	                    list.push(i);
            	                }
            	                return list;
            	            }(),
            	            splitLine: {show:false},
            	            splitArea: {show:false}
            	        }      
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'选定区间数据',
            	            type:'line',
            	            data:function (){
            	                var list = [];
            	                for (var i = 0; i < 10; i++) {
            	                    list.push(Math.round(Math.random()* 30) + 30);
            	                }
            	                return list;
            	            }()
            	        },
            	        {
            	            name:'全局',
            	            type:'line',
            	            symbol:'none',
            	            itemStyle:{  
            	              normal:{
            	                color:'rgba(0,0,0,0)'
            	              }
            	            },
            	            data:function (){
            	                var list = [];
            	                for (var i = 0; i < 100; i++) {
            	                    list.push(Math.round(Math.random()* 10));
            	                }
            	                return list;
            	            }(),
            	          xAxisIndex:1
            	        }
            	    ]
            	};
            	var ecConfig = require('echarts/config');
            	function getData(param) {
            	  var start = param.zoom.start;
            	  var end = param.zoom.end;
            	  var curOption = this.getOption();
            	  curOption.xAxis[0].data = function (){
            	    var list = [];
            	    for (var i = start; i < end; i++) {
            	      list.push(i);
            	    }
            	    return list;
            	  }();
            	  curOption.series[0].data = function (){
            	    var list = [];
            	    for (var i = start; i < end; i++) {
            	      list.push(Math.round(Math.random()* 30) + 30);
            	    }
            	    return list;
            	  }();
            	  myChart.setOption(curOption,true)
            	}
            	myChart.on(ecConfig.EVENT.DATA_ZOOM, getData);
        }  
    );  
    </script>
  </head>
  
  <body>
   <div id="main" style="width: 600px;height:400px;"></div> 
  </body>
</html>
