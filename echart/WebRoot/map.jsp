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
            	    series : [
            	        {
            	            name: 'Map',
            	            type: 'map',
            	            mapLocation: {
            	                x : 'left',
            	                y : 'top',
            	                height : 500
            	            },
            	            selectedMode: 'multiple',
            	            itemStyle: {
            	                normal: {
            	                    borderWidth:2,
            	                    borderColor:'lightgreen',
            	                    color: 'orange',
            	                    label: {
            	                        show: false
            	                    }
            	                },
            	                emphasis: {                 // 也是选中样式
            	                    borderWidth:2,
            	                    borderColor:'#fff',
            	                    color: '#32cd32',
            	                    label: {
            	                        show: true,
            	                        textStyle: {
            	                            color: '#fff'
            	                        }
            	                    }
            	                }
            	            },
            	            data:[
            	                 {
            	                     name: '广东',
            	                     value: Math.round(Math.random()*1000),
            	                     itemStyle: {
            	                        normal: {
            	                            color: '#32cd32',
            	                            label: {
            	                                show: true,
            	                                textStyle: {
            	                                    color: '#fff',
            	                                    fontSize: 15
            	                                }
            	                            }
            	                        },
            	                        emphasis: {                 // 也是选中样式
            	                            borderWidth:5,
            	                            borderColor:'yellow',
            	                            color: '#cd5c5c',
            	                            label: {
            	                                show: false,
            	                                textStyle: {
            	                                    color: 'blue'
            	                                }
            	                            }
            	                        }
            	                    }
            	                }
            	            ],
            	            markPoint : {
            	                itemStyle : {
            	                    normal:{
            	                        color:'skyblue'
            	                    }
            	                },
            	                data : [
            	                    {name : '天津', value : 350},
            	                    {name : '上海', value : 103},
            	                    {
            	                        name : 'echarts',
            	                        symbol: 'image://../asset/img/echarts-logo.png',
            	                        symbolSize: 21,
            	                        x: 300,
            	                        y: 100
            	                    }
            	                ]
            	            },
            	            geoCoord: {
            	                '上海': [121.4648,31.2891],
            	                '天津': [117.4219,39.4189]
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
