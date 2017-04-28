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
            	    title: {
            	        x: 'center',
            	        text: 'ECharts例子个数统计',
            	        subtext: 'Rainbow bar example',
            	        link: 'http://echarts.baidu.com/doc/example.html'
            	    },
            	    tooltip: {
            	        trigger: 'item'
            	    },
            	    toolbox: {
            	        show: true,
            	        feature: {
            	            dataView: {show: true, readOnly: false},
            	            restore: {show: true},
            	            saveAsImage: {show: true}
            	        }
            	    },
            	    calculable: true,
            	    grid: {
            	        borderWidth: 0,
            	        y: 80,
            	        y2: 60
            	    },
            	    xAxis: [
            	        {
            	            type: 'category',
            	            show: false,
            	            data: ['Line', 'Bar', 'Scatter', 'K', 'Pie', 'Radar', 'Chord', 'Force', 'Map', 'Gauge', 'Funnel']
            	        }
            	    ],
            	    yAxis: [
            	        {
            	            type: 'value',
            	            show: false
            	        }
            	    ],
            	    series: [
            	        {
            	            name: 'ECharts例子个数统计',
            	            type: 'bar',
            	            itemStyle: {
            	                normal: {
            	                    color: function(params) {
            	                        // build a color map as your need.
            	                        var colorList = [
            	                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
            	                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
            	                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
            	                        ];
            	                        return colorList[params.dataIndex]
            	                    },
            	                    label: {
            	                        show: true,
            	                        position: 'top',
            	                        formatter: '{b}\n{c}'
            	                    }
            	                }
            	            },
            	            data: [12,21,10,4,12,5,6,5,25,23,7],
            	            markPoint: {
            	                tooltip: {
            	                    trigger: 'item',
            	                    backgroundColor: 'rgba(0,0,0,0)',
            	                    formatter: function(params){
            	                        return '<img src="' 
            	                                + params.data.symbol.replace('image://', '')
            	                                + '"/>';
            	                    }
            	                },
            	                data: [
            	                    {xAxis:0, y: 350, name:'Line', symbolSize:20, symbol: 'image://../asset/ico/折线图.png'},
            	                    {xAxis:1, y: 350, name:'Bar', symbolSize:20, symbol: 'image://../asset/ico/柱状图.png'},
            	                    {xAxis:2, y: 350, name:'Scatter', symbolSize:20, symbol: 'image://../asset/ico/散点图.png'},
            	                    {xAxis:3, y: 350, name:'K', symbolSize:20, symbol: 'image://../asset/ico/K线图.png'},
            	                    {xAxis:4, y: 350, name:'Pie', symbolSize:20, symbol: 'image://../asset/ico/饼状图.png'},
            	                    {xAxis:5, y: 350, name:'Radar', symbolSize:20, symbol: 'image://../asset/ico/雷达图.png'},
            	                    {xAxis:6, y: 350, name:'Chord', symbolSize:20, symbol: 'image://../asset/ico/和弦图.png'},
            	                    {xAxis:7, y: 350, name:'Force', symbolSize:20, symbol: 'image://../asset/ico/力导向图.png'},
            	                    {xAxis:8, y: 350, name:'Map', symbolSize:20, symbol: 'image://../asset/ico/地图.png'},
            	                    {xAxis:9, y: 350, name:'Gauge', symbolSize:20, symbol: 'image://../asset/ico/仪表盘.png'},
            	                    {xAxis:10, y: 350, name:'Funnel', symbolSize:20, symbol: 'image://../asset/ico/漏斗图.png'},
            	                ]
            	            }
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
