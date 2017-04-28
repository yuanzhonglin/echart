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
            	        text: '动态数据',
            	        subtext: '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        data:['最新成交价', '预购队列']
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
            	    dataZoom : {
            	        show : false,
            	        start : 0,
            	        end : 100
            	    },
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : true,
            	            data : (function (){
            	                var now = new Date();
            	                var res = [];
            	                var len = 10;
            	                while (len--) {
            	                    res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
            	                    now = new Date(now - 2000);
            	                }
            	                return res;
            	            })()
            	        },
            	        {
            	            type : 'category',
            	            boundaryGap : true,
            	            data : (function (){
            	                var res = [];
            	                var len = 10;
            	                while (len--) {
            	                    res.push(len + 1);
            	                }
            	                return res;
            	            })()
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value',
            	            scale: true,
            	            name : '价格',
            	            boundaryGap: [0.2, 0.2]
            	        },
            	        {
            	            type : 'value',
            	            scale: true,
            	            name : '预购量',
            	            boundaryGap: [0.2, 0.2]
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'预购队列',
            	            type:'bar',
            	            xAxisIndex: 1,
            	            yAxisIndex: 1,
            	            data:(function (){
            	                var res = [];
            	                var len = 10;
            	                while (len--) {
            	                    res.push(Math.round(Math.random() * 1000));
            	                }
            	                return res;
            	            })()
            	        },
            	        {
            	            name:'最新成交价',
            	            type:'line',
            	            data:(function (){
            	                var res = [];
            	                var len = 10;
            	                while (len--) {
            	                    res.push((Math.random()*10 + 5).toFixed(1) - 0);
            	                }
            	                return res;
            	            })()
            	        }
            	    ]
            	};
            	var lastData = 11;
            	var axisData;
            	clearInterval(timeTicket);
            	timeTicket = setInterval(function (){
            	    lastData += Math.random() * ((Math.round(Math.random() * 10) % 2) == 0 ? 1 : -1);
            	    lastData = lastData.toFixed(1) - 0;
            	    axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');
            	    
            	    // 动态数据接口 addData
            	    myChart.addData([
            	        [
            	            0,        // 系列索引
            	            Math.round(Math.random() * 1000), // 新增数据
            	            true,     // 新增数据是否从队列头部插入
            	            false     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
            	        ],
            	        [
            	            1,        // 系列索引
            	            lastData, // 新增数据
            	            false,    // 新增数据是否从队列头部插入
            	            false,    // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
            	            axisData  // 坐标轴标签
            	        ]
            	    ]);
            	}, 2100);
            
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
