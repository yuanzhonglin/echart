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
            	        data:['最高','最低']
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
            	    calculable : true,
            	    dataZoom : {
            	        show : true,
            	        realtime : true,
            	        start : 40,
            	        end : 60
            	    },
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : true,
            	            data : function (){
            	                var list = [];
            	                for (var i = 1; i <= 30; i++) {
            	                    list.push('2013-03-' + i);
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
            	    series : [
            	        {
            	            name:'最高',
            	            type:'line',
            	            data:function (){
            	                var list = [];
            	                for (var i = 1; i <= 30; i++) {
            	                    list.push(Math.round(Math.random()* 30) + 30);
            	                }
            	                return list;
            	            }()
            	        },
            	        {
            	            name:'最低',
            	            type:'bar',
            	            data:function (){
            	                var list = [];
            	                for (var i = 1; i <= 30; i++) {
            	                    list.push(Math.round(Math.random()* 10));
            	                }
            	                return list;
            	            }()
            	        }
            	    ]
            	};
            	var ecConfig = require('echarts/config');
            	function eConsole(param) {
            	    var mes = '【' + param.type + '】';
            	    if (typeof param.seriesIndex != 'undefined') {
            	        mes += '  seriesIndex : ' + param.seriesIndex;
            	        mes += '  dataIndex : ' + param.dataIndex;
            	    }
            	    if (param.type == 'hover') {
            	        document.getElementById('hover-console').innerHTML = 'Event Console : ' + mes;
            	    }
            	    else {
            	        document.getElementById('console').innerHTML = mes;
            	    }
            	    console.log(param);
            	}
            	/*
            	// -------全局通用
            	REFRESH: 'refresh',
            	RESTORE: 'restore',
            	RESIZE: 'resize',
            	CLICK: 'click',
            	DBLCLICK: 'dblclick',
            	HOVER: 'hover',
            	MOUSEOUT: 'mouseout',
            	// -------业务交互逻辑
            	DATA_CHANGED: 'dataChanged',
            	DATA_ZOOM: 'dataZoom',
            	DATA_RANGE: 'dataRange',
            	DATA_RANGE_HOVERLINK: 'dataRangeHoverLink',
            	LEGEND_SELECTED: 'legendSelected',
            	LEGEND_HOVERLINK: 'legendHoverLink',
            	MAP_SELECTED: 'mapSelected',
            	PIE_SELECTED: 'pieSelected',
            	MAGIC_TYPE_CHANGED: 'magicTypeChanged',
            	DATA_VIEW_CHANGED: 'dataViewChanged',
            	TIMELINE_CHANGED: 'timelineChanged',
            	MAP_ROAM: 'mapRoam',
            	*/
            	myChart.on(ecConfig.EVENT.CLICK, eConsole);
            	myChart.on(ecConfig.EVENT.DBLCLICK, eConsole);
            	//myChart.on(ecConfig.EVENT.HOVER, eConsole);
            	myChart.on(ecConfig.EVENT.DATA_ZOOM, eConsole);
            	myChart.on(ecConfig.EVENT.LEGEND_SELECTED, eConsole);
            	myChart.on(ecConfig.EVENT.MAGIC_TYPE_CHANGED, eConsole);
            	myChart.on(ecConfig.EVENT.DATA_VIEW_CHANGED, eConsole);
            
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
