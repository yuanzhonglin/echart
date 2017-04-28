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
            	        text: '多雷达图',
            	        subtext: '纯属虚构'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        x : 'center',
            	        data:['某软件','某主食手机','某水果手机','降水量','蒸发量']
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
            	    calculable : true,
            	    polar : [
            	        {
            	            indicator : [
            	                {text : '品牌', max  : 100},
            	                {text : '内容', max  : 100},
            	                {text : '可用性', max  : 100},
            	                {text : '功能', max  : 100}
            	            ],
            	            center : ['25%',200],
            	            radius : 80
            	        },
            	        {
            	            indicator : [
            	                {text : '外观', max  : 100},
            	                {text : '拍照', max  : 100},
            	                {text : '系统', max  : 100},
            	                {text : '性能', max  : 100},
            	                {text : '屏幕', max  : 100}
            	            ],
            	            radius : 80
            	        },
            	        {
            	            indicator : (function (){
            	                var res = [];
            	                for (var i = 1; i <= 12; i++) {
            	                    res.push({text:i+'月',max:100});
            	                }
            	                return res;
            	            })(),
            	            center : ['75%', 200],
            	            radius : 80
            	        }
            	    ],
            	    series : [
            	        {
            	            type: 'radar',
            	             tooltip : {
            	                trigger: 'item'
            	            },
            	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            	            data : [
            	                {
            	                    value : [60,73,85,40],
            	                    name : '某软件'
            	                }
            	            ]
            	        },
            	        {
            	            type: 'radar',
            	            polarIndex : 1,
            	            data : [
            	                {
            	                    value : [85, 90, 90, 95, 95],
            	                    name : '某主食手机'
            	                },
            	                {
            	                    value : [95, 80, 95, 90, 93],
            	                    name : '某水果手机'
            	                }
            	            ]
            	        },
            	        {
            	            type: 'radar',
            	            polarIndex : 2,
            	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            	            data : [
            	                {
            	                    name : '降水量',
            	                    value : [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 75.6, 82.2, 48.7, 18.8, 6.0, 2.3],
            	                },
            	                {
            	                    name:'蒸发量',
            	                    value:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 35.6, 62.2, 32.6, 20.0, 6.4, 3.3]
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
