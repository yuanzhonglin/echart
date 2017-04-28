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
              
            function createRandomItemStyle() {
                return {
                    normal: {
                        color: 'rgb(' + [
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160)
                        ].join(',') + ')'
                    }
                };
            }

            option = {
                title: {
                    text: 'Google Trends',
                    link: 'http://www.google.com/trends/hottrends'
                },
                tooltip: {
                    show: true
                },
                series: [{
                    name: 'Google Trends',
                    type: 'wordCloud',
                    size: ['80%', '80%'],
                    textRotation : [0, 45, 90, -45],
                    textPadding: 0,
                    autoSize: {
                        enable: true,
                        minSize: 14
                    },
                    data: [
                        {
                            name: "Sam S Club",
                            value: 10000,
                            itemStyle: {
                                normal: {
                                    color: 'black'
                                }
                            }
                        },
                        {
                            name: "Macys",
                            value: 6181,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Amy Schumer",
                            value: 4386,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Jurassic World",
                            value: 4055,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Charter Communications",
                            value: 2467,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Chick Fil A",
                            value: 2244,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Planet Fitness",
                            value: 1898,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Pitch Perfect",
                            value: 1484,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Express",
                            value: 1112,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Home",
                            value: 965,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Johnny Depp",
                            value: 847,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Lena Dunham",
                            value: 582,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Lewis Hamilton",
                            value: 555,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "KXAN",
                            value: 550,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Mary Ellen Mark",
                            value: 462,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Farrah Abraham",
                            value: 366,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Rita Ora",
                            value: 360,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Serena Williams",
                            value: 282,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "NCAA baseball tournament",
                            value: 273,
                            itemStyle: createRandomItemStyle()
                        },
                        {
                            name: "Point Break",
                            value: 265,
                            itemStyle: createRandomItemStyle()
                        }
                    ]
                }]
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
