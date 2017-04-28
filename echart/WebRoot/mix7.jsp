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
              
         // 虚拟构造同横纵坐标的两组数据
            var sData1 = (function () {
                var d = [];
                var len = 40;
                var value;
                while (len--) {
                    d.push([
                        Math.round(Math.random()*10) * (Math.round(Math.random()*10) > 5 ? 1 : -1),
                        Math.round(Math.random()*10) * (Math.round(Math.random()*10) > 5 ? 1 : -1),
                        Math.round(Math.random()*20)
                    ]);
                }
                return d;
            })();
            var sData2 = (function () {
                var d = [];
                var len = sData1.length;
                for (var i = 0; i < len; i++) {
                    d.push([
                        sData1[i][0],
                        sData1[i][1],
                        Math.round(Math.random()*15)
                    ]);
                }
                return d;
            })();

            option = {
                color : ['rgba(255, 69, 0, 0.5)', 'rgba(30, 144, 255, 0.5)'],
                title : {
                    text: '饼图代替散点',
                    subtext : '混搭'
                },
                tooltip : {
                    trigger: 'item',
                     formatter: "{b} : {c} ({d}%)"
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
                xAxis : [
                    {
                        type : 'value',
                        splitNumber: 2
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        splitNumber: 2
                    }
                ],
                animation: false,
                series : [
                    {
                        type:'scatter',
                        symbol: 'none',
                        data: sData1
                    },
                    {
                        type:'scatter',
                        symbol: 'none',
                        data: sData2
                    }
                ]
            };

            function buildPieSeries(){
                var xAxis = myChart.component.xAxis.getAxis(0);
                var yAxis = myChart.component.yAxis.getAxis(0);
                var len = sData1.length;
                option.series = option.series.slice(0,2);
                option.legend = {
                    data : ['系列1', '系列2']
                };
                while (len--) {
                    option.series.push({
                        type: 'pie',
                        itemStyle : {
                            normal : {
                                label : {
                                    show : false
                                },
                                labelLine : {
                                    show : false
                                }
                            }
                        },
                        radius : sData1[len][2] + sData2[len][2],
                        center: [
                            xAxis.getCoord(sData1[len][0]), 
                            yAxis.getCoord(sData1[len][1])
                        ],
                        data: [
                            {name: '系列1', value: sData1[len][2]},
                            {name: '系列2', value: sData2[len][2]}
                        ]
                    })
                }
                option.animation = true;
                myChart.setOption(option, true);
                window.onresize = buildPieSeries;
            }
            // 构造出一系列的饼图代替原来的散点，需要在散点画出来后才能获取到散点的坐标，setTimeout！
            setTimeout(buildPieSeries, 100);
            
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
