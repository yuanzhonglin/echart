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
            	        trigger: 'item'
            	    },
            	    legend: {
            	        data:['随机数据1','随机数据2','随机数据3','随机数据4','随机数据5']
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
            	                { text : '指标一' },
            	                { text : '指标二' },
            	                { text : '指标三' },
            	                { text : '指标四' },
            	                { text : '指标五' }
            	            ],
            	            center : [document.getElementById('main').offsetWidth - 250, 225],
            	            radius : 100
            	        }
            	    ],
            	    calculable : false,
            	    series : [
            	        {
            	            name:'pie',
            	            type:'pie',
            	            radius : [0, 110],
            	            center: [250, 225],
            	            data: (function (){
            	                var res = [];
            	                var len = 0;
            	                while (len++ < 5) {
            	                    res.push({
            	                        name: '随机数据' + len,
            	                        value: Math.round(Math.random()*10)
            	                    });
            	                }
            	                return res;
            	            })()
            	        },
            	        {
            	            name: 'radar',
            	            type: 'radar',
            	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            	            data: (function (){
            	                var res = [];
            	                var len = 0;
            	                while (len++ < 3) {
            	                    res.push({
            	                        name: 'data' + len,
            	                        value: [
            	                            Math.round(Math.random()*100),
            	                            Math.round(Math.random()*100),
            	                            Math.round(Math.random()*100),
            	                            Math.round(Math.random()*100),
            	                            Math.round(Math.random()*100)
            	                        ]
            	                    });
            	                }
            	                return res;
            	            })()
            	        }
            	    ]
            	};
            	var lastIndex = 5;
            	var axisData;
            	clearInterval(timeTicket);
            	timeTicket = setInterval(function (){
            	    lastIndex += 1;
            	    // 动态数据接口 addData
            	    myChart.addData([
            	        [
            	            0,        // 系列索引
            	            {         // 新增数据
            	                name: '随机数据' + lastIndex,
            	                value: Math.round(Math.random()*10)
            	            }, 
            	            false,     // 新增数据是否从队列头部插入
            	            false,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
            	            '随机数据' + lastIndex
            	        ],
            	        [
            	            1,        // 系列索引
            	            {         // 新增数据
            	                name: 'data' + lastIndex,
            	                value: [
            	                    Math.round(Math.random()*100),
            	                    Math.round(Math.random()*100),
            	                    Math.round(Math.random()*100),
            	                    Math.round(Math.random()*100),
            	                    Math.round(Math.random()*100)
            	                ]
            	            }, 
            	            false,     // 新增数据是否从队列头部插入
            	            false      // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
            	        ]
            	    ]);
            	}, 2000);
            
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
