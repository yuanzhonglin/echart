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
              
            var heatData = [];
            for (var i = 0; i < 200; ++i) {
                heatData.push([
                    100 + Math.random() * 20,
                    24 + Math.random() * 16,
                    Math.random()
                ]);
            }
            for (var j = 0; j < 10; ++j) {
                var x = 100 + Math.random() * 16;
                var y = 24 + Math.random() * 12;
                var cnt = 30 * Math.random();
                for (var i = 0; i < cnt; ++i) {
                    heatData.push([
                        x + Math.random() * 2,
                        y + Math.random() * 2,
                        Math.random()
                    ]);
                }
            }

            option = {
                backgroundColor: '#1b1b1b',
                title : {
                    text: '热力图结合地图',
                    x:'center',
                    textStyle: {
                        color: 'white'
                    }
                },
                tooltip : {
                    trigger: 'item',
                    formatter: '{b}'
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
                series : [
                    {
                        name: '北京',
                        type: 'map',
                        mapType: 'china',
                        roam: true,
                        hoverable: false,
                        data:[],
                        heatmap: {
                            minAlpha: 0.1,
                            data: heatData
                        },
                        itemStyle: {
                            normal: {
                                borderColor:'rgba(100,149,237,0.6)',
                                borderWidth:0.5,
                                areaStyle: {
                                    color: '#1b1b1b'
                                }
                            }
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
