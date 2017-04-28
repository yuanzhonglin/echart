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
            	    backgroundColor: '#1b1b1b',
            	    color: ['gold','aqua','lime'],
            	    title : {
            	        text: '模拟迁徙',
            	        subtext:'数据纯属虚构',
            	        x:'center',
            	        textStyle : {
            	            color: '#fff'
            	        }
            	    },
            	    tooltip : {
            	        trigger: 'item',
            	        formatter: '{b}'
            	    },
            	    legend: {
            	        orient: 'vertical',
            	        x:'left',
            	        data:['北京', '上海', '广州'],
            	        selectedMode: 'single',
            	        selected:{
            	            '上海' : false,
            	            '广州' : false
            	        },
            	        textStyle : {
            	            color: '#fff'
            	        }
            	    },
            	    toolbox: {
            	        show : true,
            	        orient : 'vertical',
            	        x: 'right',
            	        y: 'center',
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    dataRange: {
            	        min : 0,
            	        max : 100,
            	        calculable : true,
            	        color: ['#ff3333', 'orange', 'yellow','lime','aqua'],
            	        textStyle:{
            	            color:'#fff'
            	        }
            	    },
            	    animationDurationUpdate: 2000, // for update animation, like legend selected.
            	    series : [
            	        {
            	            name: '北京',
            	            type: 'map',
            	            roam: true,
            	            hoverable: false,
            	            mapType: 'china',
            	            itemStyle:{
            	                normal:{
            	                    borderColor:'rgba(100,149,237,1)',
            	                    borderWidth:0.5,
            	                    areaStyle:{
            	                        color: '#1b1b1b'
            	                    }
            	                }
            	            },
            	            data:[],
            	            geoCoord: {
            	                '上海': [121.4648,31.2891],
            	                '广州': [113.5107,23.2196],
            	                '北京': [116.4551,40.2539]
            	            },
            	            markLine : {
            	                smooth:true,
            	                effect : {
            	                    show: true,
            	                    scaleSize: 1,
            	                    period: 30,
            	                    color: '#fff',
            	                    shadowBlur: 10
            	                },
            	                itemStyle : {
            	                    normal: {
            	                        borderWidth:1,
            	                        label: {
            	                            show: false
            	                        },
            	                        lineStyle: {
            	                            type: 'solid',
            	                            shadowBlur: 10
            	                        }
            	                    }
            	                },
            	                data : [
            	                    [{name:'北京', smoothness:0.2}, {name:'广州',value:95}],
            	                    [{name:'北京', smoothness:0.3}, {name:'广州',value:90}],
            	                    [{name:'北京', smoothness:0.4}, {name:'广州',value:80}],
            	                    [{name:'北京', smoothness:0.5}, {name:'广州',value:70}],
            	                    [{name:'北京', smoothness:0.6}, {name:'广州',value:60}],
            	                    [{name:'广州', smoothness:0.2}, {name:'北京',value:50}],
            	                    [{name:'广州', smoothness:0.3}, {name:'北京',value:40}],
            	                    [{name:'广州', smoothness:0.4}, {name:'北京',value:30}],
            	                    [{name:'广州', smoothness:0.5}, {name:'北京',value:20}],
            	                    [{name:'广州', smoothness:0.6}, {name:'北京',value:10}]
            	                ]
            	            }
            	        },
            	        {
            	            name: '上海',
            	            type: 'map',
            	            mapType: 'china',
            	            data:[],
            	            markLine : {
            	                smooth:true,
            	                effect : {
            	                    show: true,
            	                    scaleSize: 1,
            	                    period: 30,
            	                    color: '#fff',
            	                    shadowBlur: 10
            	                },
            	                itemStyle : {
            	                    normal: {
            	                        borderWidth:1,
            	                        label: {
            	                            show: false
            	                        },
            	                        lineStyle: {
            	                            type: 'solid',
            	                            shadowBlur: 10
            	                        }
            	                    }
            	                },
            	                data : [
            	                    [{name:'北京', smoothness:0.2}, {name:'上海',value:95}],
            	                    [{name:'北京', smoothness:0.3}, {name:'上海',value:90}],
            	                    [{name:'北京', smoothness:0.4}, {name:'上海',value:80}],
            	                    [{name:'北京', smoothness:0.5}, {name:'上海',value:70}],
            	                    [{name:'北京', smoothness:0.6}, {name:'上海',value:60}],
            	                    [{name:'上海', smoothness:0.2}, {name:'北京',value:50}],
            	                    [{name:'上海', smoothness:0.3}, {name:'北京',value:40}],
            	                    [{name:'上海', smoothness:0.4}, {name:'北京',value:30}],
            	                    [{name:'上海', smoothness:0.5}, {name:'北京',value:20}],
            	                    [{name:'上海', smoothness:0.6}, {name:'北京',value:10}]
            	                ]
            	            }
            	        },
            	        {
            	            name: '广州',
            	            type: 'map',
            	            mapType: 'china',
            	            data:[],
            	            markLine : {
            	                smooth:true,
            	                effect : {
            	                    show: true,
            	                    scaleSize: 1,
            	                    period: 30,
            	                    color: '#fff',
            	                    shadowBlur: 10
            	                },
            	                itemStyle : {
            	                    normal: {
            	                        borderWidth:1,
            	                        label: {
            	                            show: false
            	                        },
            	                        lineStyle: {
            	                            type: 'solid',
            	                            shadowBlur: 10
            	                        }
            	                    }
            	                },
            	                data : [
            	                    [{name:'上海', smoothness:0.2}, {name:'广州',value:95}],
            	                    [{name:'上海', smoothness:0.3}, {name:'广州',value:90}],
            	                    [{name:'上海', smoothness:0.4}, {name:'广州',value:80}],
            	                    [{name:'上海', smoothness:0.5}, {name:'广州',value:70}],
            	                    [{name:'上海', smoothness:0.6}, {name:'广州',value:60}],
            	                    [{name:'广州', smoothness:0.2}, {name:'上海',value:50}],
            	                    [{name:'广州', smoothness:0.3}, {name:'上海',value:40}],
            	                    [{name:'广州', smoothness:0.4}, {name:'上海',value:30}],
            	                    [{name:'广州', smoothness:0.5}, {name:'上海',value:20}],
            	                    [{name:'广州', smoothness:0.6}, {name:'上海',value:10}]
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
