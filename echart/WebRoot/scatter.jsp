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
            	    legend: {
            	        data:['scatter1','scatter2']
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
            	    xAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value'
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'scatter1',
            	            type:'scatter',
            	            symbol: 'emptyCircle', //'circle', 'rectangle', 'triangle', 'diamond', 'emptyCircle', 'emptyRectangle', 'emptyTriangle', 'emptyDiamond'
            	            symbolSize: function (value){
            	                if (value[0] < 2) {
            	                    return 2;
            	                }
            	                else if (value[0] < 8) {
            	                    return Math.round(value[2] * 3);
            	                }
            	                else {
            	                    return 20;
            	                }
            	            },
            	            itemStyle: {
            	                normal: {
            	                    color: 'lightblue',
            	                    borderWidth: 4,
            	                    label : {show: true}
            	                },
            	                emphasis: {
            	                    color: 'lightgreen',
            	                }
            	            },
            	            data: (function () {
            	                var d = [];
            	                var len = 20;
            	                while (len--) {
            	                    d.push([
            	                        (Math.random()*10).toFixed(2) - 0,
            	                        (Math.random()*10).toFixed(2) - 0,
            	                        (Math.random()*10).toFixed(2) - 0
            	                    ]);
            	                }
            	                return d;
            	            })(),
            	            markPoint : {
            	                data : [
            	                    {type : 'max', name: 'y最大值'},
            	                    {type : 'min', name: 'y最小值'},
            	                    {type : 'max', name: 'x最大值', valueIndex : 0, symbol:'arrow',itemStyle:{normal:{borderColor:'red'}}},
            	                    {type : 'min', name: 'x最小值', valueIndex : 0, symbol:'arrow',itemStyle:{normal:{borderColor:'red'}}}
            	                ]
            	            },
            	            markLine : {
            	                data : [
            	                    {type : 'average', name: 'y平均值'},
            	                    {type : 'average', name: 'x平均值', valueIndex : 0, itemStyle:{normal:{borderColor:'red'}}}
            	                ]
            	            }
            	        },
            	        {
            	            name:'scatter2',
            	            type:'scatter',
            	            symbol: 'image://../asset/ico/favicon.png',     // 系列级个性化拐点图形
            	            symbolSize: function (value){
            	                return Math.round(value[2] * 3);
            	            },
            	            itemStyle: {
            	                emphasis : {
            	                    label : {show: true}
            	                }
            	            },
            	            data: (function () {
            	                var d = [];
            	                var len = 20;
            	                while (len--) {
            	                    d.push([
            	                        (Math.random()*10).toFixed(2) - 0,
            	                        (Math.random()*10).toFixed(2) - 0,
            	                        (Math.random()*10).toFixed(2) - 0
            	                    ]);
            	                }
            	                d.push({
            	                    value : [5,5,1000],
            	                    itemStyle: {
            	                        normal: {
            	                            borderWidth: 8,
            	                            color: 'orange'
            	                        },
            	                        emphasis: {
            	                            borderWidth: 10,
            	                            color: '#ff4500'
            	                        }
            	                    },
            	                    symbol: 'emptyTriangle',
            	                    symbolRotate:90,
            	                    symbolSize:30
            	                })
            	                return d;
            	            })(),
            	            markPoint : {
            	                symbol: 'emptyCircle',
            	                itemStyle:{
            	                    normal:{label:{position:'top'}}
            	                },
            	                data : [
            	                    {name : '有个东西', value : 1000, xAxis: 5, yAxis: 5, symbolSize:80}
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
